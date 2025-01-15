import 'package:movie_case/core/constants/app_strings.dart';

extension ImageExtensions on String {
  String get toFullImageUrl => '${AppStrings.imageUrl}$this';
}
