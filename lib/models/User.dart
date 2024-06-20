class User {
  final int userId;
  final String fullName;
  final String email;
  final String password;
  final String location;
  final String phone;
  final String role;
  final String registeredDate;

  User({
    required this.userId, 
    required this.fullName, 
    required this.email, 
    required this.password,
    required this.location,
    required this.phone, 
    required this.role, 
    required this.registeredDate
  });

  factory User.fromJson(Map<String, dynamic>  json){
    return User(
      userId: json['userId'] ?? 0, 
      fullName: json['fullName'] ?? '', 
      email: json['email'] ?? '', 
      password: json['password'] ?? '',
      location: json['location'] ?? '',
      phone: json['phone'] ?? '', 
      role: json['role'] ?? '', 
      registeredDate: json['registeredDate'] ?? ''
    );
  }

  static Map<String, dynamic> toJson(
      String username,
      String email,
      String location,
      String phone,
      String password,
      String role
  ){
    return{ 
      'fullName': username,
      'email': email,
      'password': password,
      'location': location,
      'phone': phone,
      'role': role
    };
  }
}