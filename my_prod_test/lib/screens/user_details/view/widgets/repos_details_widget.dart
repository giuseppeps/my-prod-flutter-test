import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_prod_test/core/theme/texts.dart';
import 'package:my_prod_test/injection.dart';
import 'package:my_prod_test/screens/user_details/controller/cubit/user_details_cubit.dart';

class RepositoryDetailsWidget extends StatefulWidget {
  const RepositoryDetailsWidget({super.key});

  @override
  State<RepositoryDetailsWidget> createState() =>
      _RepositoryDetailsWidgetState();
}

class _RepositoryDetailsWidgetState extends State<RepositoryDetailsWidget> {
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: getIt<UserDetailsCubit>(),
      builder: (context, UserDetailsState state) {
        final filteredRepos = state.reposResult?.where((repo) {
          return repo.fullName.toLowerCase().contains(
                usernameController.text.toLowerCase(),
              );
        }).toList();

        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (filteredRepos == null || filteredRepos.isEmpty) {
          return const Center(child: Text("Nothing found"));
        }

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Filter by name',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.separated(
                    itemCount: filteredRepos.length,
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemBuilder: (context, index) {
                      final repoDetails = filteredRepos[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              repoDetails.name,
                              style: textStyle.copyWith(
                                  fontSize: 20, color: Colors.blue),
                            ),
                          ),
                          Text(
                            repoDetails.description ?? "",
                            style: textStyle2.copyWith(fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.code, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                repoDetails.language ?? "Unknown",
                                style: textStyle2.copyWith(fontSize: 12),
                              ),
                              const SizedBox(width: 16),
                              const Icon(Icons.ramp_right_outlined, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                repoDetails.forks.toString(),
                                style: textStyle2.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
