import 'package:dartz/dartz.dart';
import 'package:my_prod_test/screens/user_details/controller/user_details_repository.dart';
import 'package:my_prod_test/screens/user_details/model/repo_details.dart';

class UserDetailsService {
  final UserDetailsRepository repository;

  UserDetailsService(this.repository);

  Future<Either<Exception, List<RepoDetails>>> getUserRepos(
      String username) async {
    try {
      final repo = await repository.getUserRepos(username);
      return Right(repo);
    } catch (e) {
      return Left(Exception('Failed to search user: $e'));
    }
  }

  Future<Either<Exception, List<RepoDetails>>> getUserStarred(
      String username) async {
    try {
      final repo = await repository.getUserStarred(username);
      return Right(repo);
    } catch (e) {
      return Left(Exception('Failed to search user: $e'));
    }
  }
}
