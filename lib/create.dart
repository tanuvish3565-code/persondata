import 'package:flutter/material.dart';
import 'package:frontend/services/Api.dart';

class createScreen extends StatefulWidget {
  createScreenState createState() {
    return createScreenState();
  }
}

class createScreenState extends State<createScreen> {

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var AgeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: EdgeInsets.only(left: 150,top: 20),
              child: Text("CREATE",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
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
                  Container(
                    margin: EdgeInsets.only(left: 75,right: 75),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Enter name",
                        hintStyle: TextStyle(
                          color: Colors.blue
                        )
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 75,right: 75),
                    child: TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: "Enter Phone No.",
                        hintStyle: TextStyle(
                          color: Colors.blue
                        )
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 75,right: 75),
                    child: TextField(
                      controller: AgeController,
                      decoration: InputDecoration(
                        hintText: "Enter Your Age",
                        hintStyle: TextStyle(
                          color: Colors.blue
                        )
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsetsGeometry.only(top: 20)),
                  ElevatedButton(onPressed: (){

                    var data = {
                      "pname":nameController.text,
                      "pphone":phoneController.text,
                      "pAge":AgeController.text
                    };
                    
                    Api.addPerson(data);

                  },
                   child: Text("Submit"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
