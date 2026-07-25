import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naqel/core/routes.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:naqel/core/utils/app_config.dart';
import 'package:naqel/features/auth/presentation/bloc/customer_cubit.dart';
import 'package:naqel/features/auth/presentation/bloc/driver_cubit.dart';
import 'package:naqel/features/auth/presentation/bloc/login_cubit.dart';
import 'package:naqel/features/splash/presentation/Cubit/splash_cubit.dart';
import 'package:naqel/injection_container.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (AppConfig.useFirebase) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<SplashCubit>()),
        BlocProvider(create: (context) => sl<LoginCubit>()),
        BlocProvider(create: (context) => sl<CustomerSignupCubit>()),
        BlocProvider(create: (context) => sl<DriverSignupCubit>()),
      ],
      child: MaterialApp.router(
        theme: SwiftShipTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: goRouter,
      ),
    );
  }
}
