import 'package:dartz/dartz.dart';
import 'package:my_prod_test/screens/search_user/controller/search_user_repository.dart';
import 'package:my_prod_test/screens/search_user/model/git_hub_user.dart';

class SearchUserService {
  final SearchUserRepository repository;

  SearchUserService(this.repository);

  Future<Either<Exception, GitHubUser>> call(String username) async {
    try {
      final user = await repository.searchUser(username);
      return Right(user);
    } catch (e) {
      return Left(Exception('Failed to search user: $e'));
    }
  }
}
