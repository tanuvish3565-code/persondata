import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/models/person_model.dart';
import 'package:http/http.dart' as http;

class Api{



  static const String gistUrl = "https://gist.githubusercontent.com/tanuvish3565-code/ba3412d380100a1fdaaaff043d80e92d/raw/tunnel.json";
  static String? _cachedUrl;
  static String? baseUrl;
  static Future<void> loadTunnelUrl() async {
    try{
      final res = await http.get(Uri.parse("$gistUrl?t=${DateTime.now().millisecondsSinceEpoch}")).timeout(const Duration(seconds: 10));

      if(res.statusCode == 200){
        final data = jsonDecode(res.body);
        _cachedUrl = data['url'];
        print(_cachedUrl);
        baseUrl = "$_cachedUrl/api/";
        print(baseUrl);
      }
    }catch(e){
      print('Error: $e');
    }
  }

  // static const baseUrl = "http://localhost:3000/api/";


  //POST API
  static addPerson(Map pdata) async {

    print(pdata);
    var url = Uri.parse("${baseUrl!}add_person");

    try{
    final res = await http.post(url,body: pdata);

    if(res.statusCode == 200){

      var data = jsonDecode(res.body.toString());

      print(data);

    }else{

      print("Failed to upload data");
    }
    } catch(e){
      debugPrint(e.toString());
    }   
  }


  //GET API
  static getPerson() async {

    List<Person> person = [];

    var url = Uri.parse("${baseUrl}get_person");
    
    try {
      final res = await http.get(url);

      if(res.statusCode == 200){

        var data = jsonDecode(res.body);
        print(data);
        data['person']?.forEach((value)=>{

          person.add(
            Person(
              name:value['pname'],
              phone: value['pphone'],
              Age: value['pAge'],
              id: value['id'].toString()
            )
          )
        });

        return person;

      }else{
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }


  static updatePerson(id,body1) async {

    var url = Uri.parse("$baseUrl"+"update/$id");

    final res = await http.put(url,body: body1);

    if(res.statusCode == 200){
      print(jsonDecode(res.body));

    }else{
      print('Failed to load data!');
    }
  }


  //DELETE METHOD

  static deletePerson(id) async {

    var url = Uri.parse('${baseUrl!}delete/$id');

    try{

      final res = await http.delete(url);

      if(res.statusCode == 200){
        print('Successfully deleted person');
      }else{
        print('Failed to delete person');
      }
    }catch(e){
      debugPrint('$e');
    }

  }
}