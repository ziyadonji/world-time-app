import 'package:flutter/material.dart';

import "package:world_time/services/get_time.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> worldTime() async {
    GetTime instance = GetTime(
        flag: "india.png", location: 'India', url: 'Asia/kolkata');
    await instance.getTime();
     Navigator.pushReplacementNamed(context, '/home',arguments: {
       'location':instance.location,
       'flag':instance.flag,
       'time':instance.timen,
       "isDay":instance.isDay

     });
  }

  @override
  void initState() {
    super.initState();
    worldTime();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 50.0,
          
        ),
      ),
    );
  }
}
