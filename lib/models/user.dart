class User {
  String name;
  String profilePicture;

  User({
    this.name,
    this.profilePicture,
  });

  factory User.fromMap(Map data) {
    return User(
      name: data['name'],
      profilePicture: data['profile_picture'],
    );
  }
}
