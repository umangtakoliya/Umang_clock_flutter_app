import 'package:demo/screen/analog_watch.dart';
import 'package:demo/screen/strap_watch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true,),
    //
    debugShowCheckedModeBanner: false,

    home: analog_watch(),
  ));
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int h=0;
  int s=0;
  int m=0;

  myclock(){
    Future.delayed(Duration(seconds: 1), (){
      setState(() {
        h = DateTime.now().hour % 12;
        s = DateTime.now().second;
        m = DateTime.now().minute;
      });
      myclock();
    });
  }
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myclock();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("clock App"),
        centerTitle: true,

      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(angle: 0,
            child: Container(
              height: 200,
              width: 200,
              decoration:BoxDecoration(borderRadius:BorderRadius.circular(30),color: Colors.black,),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Row(
                      children: [
                        Text(
                          "${h}",
                          style: TextStyle(color: Colors.white),

                        ),
                        SizedBox(width: 20,),
                        Text(
                          "${m}",
                          style: TextStyle(color: Colors.white),


                        ),
                        SizedBox(width: 20,),
                        Text(
                          "${s}",
                          style: TextStyle(color: Colors.white),

                        ),
                        SizedBox(width: 20,),
                       //
                      ],
                    ),
              ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
