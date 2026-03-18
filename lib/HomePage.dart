import 'package:flutter/material.dart';
import 'package:frontend/create.dart';
import 'package:frontend/delete_data.dart';
import 'package:frontend/update_data.dart';
import 'display_data.dart';
import 'services/Api.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {


  @override
  void initState() {
    super.initState();
    Api.loadTunnelUrl();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
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
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white54,
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>createScreen()));
                  },
                icon: Icon(Icons.create),
                label: Text("CREATE"),
              ),
              Padding(padding: EdgeInsetsGeometry.only(top: 20)),
              ElevatedButton.icon(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>displayScreen()));
              },
                icon: Icon(Icons.read_more_rounded),
                label: Text("READ"),
              ),
              Padding(padding: EdgeInsetsGeometry.only(top: 20)),

              ElevatedButton.icon(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>updateScreen()));
              },
                icon: Icon(Icons.update),
                label: Text("UPDATE"),
              ),
              Padding(padding: EdgeInsetsGeometry.only(top: 20)),

              ElevatedButton.icon(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>deleteScreen()));
              },
                icon: Icon(Icons.delete),
                label: Text("DELETE"),
              )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
