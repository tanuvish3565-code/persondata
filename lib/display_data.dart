import 'package:flutter/material.dart';
import 'package:frontend/create.dart';
import 'package:frontend/models/person_model.dart';
import 'package:frontend/services/Api.dart';

class displayScreen extends StatefulWidget {
  displayScreenState createState() {
    return displayScreenState();
  }
}

class displayScreenState extends State<displayScreen> {

  late Future _personFuture;

  @override
  void initState() {
    super.initState();
    _personFuture = Api.getPerson(); // add this
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.greenAccent],
                ),
              ),
            ),
            Container(
              child: FutureBuilder(
  future: _personFuture,
  builder: (BuildContext context, AsyncSnapshot snapshot) {

    // Loading
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }

    // Error
    if (snapshot.hasError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Colors.red, size: 48),
            SizedBox(height: 10),
            Text("Failed to load data"),
          ],
        ),
      );
    }

    // Empty
    if (!snapshot.hasData || snapshot.data.isEmpty) {
      return Center(
        child: Text(
          "NO DATA FOUND !",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    // Has data
    List<Person> pdata = snapshot.data;
    return ListView.builder(
      itemCount: pdata.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: ListTile(
            leading: Icon(Icons.person_2_rounded, size: 35),
            title: Text("Name : ${pdata[index].name}"),
            subtitle: Text("Phone : ${pdata[index].phone}"),
            trailing: Text("Age : ${pdata[index].Age}"),
          ),
        );
      },
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
