import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = screenWidth > 768;
    final maxWidth = isWeb ? 900.0 : double.infinity;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
        actions: [
          IconButton(
            icon: const Icon(Icons.message_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const TabBar(
                  tabs: [
                    Tab(text: 'Following'),
                    Tab(text: 'You'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildFollowingTab(),
                      _buildYouTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFollowingTab() {
    final activities = [
      {
        'username': 'rahul_sharma',
        'action': 'liked your photo',
        'time': '2 hours ago',
        'image': 'https://picsum.photos/50/50?random=1',
        'profile': 'https://i.pravatar.cc/150?img=12',
      },
      {
        'username': 'priya_patel',
        'action': 'commented on your photo',
        'time': '5 hours ago',
        'image': 'https://picsum.photos/50/50?random=2',
        'profile': 'https://i.pravatar.cc/150?img=47',
      },
      {
        'username': 'arjun_kumar',
        'action': 'started following you',
        'time': '1 day ago',
        'image': null,
        'profile': 'https://i.pravatar.cc/150?img=33',
      },
      {
        'username': 'ananya_singh',
        'action': 'liked your photo',
        'time': '3 hours ago',
        'image': 'https://picsum.photos/50/50?random=4',
        'profile': 'https://i.pravatar.cc/150?img=45',
      },
      {
        'username': 'vikram_mehta',
        'action': 'commented on your photo',
        'time': '6 hours ago',
        'image': 'https://picsum.photos/50/50?random=5',
        'profile': 'https://i.pravatar.cc/150?img=15',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final activity = activities[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: CachedNetworkImageProvider(
                  activity['profile'] as String,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: activity['username'] as String,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' ${activity['action']}'),
                    ],
                  ),
                ),
              ),
              if (activity['image'] != null)
                CachedNetworkImage(
                  imageUrl: activity['image'] as String,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              const SizedBox(width: 8),
              Text(
                activity['time'] as String,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildYouTab() {
    return const Center(
      child: Text(
        'No recent activity',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
    );
  }
}
