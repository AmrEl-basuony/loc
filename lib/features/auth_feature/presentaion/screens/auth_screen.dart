import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loc/core/routing/routes.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInScreen(
        showPasswordVisibilityToggle: true,
        providers: [
          EmailAuthProvider(),
          GoogleProvider(clientId: '150001013395-4uicuavo7hgi8mmpj530drdht5jhvlv8.apps.googleusercontent.com'),
        ],
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            if (!state.user!.emailVerified) {
              context.push(EMAIL_VERIFY_ROUTE);
            } else {
              AwesomeNotifications().isNotificationAllowed().then((isAllowed) async {
                if (!isAllowed) {
                  await AwesomeNotifications().requestPermissionToSendNotifications();
                }

                AwesomeNotifications().createNotification(
                  schedule: NotificationCalendar.fromDate(date: DateTime.now().add(const Duration(seconds: 15))),
                  content: NotificationContent(
                    id: -1,
                    channelKey: 'channelKey',
                    title: 'notification title',
                    body: 'body of notification (sent after 15s)',
                  ),
                );
              });

              context.go(GALLERY_ROUTE);
            }
          }),
          AuthStateChangeAction<UserCreated>((context, state) {
            context.go(EMAIL_VERIFY_ROUTE);
          }),
        ],
      ),
    );
  }
}
