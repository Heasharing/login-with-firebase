import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebaseconnacte_flutter/customizePage.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [
              EmailAuthProvider(), // new
            ],
          );
        }

        return const HomeScreen();
      },
    );
  }
  
}
typedef HeaderBuilder = Widget Function(
 BuildContext context,
 BoxConstraints constraints,
 double shrinkOffset,
);
