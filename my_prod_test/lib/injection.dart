import 'package:get_it/get_it.dart';
import 'package:my_prod_test/screens/search_user/controller/cubit/user_search_cubit.dart';
import 'package:my_prod_test/screens/search_user/controller/search_user_repository.dart';
import 'package:my_prod_test/screens/search_user/controller/search_user_service.dart';
import 'package:my_prod_test/screens/user_details/controller/cubit/user_details_cubit.dart';
import 'package:my_prod_test/screens/user_details/controller/user_details_repository.dart';
import 'package:my_prod_test/screens/user_details/controller/user_details_service.dart';

final getIt = GetIt.instance;

void init() {
  //repository
  getIt.registerLazySingleton(() => SearchUserRepository());
  getIt.registerLazySingleton(() => UserDetailsRepository());
  //service
  getIt.registerLazySingleton(() => SearchUserService(getIt()));
  getIt.registerLazySingleton(() => UserDetailsService(getIt()));
  //bloc
  getIt.registerSingleton(UserSearchCubit(getIt()));
  getIt.registerSingleton(UserDetailsCubit(getIt()));
}
