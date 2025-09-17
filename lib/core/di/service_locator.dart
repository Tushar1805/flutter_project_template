
import 'package:flutter_project_template/core/localization/language_cubit.dart';
import 'package:flutter_project_template/core/resources/app_storage.dart';
import 'package:flutter_project_template/core/theme/theme_cubit.dart';
import 'package:flutter_project_template/presentation/auth/cubit/auth_cubit.dart';
import 'package:flutter_project_template/presentation/auth/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';
final sl = GetIt.I;

void setupServiceLocator() async {
  //* Repositories
  sl.registerFactory<SecureStorage>(SecureStorage.new);
  sl.registerFactory<AuthRepository>(AuthRepository.new);

  //* Cubits
  sl.registerLazySingleton<ThemeCubit>(
    ThemeCubit.new,
  );
  sl.registerLazySingleton<LanguageCubit>(
    LanguageCubit.new,
  );
  sl.registerSingleton<AuthCubit>(
    AuthCubit(sl<AuthRepository>()),
  );
  
}
