class UserModel {
  final String name;
  final String email;
  final String password;
  final String token;
  final String id;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.token,
    required this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      token: json['token'],
      id: json['_id'],
    );
  }
}
