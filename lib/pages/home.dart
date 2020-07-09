import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    String img=data['isDay']? 'day.jpg':'night.jpg';
    Color col=data['isDay']?Colors.blue :Colors.indigo[600];

    return Scaffold(
      backgroundColor: col,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image:DecorationImage(image: AssetImage("assets/$img"),
            fit: BoxFit.fill),
            
          ),
          child: Padding(
            padding: const EdgeInsets.only(top:150),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async{
                      dynamic result= await Navigator.pushNamed(context, '/location');
                      setState(() {
                         data["location"]=result['location'];
                      data["time"]=result['time'];
                       data["isDay"]=result['isDay'];
                        data["flag"]=result['flag'];

                        
                      });
                     
                    },
                    icon: Icon(Icons.edit_location,color: Colors.grey[200],),
                    label: Text('edit location',
                    
                    style: TextStyle(color: Colors.grey[200],letterSpacing: 1.5,fontFamily: 'Cutive',fontWeight:FontWeight.bold,fontSize: 20),)),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],
                    style: TextStyle(fontSize:30,fontFamily:"Cutive",letterSpacing:1.5,color: Colors.grey[100],fontWeight:FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 30),
                CircleAvatar(backgroundImage: AssetImage('assets/${data["flag"]}'),radius: 50,),
               
                SizedBox(height:20),
                Text(data['time'],
                style: TextStyle(fontSize:60,fontFamily: 'Cutive',color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
