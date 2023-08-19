import 'package:bloc/bloc.dart';
import 'package:my_prod_test/screens/user_details/controller/user_details_service.dart';
import 'package:my_prod_test/screens/user_details/model/repo_details.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  final UserDetailsService service;

  UserDetailsCubit(this.service) : super(UserDetailsState.empty());

  void getRepoDetails(String username) async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
    ));

    final either = await service.getUserRepos(username);

    either.fold(
      (l) => emit(state.copyWith(errorMessage: l.toString(), isLoading: false)),
      (r) => emit(state.copyWith(reposResult: r, isLoading: false)),
    );
  }

  void getStarredDetails(String username) async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
    ));

    final either = await service.getUserStarred(username);

    either.fold(
      (l) => emit(state.copyWith(errorMessage: l.toString(), isLoading: false)),
      (r) => emit(state.copyWith(starredResult: r, isLoading: false)),
    );
  }
}
