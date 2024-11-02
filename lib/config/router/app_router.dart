import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:guardianarea/config/router/app_router_notifier.dart';
import 'package:guardianarea/features/activities/presentation/screens/screens.dart';
import 'package:guardianarea/features/auth/presentation/providers/auth_provider.dart';
import 'package:guardianarea/features/auth/presentation/screens/screens.dart';
import 'package:guardianarea/features/chat/presentation/screens/screens.dart';
import 'package:guardianarea/features/devices/presentation/screens/screens.dart';
import 'package:guardianarea/features/geofences/presentation/screens/screens.dart';
import 'package:guardianarea/features/home/presentation/screens/screens.dart';
import 'package:guardianarea/features/navigation/presentation/screens/main_screen.dart';
import 'package:guardianarea/features/profile/presentation/screens/screens.dart';
import 'package:guardianarea/features/settings/presentation/screens/screens.dart';
import 'package:guardianarea/features/vital-signs/presentation/screens/screens.dart';


final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: goRouterNotifier,
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const CheckAuthStatusScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),

      //! ShellRoute principal con BottomNavigationBar
      ShellRoute(
        builder: (context, state, child) => MainScreen(child: child),
        routes: [
          //! BottomNavigationBar Routes
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/activities',
            builder: (context, state) => const ActivityScreen(),
          ),
          GoRoute(
            path: '/chat',
            builder: (context, state) => const ChatScreen(),
          ),
          GoRoute(
            path: '/vital-signs',
            builder: (context, state) => const VitalSignsScreen(),
          ),
          GoRoute(
            path: '/geofences',
            builder: (context, state) => const GeofencesScreen(),
          ),

          //! AppNavigator Routes
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            path: '/devices',
            builder: (context, state) => const DevicesScreen(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final isGoingTo = state.matchedLocation;
      final authStatus = goRouterNotifier.authStatus;

      if (isGoingTo == '/splash' && authStatus == AuthStatus.checking) {
        return null;
      }

      if (authStatus == AuthStatus.unauthenticated) {
        if (isGoingTo == '/login' || isGoingTo == '/register') {
          return null;
        }
        return '/login';
      }

      if (authStatus == AuthStatus.authenticated) {
        if (isGoingTo == '/login' ||
            isGoingTo == '/register' ||
            isGoingTo == '/splash') {
          return '/';
        }
      }

      return null;
    },
  );
});
