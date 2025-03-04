import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCustomerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f7f7),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // Set the height
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
          ),
          child: AppBar(
            backgroundColor: Color(0xFF0E606E),
            foregroundColor: Colors.white,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.location_on, color: Colors.white),
                SizedBox(width: 5),
                Text(
                  "Raipur (C.G.)",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent Orders",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.orange),
            ),
            SizedBox(height: 10),
            Expanded( // This ensures the list takes up available space
              child: ListView.builder(
                itemCount: 6, // Number of items
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange.shade100,
                        child: Icon(Icons.person_2_rounded, color: Color(0xFF0e606e),),
                      ),
                      title: Text("Full Name", style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600, color: Color(0xFF0e606e)),),
                      subtitle: Text("1234567890", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600,color: Colors.black45),),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("04-03-2025", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xFF0e606e))),
                          Text("12:30 PM",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color: Colors.orange.shade800)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
