import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<String> _isimler = [
    'Abim',
    'Amcam',
    'Annem',
    'Babam',
    'Cengizhan',
    'Dayim',
    'Dedem',
    'Enistem',
    'Gamze',
    'Halam'
  ];
  List<Color> _renkler = [
    Colors.blue,
    Colors.orange,
    Colors.teal,
    Colors.purple,
    Colors.limeAccent,
    Colors.grey,
    Colors.red,
    Colors.pink,
    Colors.green,
    Colors.brown
  ];

  int _currentIndex = 1;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _isimler.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {},
                title: Text(
                  _isimler[index],
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundColor: _renkler[index],
                  radius: 24,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
