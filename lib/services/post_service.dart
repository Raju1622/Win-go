import '../models/post_model.dart';

class PostService {
  static List<Post> getPosts() {
    return [
      Post(
        id: '1',
        userId: '1',
        username: 'rahul_sharma',
        userProfileImageUrl: 'https://i.pravatar.cc/150?img=12',
        imageUrl: 'https://picsum.photos/400/400?random=1',
        caption:
            'Taj Mahal ki subah ki khoobsurati! 🌅 #tajmahal #agra #india #travel',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        likes: 1250,
        comments: ['Kya baat hai!', 'Bahut khoobsurat!'],
      ),
      Post(
        id: '2',
        userId: '2',
        username: 'priya_patel',
        userProfileImageUrl: 'https://i.pravatar.cc/150?img=47',
        imageUrl: 'https://picsum.photos/400/400?random=2',
        caption: 'Masala chai aur coding session ☕️💻 #coding #developer #chai',
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
        likes: 890,
        comments: ['Mast hai!', 'Chai lover here!'],
      ),
      Post(
        id: '3',
        userId: '3',
        username: 'arjun_kumar',
        userProfileImageUrl: 'https://i.pravatar.cc/150?img=33',
        imageUrl: 'https://picsum.photos/400/400?random=3',
        caption: 'Goa ki beach vibes! 🏖️ #goa #beach #vacation #india',
        timestamp: DateTime.now().subtract(const Duration(hours: 8)),
        likes: 2100,
        comments: ['Kahan hai ye?', 'Kya view hai!'],
      ),
      Post(
        id: '4',
        userId: '4',
        username: 'ananya_singh',
        userProfileImageUrl: 'https://i.pravatar.cc/150?img=45',
        imageUrl: 'https://picsum.photos/400/400?random=4',
        caption: 'Butter chicken aur naan! 🍛 #foodie #indianfood #delicious',
        timestamp: DateTime.now().subtract(const Duration(hours: 12)),
        likes: 567,
        comments: ['Muh mein paani aa gaya!', 'Recipe share karo!'],
      ),
      Post(
        id: '5',
        userId: '5',
        username: 'vikram_mehta',
        userProfileImageUrl: 'https://i.pravatar.cc/150?img=15',
        imageUrl: 'https://picsum.photos/400/400?random=5',
        caption:
            'Himalayas ki golden hour magic ✨ #himalayas #mountains #photography',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        likes: 3200,
        comments: ['Wah!', 'Perfect shot!'],
      ),
      Post(
        id: '6',
        userId: '6',
        username: 'kavya_reddy',
        userProfileImageUrl: 'https://i.pravatar.cc/150?img=28',
        imageUrl: 'https://picsum.photos/400/400?random=6',
        caption: 'Diwali ki preparation! 🪔 #diwali #festival #india',
        timestamp: DateTime.now().subtract(const Duration(hours: 3)),
        likes: 1890,
        comments: ['Happy Diwali!', 'Beautiful!'],
      ),
      Post(
        id: '7',
        userId: '7',
        username: 'rohan_gupta',
        userProfileImageUrl: 'https://i.pravatar.cc/150?img=19',
        imageUrl: 'https://picsum.photos/400/400?random=7',
        caption: 'Street food in Mumbai! 🍜 #streetfood #mumbai #vadapav',
        timestamp: DateTime.now().subtract(const Duration(hours: 6)),
        likes: 1450,
        comments: ['Yummy!', 'Mumbai vibes!'],
      ),
      Post(
        id: '8',
        userId: '8',
        username: 'neha_jain',
        userProfileImageUrl: 'https://i.pravatar.cc/150?img=50',
        imageUrl: 'https://picsum.photos/400/400?random=8',
        caption:
            'Rajasthani traditional outfit! 👗 #fashion #traditional #rajasthan',
        timestamp: DateTime.now().subtract(const Duration(hours: 10)),
        likes: 2340,
        comments: ['So beautiful!', 'Love the outfit!'],
      ),
    ];
  }
}
