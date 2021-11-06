import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
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
  List<String> _mesajlar = [
    'Merhaba',
    'Nerelerdesin?',
    'Tamam gelince beni ara.',
    'Tamam geldim ben.',
    'Gorusuruz',
    'Tamamdir.',
    'Seni bekliyorum.',
    ':)',
    'Iyiyim sagol sen nasilsin?',
    'Peki.',
    'Bu mukemmel bir haber!',
    'Aynen oyle...',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _isimler.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                onTap: () {},
                title: Text(
                  _isimler[index],
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  _mesajlar[index],
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
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
