class RepoDetails {
  final int id;
  final String fullName;
  final String name;
  final String? description;
  final String? language;
  final int forks;
  final int stargazers;

  RepoDetails({
    required this.id,
    required this.fullName,
    required this.name,
    this.description,
    this.language,
    required this.forks,
    required this.stargazers,
  });

  factory RepoDetails.fromJson(Map<String, dynamic> json) {
    return RepoDetails(
      id: json['id'],
      fullName: json['full_name'],
      name: json['name'],
      description: json['description'],
      language: json['language'],
      forks: json['forks'],
      stargazers: json['stargazers_count'],
    );
  }
}
