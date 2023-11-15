import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
    String id;
    String email;
    String user;

    Users({
        required this.id,
        required this.email,
        required this.user,
    });

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        email: json["email"],
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "user": user,
    };
}