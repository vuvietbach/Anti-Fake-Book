import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {

  const SearchPage({super.key});

  static const List<String> searchResults = [
    'Search Result 1',
    'Search Result 2',
    'Search Result 3',
    // Add more search results as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Remove AppBar shadow
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){},
          // onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const SearchFieldWithPlaceholder(),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(40.0), // Height of the divider
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center, // Vertically center the content
              children: [
                Text("Tim kiem gan day", style: TextStyle(fontWeight: FontWeight.bold),),
                Spacer(),
                Text("Chinh sua"),
              ],
            ),
          ),
        )
      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: IconButton(icon: const Icon(Icons.search), onPressed: (){}),
            title: Text(searchResults[index]),
          );
        },
      ),
    );
  }
}

class SearchFieldWithPlaceholder extends StatelessWidget {
  const SearchFieldWithPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200], // Grey background color
        hintText: 'Search', // Text placeholder
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderSide: BorderSide.none, // Remove border
          borderRadius: BorderRadius.circular(30.0), // Adjust the border radius
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding
        suffixIcon: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.clear),
    ),
      ),
    );
  }
}

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});
  static List<String> tabs = <String>[
    "Tất cả",
    "Bài viết",
    "Mọi người",
    "Nhóm",
    "Reels",
    "Sự kiện",
    "Video",
    "Ảnh",
    "Trang",
    "Marketplace",
    "Địa điểm"
    // Add more tabs as needed
  ];
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Remove AppBar shadow
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){},
          // onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const SearchFieldWithPlaceholder(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0), // Height of the divider
          child:TabBar(
            isScrollable: true, 
            tabs: tabs.map((String name) => Tab(text: name)).toList()
          ),
        )
      )
    );    
  }
}

