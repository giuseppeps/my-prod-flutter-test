part of 'user_details_cubit.dart';

class UserDetailsState {
  final bool isLoading;
  final List<RepoDetails>? reposResult;
  final List<RepoDetails>? starredResult;
  final String? errorMessage;

  UserDetailsState({
    required this.isLoading,
    this.reposResult,
    this.starredResult,
    this.errorMessage,
  });

  factory UserDetailsState.empty() => UserDetailsState(
        isLoading: false,
        reposResult: null,
        starredResult: null,
        errorMessage: null,
      );

  UserDetailsState copyWith({
    bool? isLoading,
    List<RepoDetails>? reposResult,
    List<RepoDetails>? starredResult,
    String? errorMessage,
  }) {
    return UserDetailsState(
      isLoading: isLoading ?? this.isLoading,
      reposResult: reposResult ?? this.reposResult,
      starredResult: starredResult ?? this.starredResult,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
