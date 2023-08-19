part of 'user_search_cubit.dart';

class UserSearchState {
  final bool isLoading;
  final GitHubUser? userResult;
  final String? errorMessage;

  UserSearchState({
    required this.isLoading,
    this.userResult,
    this.errorMessage,
  });

  factory UserSearchState.empty() => UserSearchState(
        isLoading: false,
        userResult: null,
        errorMessage: null,
      );

  UserSearchState copyWith({
    bool? isLoading,
    GitHubUser? userResult,
    String? errorMessage,
  }) {
    return UserSearchState(
      isLoading: isLoading ?? this.isLoading,
      userResult: userResult ?? this.userResult,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
