import 'package:time_zero/models/user_model.dart';

const baseUrl = "https://staging.api.abicalc.de/api/v2/web/";

class ApiClient {
  Future<User> loadUserData() async {
    return User(id: '1');
  }
}
