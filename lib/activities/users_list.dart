import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json/activities/user_details.dart';
import 'package:flutter_json/models/user_model.dart';
import 'package:flutter_json/utils/variables.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


class UsersList extends StatefulWidget {
  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter JSON App"),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: usersList(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return showUsers(snapshot.data);
          }else {
            return Center(
              child: Text("no data found"),
            );
          }
        },
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<List<UserModel>> usersList()async{
    var response = await http.get(Variables.getUsers);
    var jsonData = json.decode(response.body);
    List<UserModel> usersList = List<UserModel>();
    for(var userData in jsonData){
      UserModel user = UserModel.fromMap(userData);
      usersList.add(user);
    }
    return usersList;
  }

  ListView showUsers(List<UserModel> usersList){
    return ListView.builder(
        itemCount: usersList.length,
        itemBuilder: (context, position){
          UserModel user = usersList[position];
          return Card(
            child: Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return UserDetails(user, position);
                    }
                  ));
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    user.picture+"$position.jpg",
                  ),
                ),
                title: Text(user.name),
                subtitle: Text(user.email),
              ),
            ),
          );
        }
    );
  }
}
