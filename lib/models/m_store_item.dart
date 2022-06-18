import 'dart:convert';

import '../navigation/k_routes.dart';

class StoreItem {
  Map itemMap;

  StoreItem({required this.itemMap, id})
      : _id = id ?? itemMap['id'],
        _title = itemMap['title'],
        _cost = itemMap['price'],
        _imageUrl = itemMap['image_url'],
        _itemCategory = itemMap['category'];

  final String _id;
  final String _title;
  final String _cost;
  final String _imageUrl;
  final String _itemCategory;

  String get id => _id;

  String get title => _title;

  String get cost => _cost;

  String get imageUrl => _imageUrl;

  String get category => _itemCategory;

  String get baseRoute {
    switch (category) {
      case 'cakes':
        return Routes.cakes;
      case 'cake pops':
        return Routes.cakePops;
      case 'cup cakes':
        return Routes.cupCakes;
      case 'cookies':
        return Routes.cookies;
      case 'other':
        return Routes.other;
      case 'health range':
        return Routes.healthRange;
      default:
        return Routes.other;
    }
  }

  String toJson() {
    return jsonEncode({
      "title": _title,
      "id": _id,
      "price": _cost,
      "image_url": _imageUrl,
      "category": _itemCategory
    });
  }
}
