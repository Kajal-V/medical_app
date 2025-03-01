import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
@override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Dashboard'),
       backgroundColor: Colors.blue,
       foregroundColor: Colors.white,
     ),
     body: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
        Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text("Project Summary", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600), textAlign: TextAlign.left,)),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Container(

               child: Text("data"),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black12, width: 1),
                )
             ),
             Container(
               child: Text("data"),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black12, width: 1),
                )
             ),
           ],
         )
       ],
     ),
   );
  }
}