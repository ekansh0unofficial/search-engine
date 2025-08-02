import 'package:flutter/material.dart';
import 'package:search_engine/api/search_api.dart';
import 'package:search_engine/home/itemcard.dart';
import 'package:search_engine/model/item.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with TickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  late final PageController _pageController;
  late final AnimationController _animationController;

  List<Item> _items = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _search() async {
    final query = _controller.text.trim();
    if (query.isEmpty) return;

    setState(() => _isLoading = true);

    final api = SearchApi();
    final results = await api.searchItem(query);

    setState(() {
      _items = results;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Engine")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Enter search keyword...",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _search,
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          if (_isLoading)
            const Center(child: CircularProgressIndicator())
          else if (_items.isEmpty)
            const Expanded(child: Center(child: Text("No results found.")))
          else
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) => ItemCard(item: _items[index]),
              ),
            ),
        ],
      ),
    );
  }
}
