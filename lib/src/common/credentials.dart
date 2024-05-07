// ----------------------------------------------------------------------------------
// Author : Corneille Bankole
// GitHub : https://github.com/Corneille9
// ----------------------------------------------------------------------------------

class Credentials {
  final String username;
  final String password;

//<editor-fold desc="Data Methods">
  const Credentials({
    required this.username,
    required this.password,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Credentials &&
          runtimeType == other.runtimeType &&
          username == other.username &&
          password == other.password);

  @override
  int get hashCode => username.hashCode ^ password.hashCode;

  @override
  String toString() {
    return 'Credentials{ username: $username, password: $password,}';
  }

  Credentials copyWith({
    String? username,
    String? password,
  }) {
    return Credentials(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': this.username,
      'password': this.password,
    };
  }

  factory Credentials.fromMap(Map<String, dynamic> map) {
    return Credentials(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

//</editor-fold>
}