import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class GetTime{
String location; //location that user see in the ui
String timen; //time at that location
String flag;
String url;
bool isDay;

Future<void> getTime() async {
  try{ Response response =
        await get('http://worldtimeapi.org/api/timezone/$url');

    Map time = jsonDecode(response.body);
    var now = DateTime.parse(time["datetime"]);
    now = now.add(Duration(
        hours: int.parse(time['utc_offset'].substring(1, 3)),
        minutes: int.parse(time['utc_offset'].substring(4, 6))));
        
        timen=DateFormat.jm().format(now);
    isDay=now.hour>5 &&now.hour<20 ? true:false;
    print(isDay);
    
    
  }

  catch(e){
      print('error is &e');
      timen='time could not load';

  }
  
  
  
  }
  
   
  GetTime({this.location,this.timen,this.url,this.flag});
    
  



}