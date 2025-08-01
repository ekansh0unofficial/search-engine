import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          //Search Bar
          TextFormField(
            decoration: InputDecoration(
              label: Text('Search', style: TextStyle(fontSize: 12)),
              hintText: "Search Items here ",
              suffixIcon: GestureDetector(
                onTap: () {},
                child: Icon(Icons.search),
              ),
            ),
            controller: _controller,
          ),

          //List of fetched items
        ],
      ),
    );
  }
}
