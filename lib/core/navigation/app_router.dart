import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../features/shell/app_shell.dart';
import '../../screens/accounting_screen.dart';
import '../../screens/business_studies_screen.dart';
import '../../screens/dashboard_screen.dart';
import '../../screens/economics_screen.dart';
import '../../screens/exam_countdown_screen.dart';
import '../../screens/login_screen.dart';
import '../../screens/past_papers_screen.dart';
import '../../screens/profile_screen.dart';
import '../../screens/register_screen.dart';
import '../../screens/splash_screen.dart';
import '../../screens/subjects_screen.dart';
import '../../screens/tasks_screen.dart';
import '../../screens/timetable_screen.dart';
import '../../screens/welcome_screen.dart';
import '../../services/auth_service.dart';
import 'auth_router_refresh.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  refreshListenable: AuthRouterRefresh.instance,
  redirect: (context, state) {
    final auth = context.read<AuthService>();
    final location = state.matchedLocation;
    final isAuthRoute =
        location == '/welcome' ||
        location == '/login' ||
        location == '/register';
    final isProtectedRoute = location != '/' && !isAuthRoute;

    if (!auth.isSignedIn && isProtectedRoute) return '/welcome';
    if (auth.isSignedIn && isAuthRoute) return '/home';
    return null;
  },
  routes: [
    GoRoute(path: '/', builder: (_, _) => const SplashScreen()),
    GoRoute(path: '/welcome', builder: (_, _) => const WelcomeScreen()),
    GoRoute(path: '/login', builder: (_, _) => const LoginScreen()),
    GoRoute(path: '/register', builder: (_, _) => const RegisterScreen()),
    ShellRoute(
      builder: (_, _, child) => AppShell(child: child),
      routes: [
        GoRoute(path: '/home', builder: (_, _) => const DashboardScreen()),
        GoRoute(path: '/tasks', builder: (_, _) => const TasksScreen()),
        GoRoute(path: '/papers', builder: (_, _) => const PastPapersScreen()),
        GoRoute(path: '/profile', builder: (_, _) => const ProfileScreen()),
      ],
    ),
    GoRoute(path: '/subjects', builder: (_, _) => const SubjectsScreen()),
    GoRoute(path: '/timetable', builder: (_, _) => const TimetableScreen()),
    GoRoute(
      path: '/exam-countdown',
      builder: (_, _) => const ExamCountdownScreen(),
    ),
    GoRoute(
      path: '/subjects/accounting',
      builder: (_, _) => const AccountingScreen(),
    ),
    GoRoute(
      path: '/subjects/business-studies',
      builder: (_, _) => const BusinessStudiesScreen(),
    ),
    GoRoute(
      path: '/subjects/economics',
      builder: (_, _) => const EconomicsScreen(),
    ),
  ],
);
