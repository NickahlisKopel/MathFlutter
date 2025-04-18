import 'package:flutter/material.dart';
import 'package:math_game_flutter_rebuild/src/keyboard/keyboard_controller.dart';
import 'package:math_game_flutter_rebuild/src/providers/expression_provider.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'package:math_game_flutter_rebuild/src/providers/user_provider.dart';


void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => KeyboardController()),
        ChangeNotifierProvider(create: (context) => ExpressionProvider()),
        
        
      ],
      child: MyApp(settingsController: settingsController,),
    ),
  );
}
