class Contact {
  final String name;
  final String email;

  Contact({required this.name, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }
}
