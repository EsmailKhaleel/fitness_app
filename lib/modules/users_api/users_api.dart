import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:packages_app/modules/users_api/models/user_model.dart';

class UsersApi {
  static Future<List<User>> getUsersLocally(BuildContext context) async {
    //provide to load data from asset
    final assetBundle = DefaultAssetBundle.of(context);
    //loading data
    final data =
        await assetBundle.loadString('assets/localUserData/users.json');
    //convert data to json
     final userMap = json.decode(data);

    return userMap.map<User>(User.fromJson).toList() as List<User>;
  }
}
