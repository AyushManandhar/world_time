import 'package:flutter/material.dart';
import 'loading.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : (ModalRoute.of(context)?.settings.arguments) as Map;
    print(data);
    String bgImg = data['isDay']
        ? 'https://us.123rf.com/450wm/iimages/iimages1408/iimages140800500/30783007-ilustration-of-a-view-of-a-green-field.jpg?ver=6'
        : 'https://cdn.pixabay.com/photo/2016/11/25/23/15/moon-1859616__340.jpg';
    Color clr = data['isDay'] ? Colors.blue : Colors.black;
    return Scaffold(
      backgroundColor: clr,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(bgImg),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'flag': result['flag'],
                        'isDay': result['isDay'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Choose Location',
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 2,
                          color: Colors.grey[300],
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 70),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
