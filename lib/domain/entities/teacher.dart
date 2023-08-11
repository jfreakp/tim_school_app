import 'dart:convert';
class Teacher {
    final int id;
    final String firstName;
    final String lastName;
    final String email;
    final String cellPhone;
    final String phone;
    final int status;

    Teacher({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.cellPhone,
        required this.phone,
        required this.status,
    });
    factory Teacher.fromRawJson(String str) => Teacher.fromJson(json.decode(str));

    factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        cellPhone: json["cell_phone"],
        phone: json["phone"],
        status: int.parse(json["status"]),
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