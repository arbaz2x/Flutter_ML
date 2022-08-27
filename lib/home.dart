import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ascii/function.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url= '';
  var data;
  String output ='initial output';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flask App'),

      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 108.0),
          child: Column(
            children: [
              const Text("Enter your alphabet to get ASCII Values:",
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 19,
              ),),

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  onChanged: (value){
                    url='http://10.0.2.2:5000/api?query=' + value.toString();
                  },

                ),
              ),
              TextButton(onPressed: () async{
                data=  await fetchdata(url);
                var decode =jsonDecode(data);
                setState(() {
                  output =decode['output'];
                });
              },
                  child: Container(

                    child: const Text("fetch ascii values",style: TextStyle(
                      color: Colors.black,
                    ),),
                  )
              ),


              Text(

                output,style: const TextStyle(
                color: Colors.greenAccent,
                fontSize: 27,
              ),)
            ],

          ),
        ) ,
      ),
    );
  }
}
