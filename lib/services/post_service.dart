import '../models/post_model.dart';

class PostService {
  static List<Post> getPosts() {
    return [
      Post(
        id: '1',
        userId: '1',
        username: 'johndoe',
        userProfileImageUrl: 'https://i.pravatar.cc/150?img=1',
        imageUrl: 'https://picsum.photos/400/400?random=1',
        caption: 'Beautiful sunset today! 🌅 #sunset #nature',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        likes: 1250,
        comments: ['Amazing!', 'So beautiful!'],
      ),
      Post(
        id: '2',
        userId: '2',
        username: 'janedoe',
        userProfileImageUrl: 'https://i.pravatar.cc/150?img=2',
        imageUrl: 'https://picsum.photos/400/400?random=2',
        caption: 'Coffee and coding ☕️💻',
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
        likes: 890,
        comments: ['Love it!'],
      ),
      Post(
        id: '3',
        userId: '3',
        username: 'traveler',
        userProfileImageUrl: 'https://i.pravatar.cc/150?img=3',
        imageUrl: 'https://picsum.photos/400/400?random=3',
        caption: 'New adventure begins! ✈️',
        timestamp: DateTime.now().subtract(const Duration(hours: 8)),
        likes: 2100,
        comments: ['Where is this?', 'Amazing view!'],
      ),
      Post(
        id: '4',
        userId: '4',
        username: 'foodie',
        userProfileImageUrl: 'https://i.pravatar.cc/150?img=4',
        imageUrl: 'https://picsum.photos/400/400?random=4',
        caption: 'Delicious brunch! 🍳',
        timestamp: DateTime.now().subtract(const Duration(hours: 12)),
        likes: 567,
        comments: ['Looks yummy!'],
      ),
      Post(
        id: '5',
        userId: '5',
        username: 'photographer',
        userProfileImageUrl: 'https://i.pravatar.cc/150?img=5',
        imageUrl: 'https://picsum.photos/400/400?random=5',
        caption: 'Golden hour magic ✨',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        likes: 3200,
        comments: ['Stunning!', 'Perfect shot!'],
      ),
    ];
  }
}
