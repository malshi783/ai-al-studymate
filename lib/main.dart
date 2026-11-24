import 'package:flutter/material.dart';

//Flutter app එකට Firebase service එක connect කරන්න.
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

//flutterfire configure generate කරපු Firebase configuration එක.
import 'firebase_options.dart';
import 'core/navigation/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';
import 'services/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => ThemeController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'AI A/L StudyMate',
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: themeController.themeMode,
      routerConfig: appRouter,
    );
  }
}
