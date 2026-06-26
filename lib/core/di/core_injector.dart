import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:naqel/injection_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setupCoreInjector() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => ImagePicker());
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerSingleton<SharedPreferences>(prefs);
  sl.registerLazySingleton(() => Dio());
}
