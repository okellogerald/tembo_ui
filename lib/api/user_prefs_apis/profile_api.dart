import '../../models/profile.dart';
import 'user_prefs_api.dart';

class ProfileAPI {
  ProfileAPI._();
  static final instance = ProfileAPI._();

  final _api = UserPreferencesAPI.instance;
  static const _key = "profile";

  Profile? getProfile() {
    try {
      final json = _api.get(_key);
      return Profile.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  Future<void> saveProfile(Profile profile) async {
    await _api.put(_key, profile.toJson());
  }

  Future<void> deleteProfile() => _api.delete(_key);
}
