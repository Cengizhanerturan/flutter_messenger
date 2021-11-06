import 'dart:math';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  List<String> _yazi = [
    'Bu nasil bir yer boyle?',
    'Tek kelimeyle mukemmel bir yer!',
    'Harika!',
    'Gormenizi tavsiye ederim.',
    'Inanilmaz bir yer.',
    'Burasi neresi?',
    'Canli canli gormeniz lazim...',
    'Mukemmel!',
    'Hala ne duruyorsunuz?',
    'Cennet cennet...',
    'Eski fotograflar...',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: _renkler[index],
                      radius: 26,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        _isimler[index],
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.more_vert)
                  ],
                ),
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/img${index + 1}.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        _yazi[index],
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: LikeButton(
                        likeCount: Random().nextInt(100),
                        size: 30,
                        circleColor: CircleColor(
                            start: Color(0xff00ddff), end: Color(0xff0099cc)),
                        bubblesColor: BubblesColor(
                          dotPrimaryColor: Color(0xff33b5e5),
                          dotSecondaryColor: Color(0xff0099cc),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black12,
                thickness: 1,
              ),
            ],
          ),
        );
      },
    );
  }
}
