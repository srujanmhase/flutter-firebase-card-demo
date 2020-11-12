import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'dbservice.dart';

GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

GoogleSignInAccount currentUser;

Future handleSignIn() async {
  try {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    final UserCredential fcred =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final User fuser = fcred.user;
    //DBService
    return await DatabaseService(uid: fuser.uid).initUserData();
  } catch (error) {
    print(error);
  }
}

Future<void> handleSignOut() => googleSignIn.disconnect();
