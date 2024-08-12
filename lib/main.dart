import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:military1km/app.dart';
import 'package:military1km/common/data/preference/app_preferences.dart';

void main() async {
  // env 세팅
  await dotenv.load(fileName: 'assets/config/.env');

  // 내부저장소 세팅
  await AppPreferences.init();
  await Hive.initFlutter();

  // gemini 세팅
  Gemini.init(apiKey: dotenv.get("GEMINI_API"));

  runApp(
    const ProviderScope(child: App()),
  );
}
