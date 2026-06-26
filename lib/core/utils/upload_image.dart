import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

Future<String> uploadImage(XFile? image, Dio dio) async {
  final formData = FormData.fromMap({
    'upload_preset': 'naqel_app',
    'file': await MultipartFile.fromFile(image?.path ?? ''),
  });

  final response = await dio.post(
    'https://api.cloudinary.com/v1_1/det5wmosf/image/upload',
    data: formData,
  );

  final url = response.data['secure_url'] as String;
  log('Uploaded: $url');
  return url;
}
