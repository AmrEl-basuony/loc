import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loc/core/routing/routes.dart';

class EmailVerifyScreen extends StatelessWidget {
  const EmailVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmailVerificationScreen(
        actions: [
          EmailVerifiedAction(() {
            context.go(GALLERY_ROUTE);
          }),
          AuthCancelledAction((context) {
            context.go(AUTH_ROUTE);
          }),
        ],
      ),
    );
  }
}
