class Post {
  final String id;
  final String userId;
  final String username;
  final String userProfileImageUrl;
  final String imageUrl;
  final String caption;
  final DateTime timestamp;
  final int likes;
  final List<String> comments;
  final bool isLiked;

  Post({
    required this.id,
    required this.userId,
    required this.username,
    required this.userProfileImageUrl,
    required this.imageUrl,
    required this.caption,
    required this.timestamp,
    required this.likes,
    required this.comments,
    this.isLiked = false,
  });

  Post copyWith({
    String? id,
    String? userId,
    String? username,
    String? userProfileImageUrl,
    String? imageUrl,
    String? caption,
    DateTime? timestamp,
    int? likes,
    List<String>? comments,
    bool? isLiked,
  }) {
    return Post(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      userProfileImageUrl: userProfileImageUrl ?? this.userProfileImageUrl,
      imageUrl: imageUrl ?? this.imageUrl,
      caption: caption ?? this.caption,
      timestamp: timestamp ?? this.timestamp,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
