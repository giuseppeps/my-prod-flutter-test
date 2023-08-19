import 'package:bloc/bloc.dart';
import 'package:my_prod_test/screens/search_user/controller/search_user_service.dart';
import 'package:my_prod_test/screens/search_user/model/git_hub_user.dart';

part 'user_search_state.dart';

class UserSearchCubit extends Cubit<UserSearchState> {
  final SearchUserService service;

  UserSearchCubit(this.service) : super(UserSearchState.empty());

  void searchUser(String username) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, userResult: null));

    final either = await service(username);
    either.fold(
      (l) => emit(state.copyWith(errorMessage: l.toString(), isLoading: false)),
      (r) => emit(state.copyWith(userResult: r, isLoading: false)),
    );
  }

  void emptyUser() {
    emit(UserSearchState.empty());
  }
}
