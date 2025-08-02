import 'dart:convert';

class Item {
  final String title;
  final String searchText;
  final String categories;
  final double price;
  final List<Map<String, dynamic>> images;

  Item({
    required this.title,
    required this.searchText,
    required this.categories,
    required this.price,
    required this.images,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    // Decode image string to List<Map<String, dynamic>>
    List<Map<String, dynamic>> imageList = [];

    try {
      final cleanedJson = (json['images'] as String?)
          ?.replaceAllMapped(
            RegExp(r"([{,])\s*'([^']+?)'\s*:\s*'([^']*?)'\s*"),
            (match) =>
                '${match.group(1)}"${match.group(2)}":"${match.group(3)}"',
          )
          .replaceAll("'", '"');

      if (cleanedJson != null) {
        final parsed = List<Map<String, dynamic>>.from(
          (jsonDecode(cleanedJson) as List).map(
            (e) => Map<String, dynamic>.from(e),
          ),
        );
        imageList = parsed;
      }
    } catch (e) {
      // fallback or log error
    }

    return Item(
      title: json['title'] ?? '',
      searchText: json['search_text'] ?? '',
      categories: json['categories'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      images: imageList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'search_text': searchText,
      'categories': categories,
      'price': price,
      'images': jsonEncode(images),
    };
  }
}
