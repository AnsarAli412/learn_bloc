import 'dart:convert';

StudentsModel studentsModelFromJson(String str) => StudentsModel.fromJson(json.decode(str));

String studentsModelToJson(StudentsModel data) => json.encode(data.toJson());

class StudentsModel {
  int? id;
  String name;
  String email;
  String phone;
  String gender;
  int isMarried;

  StudentsModel({
     this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.isMarried,
  });

  factory StudentsModel.fromJson(Map<String, dynamic> json) => StudentsModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    gender: json["gender"],
    isMarried: json["isMarried"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "gender": gender,
    "isMarried": isMarried,
  };
}
