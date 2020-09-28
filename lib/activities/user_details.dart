import 'package:flutter/material.dart';
import 'package:flutter_json/models/user_model.dart';

class UserDetails extends StatelessWidget {

  UserModel user;

  int position;

  UserDetails(this.user, this.position);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: showDetails(),
    );
  }

  Column showDetails(){
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FittedBox(
              fit: BoxFit.fill,
              child: Image(
                image: NetworkImage(
                    user.picture+"$position.jpg"
                ),
              ),
            ),
          ],
        ),
        Text(user.about)
      ],
    );
  }

}
