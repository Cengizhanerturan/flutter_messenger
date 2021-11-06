import 'package:flutter_messenger/home_page.dart';
import 'package:flutter_messenger/messages_page.dart';
import 'package:flutter_messenger/settings_page.dart';
import 'package:flutter_messenger/users_page.dart';
import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class Pages extends StatefulWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.grey.shade300,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 350),
      animateChildDecoration: true,
      openRatio: 0.6,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.black87,
            iconColor: Colors.black87,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    Container(
                      width: 128.0,
                      height: 128.0,
                      margin: const EdgeInsets.only(
                        top: 24.0,
                        bottom: 10,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        shape: BoxShape.circle,
                      ),
                      child: Text('Text'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Center(
                        child: Text(
                          'User name',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Divider(
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      currentPage = 0;
                      _advancedDrawerController.hideDrawer();
                    });
                  },
                  leading: Icon(Icons.home),
                  title: Text('Anasayfa'),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      currentPage = 1;
                      _advancedDrawerController.hideDrawer();
                    });
                  },
                  leading: Icon(Icons.phone),
                  title: Text('Rehber'),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      currentPage = 2;
                      _advancedDrawerController.hideDrawer();
                    });
                  },
                  leading: Icon(Icons.mail),
                  title: Text('Mesajlar'),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      currentPage = 3;
                      _advancedDrawerController.hideDrawer();
                    });
                  },
                  leading: Icon(Icons.settings),
                  title: Text('Ayarlar'),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
          title: Text(
            'Flutter Project',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          actions: [
            Icon(Icons.notifications_active),
            Padding(
              padding: EdgeInsets.only(right: 10.0, left: 8.0),
              child: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                radius: 20,
              ),
            ),
          ],
        ),
        body: Container(
          child: _getPage(currentPage),
        ),
        bottomNavigationBar: FancyBottomNavigation(
          circleColor: Colors.black87,
          activeIconColor: Colors.white,
          textColor: Colors.black87,
          inactiveIconColor: Colors.black87,
          tabs: [
            TabData(
              iconData: Icons.home,
              title: "Anasayfa",
              onclick: () {},
            ),
            TabData(
              iconData: Icons.phone,
              title: "Rehber",
              onclick: () {},
            ),
            TabData(
              iconData: Icons.mail,
              title: "Mesajlar",
              onclick: () {},
            ),
            TabData(
              iconData: Icons.settings,
              title: "Ayarlar",
              onclick: () {},
            ),
          ],
          initialSelection: 0,
          key: bottomNavigationKey,
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
            });
          },
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    //_advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return Container(
          child: HomePage(),
        );
      case 1:
        return Container(
          child: UsersPage(),
        );
      case 2:
        return Container(
          child: MessagesPage(),
        );
      case 3:
        return Container(
          child: SettingsPage(),
        );
      default:
        return Container(
          child: Center(
            child: Text(
              '404 - Sayfa bulunamadı!',
            ),
          ),
        );
    }
  }
}
