class LoginBody {
  String? email;
  String? password;

  LoginBody();

  void copyWith({
    String? email,
    String? password,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
  }

  Map<String, dynamic> toJson() {
    return {
      if (email != null) 'username': email,
      if (password != null) 'password': password,
    };
  }
}
