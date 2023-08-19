import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_prod_test/screens/user_details/model/repo_details.dart';

class UserDetailsRepository {
  Future<List<RepoDetails>> getUserRepos(String username) async {
    final response = await http.get(
      Uri.parse('https://api.github.com/users/$username/repos'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => RepoDetails.fromJson(json)).toList();
    } else {
      throw Exception(
        'Failed to fetch user repos. Status code: ${response.statusCode}',
      );
    }
  }

  Future<List<RepoDetails>> getUserStarred(String username) async {
    final response = await http.get(
      Uri.parse('https://api.github.com/users/$username/starred'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => RepoDetails.fromJson(json)).toList();
    } else {
      throw Exception(
        'Failed to fetch user repos. Status code: ${response.statusCode}',
      );
    }
  }
}
