import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loc/features/auth_feature/presentaion/screens/auth_screen.dart';
import 'package:loc/features/auth_feature/presentaion/screens/email_verify_screen.dart';
import 'package:loc/core/routing/routes.dart';
import 'package:loc/features/gallery_feature/presentaion/screens/users_gallery_screen.dart';

final router = GoRouter(
  initialLocation: AUTH_ROUTE,
  routes: [
    GoRoute(
      path: AUTH_ROUTE,
      //builder: (context, state) => AuthScreen(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          fullscreenDialog: true,
          transitionDuration: const Duration(milliseconds: 600),
          child: const AuthScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: GALLERY_ROUTE,
      //builder: (context, state) => UsersGalleryScreen(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          fullscreenDialog: true,
          transitionDuration: const Duration(milliseconds: 600),
          child: const UsersGalleryScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SizeTransition(
              sizeFactor: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: EMAIL_VERIFY_ROUTE,
      //builder: (context, state) => EmailVerifyScreen(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          fullscreenDialog: true,
          transitionDuration: const Duration(milliseconds: 600),
          child: const EmailVerifyScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
  ],
);
