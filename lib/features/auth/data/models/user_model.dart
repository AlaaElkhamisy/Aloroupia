import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  String? name;
  String? email;
  String? birthDate;
  String? password;
  String? profileImage;

  UserModel({
    this.name,
    this.email,
    this.birthDate,
    this.password,
    this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"] as String?,
    email: json["email"] as String?,
    password: json["password"] as String?,
    birthDate: json["birthDate"] as String?,
    profileImage: json["profileImage"] as String?,
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "birthDate": birthDate,
    "profileImage": profileImage,
  };
  @override
  List<Object?> get props => [name, email, birthDate, password, profileImage];
}
