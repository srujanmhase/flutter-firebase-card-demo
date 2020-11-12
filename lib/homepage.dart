import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:card_demo/widgetassets.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'routes.dart';
import 'authservice.dart';

// GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: <String>[
//     'email',
//   ],
// );

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // GoogleSignInAccount _currentUser;

  @override
  void initState() {
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        currentUser = account;
      });
    });
    //_googleSignIn.signInSilently();
  }

  // Future<void> _handleSignIn() async {
  //   try {
  //     final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;

  //     // Create a new credential
  //     final GoogleAuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     // Once signed in, return the UserCredential
  //     return await FirebaseAuth.instance.signInWithCredential(credential);
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  // Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget _buildBody() {
    if (currentUser != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 300,
            child: Card(
              child: InkWell(
                onTap: () {},
                child: ListTile(
                  leading: GoogleUserCircleAvatar(
                    identity: currentUser,
                  ),
                  title: Text(currentUser.displayName ?? ''),
                  subtitle: Text(currentUser.email ?? ''),
                ),
              ),
            ),
          ),
          Container(
            width: 300,
            height: 50,
            child: Card(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(toDashRoute());
                },
                child: Center(child: Text("Continue")),
              ),
            ),
          ),
          FlatButton(
            child: const Text('SIGN OUT'),
            onPressed: handleSignOut,
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: screenWidth(context, mulBy: 0.65),
            height: 55,
            child: Card(
              child: InkWell(
                onTap: handleSignIn,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(
                      image: AssetImage('images/1004px-Google__G__Logo.png'),
                      height: 25,
                    ),
                    Text('Sign in With Google')
                  ],
                ),
              ),
            ),
          )
        ],
      );
    }
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double screenHeight(BuildContext context, {double mulBy = 1}) {
    return screenSize(context).height * mulBy;
  }

  double screenWidth(BuildContext context, {double mulBy = 1}) {
    return screenSize(context).width * mulBy;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            mainLogo(),
            SizedBox(
              height: 40,
            ),
            _buildBody(),
          ],
        ),
      ),
    );
  }
}
