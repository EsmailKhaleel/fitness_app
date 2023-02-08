// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:packages_app/modules/users_api/users_api.dart';

import 'models/user_model.dart';

class UsersLocalScreen extends StatelessWidget {
  const UsersLocalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<User>>(
        future: UsersApi.getUsersLocally(context),
        builder: (context, snapshot) {
          final users = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text('Some ERROR occured'),
                );
              }
              return buildUsers(users!);
          }
        },
      ),
    );
  }

  Widget buildUsers(List<User> users) => ListView.builder(
        itemCount: users.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.name!),
          );
        },
      );
}
