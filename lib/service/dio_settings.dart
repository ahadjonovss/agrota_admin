import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioSettings {
  BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: 'https://api.agrotamarket.uz/api/',
    connectTimeout: const Duration(milliseconds: 35000),
    receiveTimeout: const Duration(milliseconds: 33000),
    followRedirects: false,
    validateStatus: (status) => status != null && status <= 500,
  );

  void setBaseOptions({String? lang}) {
    _dioBaseOptions = BaseOptions(
      baseUrl: 'https://api.halefarm.uz/v1',
      connectTimeout: const Duration(milliseconds: 35000),
      receiveTimeout: const Duration(milliseconds: 33000),
      headers: <String, dynamic>{'Accept-Language': lang},
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    );
  }

  BaseOptions get dioBaseOptions => _dioBaseOptions;

  bool get chuck =>
      StorageRepository.getBool(StorageKeys.CHUCK, defValue: false);

  Dio get dio => Dio(_dioBaseOptions)
    ..interceptors.add(LogInterceptor(
      requestBody: kDebugMode,
      request: kDebugMode,
      requestHeader: kDebugMode,
      responseBody: kDebugMode,
      responseHeader: kDebugMode,
      error: kDebugMode,
    ));
}

class StorageRepository {
  static StorageRepository? _storageUtil;
  static SharedPreferences? _preferences;

  static Future<StorageRepository> getInstance() async {
    if (_storageUtil == null) {
      var secureStorage = StorageRepository._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil!;
  }

  StorageRepository._();

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool>? putString(String key, String value) {
    if (_preferences == null) return null;
    debugPrint('writing $key : $value');
    return _preferences!.setString(key, value);
  }

  static Future<bool>? putList(String key, List<String> value) {
    if (_preferences == null) return null;
    debugPrint('writing $key : $value');
    return _preferences!.setStringList(key, value);
  }

  static String getString(String key, {String defValue = ''}) {
    if (_preferences == null) return defValue;

    return _preferences!.getString(key) ?? defValue;
  }

  static Future<bool>? deleteString(String key) {
    if (_preferences == null) return null;
    return _preferences!.remove(key);
  }

  static double getDouble(String key, {double defValue = 0.0}) {
    if (_preferences == null) return defValue;
    return _preferences!.getDouble(key) ?? defValue;
  }

  static List<String> getList(String key, {List<String> defValue = const []}) {
    if (_preferences == null) return List.empty(growable: true);
    return _preferences!.getStringList(key) ?? List.empty(growable: true);
  }

  static Future<bool>? putDouble(String key, double value) {
    if (_preferences == null) return null;
    debugPrint('writing $key : $value');
    return _preferences!.setDouble(key, value);
  }

  static Future<bool>? deleteDouble(String key) {
    if (_preferences == null) return null;
    return _preferences!.remove(key);
  }

  static bool getBool(String key, {bool defValue = false}) {
    if (_preferences == null) return defValue;
    return _preferences!.getBool(key) ?? defValue;
  }

  static Future<bool>? putBool(String key, bool value) {
    if (_preferences == null) return null;
    debugPrint('writing $key : $value');
    return _preferences!.setBool(key, value);
  }

  static Future<bool>? deleteBool(String key) {
    if (_preferences == null) return null;
    return _preferences!.remove(key);
  }
}

// ignore_for_file: constant_identifier_names

class StorageKeys {
  StorageKeys._();

  static const FIRST_TIME_WATCH_REEL = 'is_first_time_watch_reel';
  static const userId = 'user_id';
  static const CHUCK = 'chuck';
  static const isDark = 'isDark';
  static const LANGUAGE = 'language';
  static const TOKEN = 'token';
  static const REFRESH = 'refresh';
  static const ON_BOARDING = 'onboarding';
  static const SEARCH_HISTORY = 'search_history';
  static const USER_CURRENT_LOCATION = 'user_current_location';
  static const CACHED_PRODUCTS_LIST = 'cached_persons_list';
  static const COMPID = 'comp_id';
  static const SPID = 'sp_id';
  static const USERID = 'sp_id';
  static const PRODUCTS = 'org_products';
  static const PRODUCT = 'products';
  static const PRODUCTCOUNT = 'productscounts';
  static const SALES = 'sales';
  static const CATIGORY = 'catigory';
  static const SURCHARGE = 'surcharge';
  static const SUPPLIES = 'supplies';
  static const SPECIALISTS = 'specialists';
  static const SPECIALISTSCOUNT = 'specialistscount';
  static const SPECIALCATS = 'specialcats';
  static const ORDERS = 'orders';
  static const PRSTATUS = 'prstatus';
  static const FINANCE = 'finance';
  static const PAYMENTS = 'payment';
  static const KSPECIAL = 'kspecial';
  static const KPI = 'kpi';
  static const ACCOUNTS = 'accounts';
  static const ProcessStatus = 'processtatus';
  static const CUPONS = 'cupons';
  static const SAVED_CARDS = 'SAVED_CARDS';
  static const IMG_BASE_URL =
      "https://wcreyitsaitgpbvlnbdm.supabase.co/storage/v1/object/public/halalfarm-bucket/";
}
