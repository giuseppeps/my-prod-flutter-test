import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_prod_test/core/widgets/custom_appbar.dart';
import 'package:my_prod_test/injection.dart';
import 'package:my_prod_test/screens/search_user/controller/cubit/user_search_cubit.dart';
import 'package:my_prod_test/screens/user_details/view/user_details_screen.dart';

class SearchUserScreen extends StatefulWidget {
  const SearchUserScreen({super.key});

  @override
  State<SearchUserScreen> createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  UserSearchCubit cubit = getIt<UserSearchCubit>();

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();

    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocConsumer(
        bloc: cubit,
        listener: (context, UserSearchState state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
              ),
            );
          }
        },
        builder: (context, UserSearchState state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.userResult != null) {
            return UserDetailsScreen(
              user: state.userResult!,
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      TextField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search GitHub username',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          final username = usernameController.text;
                          cubit.searchUser(username);
                        },
                        child: const Text('Search'),
                      ),
                      const SizedBox(height: 16),
                    ],
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
