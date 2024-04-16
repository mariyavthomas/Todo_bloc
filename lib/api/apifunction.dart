import 'dart:convert';

import 'package:todobook/api/model.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<Modeltodo>> fetchdata() async {
    try {
      final fetchurl = 'https://api.nstack.in/v1/todos?page=1&limit=10';
      final url = Uri.parse(fetchurl);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.statusCode);
        List json = jsonDecode(response.body)['items'];
        print(json);
        List<Modeltodo> list = json.map((e) => Modeltodo.fromJson(e)).toList();
        print(list);
        return list;
      }
    } catch (e) {
      print('exceptions occured in fetching data');
    }
    throw Exception('failed to fetch data');
  }

  Future<void> createdata(String title, String description) async {
    final body = {
      "title": title,
      "description": description,
      "is_completed": true
    };
    print(body);
    const url = "https://api.nstack.in/v1/todos";
    final uri = Uri.parse(url);
    print("haaaaaa");
    final response = await http.post(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    print("bbbbb");
//print(response.statusCode);
    if (response.statusCode == 201) {
      print(response.body);
    } else {
      print('faild post');
    }
  }

  Future<void> updateapi(String id, String title, String description) async {
    final body = {
      "title": title,
      "description": description,
      "is_completed": false,
    };
    final url = "https://api.nstack.in/v1/todos/$id";
    final uri = Uri.parse(url);
    print(body);

    final response = await http.put(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('faild post');
    }
  }

  Future<void> delete(String id) async {
   final url='https://api.nstack.in/v1/todos/$id';
   final uri =Uri.parse(url);
   final response= await http.delete(uri,headers: {'Content-Type': 'application/json'});
   print('mmmm');
   if(response.statusCode==200){
    print('delete data successfully');
   }
   else{
    print('fail the deletion');
   }
  }
}
