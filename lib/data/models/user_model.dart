class UserModel {
  final String uid;
  final String name;
  final String email;
  final String? image;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.image,
  });

  // 🔄 From Firebase
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      image: map['image'],
    );
  }

  // 🔼 To Firebase
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'image': image,
    };
  }
}