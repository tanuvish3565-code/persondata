import 'package:flutter/material.dart';
import 'package:frontend/create.dart';
import 'package:frontend/edit_screen.dart';
import 'package:frontend/models/person_model.dart';
import 'package:frontend/services/Api.dart';

class updateScreen extends StatefulWidget {
  updateScreenState createState() {
    return updateScreenState();
  }
}

class updateScreenState extends State<updateScreen> {


   late Future _personFuture;

   @override
  void initState() {
    super.initState();
    _personFuture = Api.getPerson(); // step 2 - fetch once on screen load
  }


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
              child: FutureBuilder(
                future: _personFuture,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator()); // loading spinner
                  }
                  if (snapshot.hasData) {
                    List<Person> pdata = snapshot.data;

                    return ListView.builder(
                      itemCount: pdata.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                          decoration: BoxDecoration(
                            
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: ListTile(
                            leading: Icon(Icons.person_2_rounded, size: 35),
                            title: Text("Name : ${pdata[index].name}"),
                            subtitle: Text("Phone : ${pdata[index].phone}, Age : ${pdata[index].Age}"),
                            trailing: IconButton(onPressed: 
                            (){
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_)=>editScreen(data: pdata[index]))).then((_){
                                  setState(() {
                                    _personFuture = Api.getPerson();
                                  });
                                });
                            },
                             icon: Icon(Icons.edit) 
                             ),
                          ),
                        );
                      },
                    );
                  } else {
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
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
