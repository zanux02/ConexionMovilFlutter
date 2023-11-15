import 'package:dio/dio.dart';
import 'package:google/users.dart';

class ObteinUsers {
  final _dio = Dio();

  Future<List<Users>> getAnswer() async {
    final response = await _dio.get("https://script.googleusercontent.com/macros/echo?user_content_key=7ahooz2qNk2y5lUrGpaVBclkCih_0lcItJYEJHT-HtLLXhnAXlxwPoH3zTWIs6vLy5QSzCkJP4E-nuSHVkUV140DCfHElB-fOJmA1Yb3SEsKFZqtv3DaNYcMrmhZHmUMWojr9NvTBuBLhyHCd5hHaxHf5r67NtVL87ragDScjGfShX9W6DL99dIVdHJi46Lbd6znmhdcZj33QIO2j0HXpOYsBtWpdTaAtSTmxDX_lS182h1y-xCpIvPAh1_V_er8AyemX4X16K6JCD9yhMyGClAuxydGdxWQgyF8DwS2n8lkXeOL2ByLQFrKrPv75ehIs6FJwAHtW0MXFqzOiEbW0sgQH-NwAMD_&lib=M13uasY8gNObMKr-GZ_21FWkXZ4-wvRIr");

    final List<Users> user = usersFromJson(response.data);

    return user;
  }
}