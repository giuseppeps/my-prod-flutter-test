import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_prod_test/screens/search_user/model/git_hub_user.dart';

class SearchUserRepository {
  Future<GitHubUser> searchUser(String username) async {
    final response = await http.get(
      Uri.parse('https://api.github.com/users/$username'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      return GitHubUser.fromJson(jsonMap);
    } else {
      throw Exception(
        'Failed to search user. Status code: ${response.statusCode}',
      );
    }
  }
}
