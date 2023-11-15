
import 'package:flutter/material.dart';
import 'package:google/users.dart';
import 'package:dio/dio.dart';

class AppProvider extends ChangeNotifier {

  String user = "";

  List<Users> userList = [];
  final _dio = Dio();

  bool login( String usuario, String password){

    user = usuario;
    return usuario != "" && usuario == password && password != "";
  }

  Future<bool> validateUser(String email) async {
    var url = "https://script.googleusercontent.com/macros/echo?user_content_key=7ahooz2qNk2y5lUrGpaVBclkCih_0lcItJYEJHT-HtLLXhnAXlxwPoH3zTWIs6vLy5QSzCkJP4E-nuSHVkUV140DCfHElB-fOJmA1Yb3SEsKFZqtv3DaNYcMrmhZHmUMWojr9NvTBuBLhyHCd5hHaxHf5r67NtVL87ragDScjGfShX9W6DL99dIVdHJi46Lbd6znmhdcZj33QIO2j0HXpOYsBtWpdTaAtSTmxDX_lS182h1y-xCpIvPAh1_V_er8AyemX4X16K6JCD9yhMyGClAuxydGdxWQgyF8DwS2n8lkXeOL2ByLQFrKrPv75ehIs6FJwAHtW0MXFqzOiEbW0sgQH-NwAMD_&lib=M13uasY8gNObMKr-GZ_21FWkXZ4-wvRIr";
   
    var response = await _dio.get(url);

    userList = usersFromJson(response.data);

    for (var usuario in userList) {

      if(email == usuario.email)
      {
        return true;
      }
    }
    return false;
  }
}

  