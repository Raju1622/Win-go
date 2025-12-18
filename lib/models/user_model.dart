class User {
  final String id;
  final String username;
  final String name;
  final String bio;
  final String profileImageUrl;
  final int followers;
  final int following;
  final int posts;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.bio,
    required this.profileImageUrl,
    required this.followers,
    required this.following,
    required this.posts,
  });
}
