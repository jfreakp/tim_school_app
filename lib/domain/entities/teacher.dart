import 'dart:convert';

Teacher teacherFromJson(String str) => Teacher.fromJson(json.decode(str));
String teacherToJson(Teacher data) => json.encode(data.toJson());

class Teacher {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String? cellPhone;
  final String? phone;
  final int status;

  Teacher({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.cellPhone,
    this.phone,
    required this.status,
  });

  Teacher copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? cellPhone,
    String? phone,
    int? status,
  }) =>
      Teacher(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        cellPhone: cellPhone ?? this.cellPhone,
        phone: phone ?? this.phone,
        status: status ?? this.status,
      );

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        cellPhone: json["cell_phone"],
        phone: json["phone"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "cell_phone": cellPhone,
        "phone": phone,
        "status": status,
      };
}
