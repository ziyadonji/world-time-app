import 'package:flutter/material.dart';
import 'package:world_time/services/get_time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<GetTime> location=[
    
    GetTime(location:'India',url: "Asia/Kolkata",flag: 'india.png'),
    GetTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    GetTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    GetTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    GetTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    GetTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    GetTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    GetTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
   GetTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updateTime(index)async{
      GetTime instance=location[index];
      await instance.getTime();
      Navigator.pop(context,{
       'location':instance.location,
       'flag':instance.flag,
       'time':instance.timen,
       "isDay":instance.isDay



      });


  }

  @override
  Widget build(BuildContext context) {
    print("build method ran");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text("choose location"),
          centerTitle: true,
        ),
        body:ListView.builder(itemCount:location.length,itemBuilder:(context,index){
          return Card(child:ListTile(title: Text(location[index].location),
          onTap: (){updateTime(index);
          },
          leading: CircleAvatar(backgroundImage: AssetImage("assets/${location[index].flag}"),),
          ));
        }) );
  }
}
