import 'package:flutter/material.dart';
import 'package:google/obteinUser.dart';
import 'package:google/users.dart';

class AppProvider extends ChangeNotifier {

  String user = "";

  final obteinUsers = ObteinUsers();

  List<Users> userList = [];

  bool login( String usuario, String password){

    user = usuario;
    return usuario != "" && usuario == password && password != "";
  }

}

  