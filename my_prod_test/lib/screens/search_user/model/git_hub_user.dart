class GitHubUser {
  final String avatarUrl;
  final String url;
  final String name;
  final String login;
  final String bio;
  final int publicRepos;

  GitHubUser({
    required this.avatarUrl,
    required this.url,
    required this.name,
    required this.login,
    required this.bio,
    required this.publicRepos,
  });

  factory GitHubUser.fromJson(Map<String, dynamic> json) {
    return GitHubUser(
      avatarUrl: json['avatar_url'],
      url: json['url'],
      name: json['name'] ?? json['login'],
      login: json['login'],
      bio: json['bio'] ?? "",
      publicRepos: json['public_repos'],
    );
  }
}
