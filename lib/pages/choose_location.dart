import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url: 'Asia/Kathmandu',
        location: 'Kathmandu',
        flag:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Flag_of_Nepal.svg/492px-Flag_of_Nepal.svg.png?20220624145756'),
    WorldTime(
        url: 'Europe/London',
        location: 'London',
        flag:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMlptUbElra7iAGQm85Kz2RtTaCboi2yGQH3LBhcYUSQ&s'),
    WorldTime(
        url: 'Europe/Berlin',
        location: 'Athens',
        flag:
            'https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Flag_of_Germany.svg/1024px-Flag_of_Germany.svg.png'),
    WorldTime(
        url: 'Africa/Cairo',
        location: 'Cairo',
        flag:
            'https://cdn.pixabay.com/photo/2015/11/12/16/23/flag-1040586_960_720.png'),
    WorldTime(
        url: 'Africa/Nairobi',
        location: 'Nairobi',
        flag: 'https://cdn.britannica.com/15/15-004-B5D6BF80/Flag-Kenya.jpg'),
    WorldTime(
        url: 'America/Chicago',
        location: 'Chicago',
        flag:
            'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1200px-Flag_of_the_United_States.svg.png'),
    WorldTime(
        url: 'America/New_York',
        location: 'New York',
        flag:
            'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1200px-Flag_of_the_United_States.svg.png'),
    WorldTime(
        url: 'Asia/Seoul',
        location: 'Seoul',
        flag:
            'https://asiasociety.org/sites/default/files/styles/1200w/public/K/korean-flag.jpg'),
    WorldTime(
        url: 'Asia/Jakarta',
        location: 'Jakarta',
        flag:
            'https://cdn.britannica.com/48/1648-004-A33B72D8/Flag-Indonesia.jpg'),
  ];
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
