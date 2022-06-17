import 'dart:convert';

class FeedItem {
  Map itemMap;

  FeedItem({required this.itemMap, id})
      : _id = id ?? itemMap['id'],
        _title = itemMap['title'],
        _imageUrl = itemMap['image_url'],
        _instaUrl = itemMap['insta_link'];

  final String _id;
  final String _title;
  final String _imageUrl;
  final String _instaUrl;

  String get id => _id;

  String get title => _title;

  String get imageUrl => _imageUrl;

  String get instaUrl => _instaUrl;

  String toJson() {
    return jsonEncode({
      "title": _title,
      "id": _id,
      "image_url": _imageUrl,
      "insta_link": _instaUrl,
    });
  }
}
