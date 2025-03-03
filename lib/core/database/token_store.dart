import 'package:shared_preferences/shared_preferences.dart';
import 'package:onr_test/core/database/db.dart';
import 'package:onr_test/core/helper/preferences_helper_user.dart';

class TokenStore {
  TokenStore._internal();

  static final TokenStore _instance = TokenStore._internal();

  static TokenStore get instance => _instance;

  String _token = '';

  String get token => _token;

  final SharedPreferences _sharedPreferences = DB.instance.prefs;

  Future<void> init() async {
    _token = _sharedPreferences.getString(PreferencesHelperUser.token) ?? '';
  }

  Future<void> savedToken({
    required String token,
  }) async {
    await _sharedPreferences.remove(PreferencesHelperUser.token);
    _token = token;
    await _sharedPreferences.setString(PreferencesHelperUser.token, token);
  }

  Future<void> removerToken() async {
    _token = '';
    await _sharedPreferences.setString(PreferencesHelperUser.token, "");
  }
}
