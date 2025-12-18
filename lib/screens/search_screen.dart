import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _suggestions = [
    'johndoe',
    'janedoe',
    'traveler',
    'foodie',
    'photographer',
    'artist',
    'developer',
    'designer',
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
          ),
        ),
      ),
      body: _searchController.text.isEmpty
          ? _buildExploreGrid()
          : _buildSearchResults(),
    );
  }

  Widget _buildExploreGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(2),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: 30,
      itemBuilder: (context, index) {
        return CachedNetworkImage(
          imageUrl: 'https://picsum.photos/400/400?random=$index',
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: Colors.grey[300],
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey[300],
            child: const Icon(Icons.error),
          ),
        );
      },
    );
  }

  Widget _buildSearchResults() {
    return ListView.builder(
      itemCount: _suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = _suggestions[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: CachedNetworkImageProvider(
              'https://i.pravatar.cc/150?img=$index',
            ),
          ),
          title: Text(
            suggestion,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: const Text('Suggested for you'),
          trailing: TextButton(
            onPressed: () {},
            child: const Text(
              'Follow',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        );
      },
    );
  }
}
