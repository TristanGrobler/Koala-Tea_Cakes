import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:ktc/models/m_feed_item.dart';
import 'package:rxdart/subjects.dart';

import '../models/m_store_item.dart';
import '../navigation/k_routes.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final fb = FirebaseDatabase.instance;
  static final _storeMap = BehaviorSubject<Map>();
  static final _feedMap = BehaviorSubject<Map>();
  static final _feedItems = BehaviorSubject<List<FeedItem>>();
  static final _cakeItems = BehaviorSubject<List<StoreItem>>();
  static final _cakePopItems = BehaviorSubject<List<StoreItem>>();
  static final _cupCakeItems = BehaviorSubject<List<StoreItem>>();
  static final _cookieItems = BehaviorSubject<List<StoreItem>>();
  static final _otherItems = BehaviorSubject<List<StoreItem>>();
  static final _healthRangeItems = BehaviorSubject<List<StoreItem>>();

  static Stream<Map> get storeItems => _storeMap.stream;
  static Stream<List<FeedItem>> get feedItems => _feedItems.stream;
  static Stream<List<StoreItem>> get cakeItems => _cakeItems.stream;
  static Stream<List<StoreItem>> get cakePopItems => _cakePopItems.stream;
  static Stream<List<StoreItem>> get cupCakeItems => _cupCakeItems.stream;
  static Stream<List<StoreItem>> get cookieItems => _cookieItems.stream;
  static Stream<List<StoreItem>> get otherItems => _otherItems.stream;
  static Stream<List<StoreItem>> get healthRangeItems =>
      _healthRangeItems.stream;

  /// Initialise the helper class and create all needed lists etc.
  static Future<void> init() async {
    await getAllFeedData();
    updateFeedStream();
    await getAllStoreData();
    updateStoreItemsStream(controller: _cakeItems, key: 'cakes');
    updateStoreItemsStream(controller: _cakePopItems, key: 'cake_pops');
    updateStoreItemsStream(controller: _cupCakeItems, key: 'cup_cakes');
    updateStoreItemsStream(controller: _cookieItems, key: 'cookies');
    updateStoreItemsStream(controller: _otherItems, key: 'other');
    updateStoreItemsStream(controller: _healthRangeItems, key: 'health_range');
  }

  ///Download all store data as a map
  static Future<void> getAllStoreData() async {
    DatabaseEvent databaseEvent = await fb.ref('store_items').once();
    DataSnapshot dataSnap = databaseEvent.snapshot;
    Map dataMap = dataSnap.value as Map;
    _storeMap.sink.add(dataMap);
  }

  ///Download all feed data as a map
  static Future<void> getAllFeedData() async {
    DatabaseEvent databaseEvent = await fb.ref('feed').once();
    DataSnapshot dataSnap = databaseEvent.snapshot;
    Map dataMap = dataSnap.value as Map;
    _feedMap.sink.add(dataMap);
  }

  ///Update input stream with input map after converting to list.
  static void updateStoreItemsStream(
      {required StreamController controller, required String key}) {
    Map dataMap = _storeMap.value[key] ?? {};
    List<StoreItem> itemsList = convertToStoreItemList(dataMap);
    controller.sink.add(itemsList);
  }

  ///Update input stream with input map after converting to list.
  static void updateFeedStream() {
    List<FeedItem> itemsList = convertToFeedItemList(_feedMap.value);
    _feedItems.sink.add(itemsList);
  }

  ///Converts input map into list of StoreItems.
  static List<StoreItem> convertToStoreItemList(Map map) {
    List<StoreItem> itemsList = [];
    map.forEach(
        (key, value) => itemsList.add(StoreItem(itemMap: value, id: key)));
    return itemsList;
  }

  ///Converts input map into list of FeedItems.
  static List<FeedItem> convertToFeedItemList(Map map) {
    List<FeedItem> itemsList = [];
    map.forEach(
        (key, value) => itemsList.add(FeedItem(itemMap: value, id: key)));
    return itemsList;
  }
}
