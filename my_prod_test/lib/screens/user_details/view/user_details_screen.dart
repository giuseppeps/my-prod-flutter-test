import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_prod_test/core/theme/colors.dart';
import 'package:my_prod_test/core/theme/texts.dart';
import 'package:my_prod_test/injection.dart';
import 'package:my_prod_test/screens/search_user/controller/cubit/user_search_cubit.dart';
import 'package:my_prod_test/screens/search_user/model/git_hub_user.dart';
import 'package:my_prod_test/screens/user_details/controller/cubit/user_details_cubit.dart';
import 'package:my_prod_test/screens/user_details/view/widgets/repos_details_widget.dart';
import 'package:my_prod_test/screens/user_details/view/widgets/starred_details_widget.dart';
import 'package:my_prod_test/screens/user_details/view/widgets/tab_button.dart';

class UserDetailsScreen extends StatefulWidget {
  final GitHubUser user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen>
    with TickerProviderStateMixin {
  UserDetailsCubit cubit = getIt<UserDetailsCubit>();
  late TabController _tabController;

  @override
  void initState() {
    cubit.getRepoDetails(widget.user.login);
    cubit.getStarredDetails(widget.user.login);
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        ListTile(
          isThreeLine: true,
          horizontalTitleGap: 0,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.user.avatarUrl),
            radius: 40,
          ),
          title: Text(
            widget.user.name,
            style: textStyle.copyWith(fontSize: 20),
          ),
          subtitle: Text(
            widget.user.bio,
            style: textStyle.copyWith(fontSize: 11),
          ),
        ),
        TextButton(
            onPressed: () => getIt<UserSearchCubit>().emptyUser(),
            child: const Text(
              'Change user',
              style: TextStyle(color: rustyOrange),
            )),
        const SizedBox(height: 10),
        TabBar(
          indicatorColor: rustyOrange,
          labelColor: slateGrey,
          controller: _tabController,
          tabs: [
            Tab(
              child: TabButton(
                count: widget.user.publicRepos,
                text: 'Repos',
                selected: _tabController.index == 0,
              ),
            ),
            BlocBuilder(
              bloc: cubit,
              builder: (context, UserDetailsState state) {
                return Tab(
                  child: TabButton(
                    count: state.starredResult?.length ?? 0,
                    text: 'Starred',
                    selected: _tabController.index == 1,
                  ),
                );
              },
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              RepositoryDetailsWidget(),
              StarredDetailsWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
