import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:naqel/core/utils/app_config.dart';
import 'package:naqel/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:naqel/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:naqel/features/auth/domain/repositories/auth_repository.dart';
import 'package:naqel/features/auth/domain/usecases/customer_signup_usecase.dart';
import 'package:naqel/features/auth/domain/usecases/driver_signup_usecase.dart';
import 'package:naqel/features/auth/domain/usecases/login_usecase.dart';
import 'package:naqel/features/auth/presentation/bloc/customer_cubit.dart';
import 'package:naqel/features/auth/presentation/bloc/driver_cubit.dart';
import 'package:naqel/features/auth/presentation/bloc/login_cubit.dart';
import 'package:naqel/injection_container.dart';

void initAuthDependencies() {
  if (AppConfig.useFirebase) {
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () =>
          AuthRemoteDataSourceImpl(sl<FirebaseAuth>(), sl<FirebaseFirestore>()),
    );
  } else {
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => MockAuthRemoteDataSource(),
    );
  }

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(datasource: sl<AuthRemoteDataSource>()),
  );
  initLoginDependencies();
  initCustomerSignupDependencies();
  initDriverSignupDependencies();
}

void initLoginDependencies() {
  sl.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<LoginCubit>(
    () => LoginCubit(loginUsecase: sl<LoginUsecase>()),
  );
}

void initCustomerSignupDependencies() {
  sl.registerLazySingleton<CustomerSignupUsecase>(
    () => CustomerSignupUsecase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<CustomerSignupCubit>(
    () => CustomerSignupCubit(signupUsecase: sl<CustomerSignupUsecase>()),
  );
}

void initDriverSignupDependencies() {
  sl.registerLazySingleton<DriverSignupUsecase>(
    () => DriverSignupUsecase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<DriverSignupCubit>(
    () => DriverSignupCubit(signupUsecase: sl<DriverSignupUsecase>()),
  );
}
