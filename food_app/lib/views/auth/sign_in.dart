import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:food_app/controllers/user_provider.dart';
import 'package:food_app/views/home/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late UserProvider userProvider;
  _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      userProvider.addUserData(
        currentUser: user,
        userEmail: user!.email.toString(),
        userImage: user.photoURL.toString(),
        userName: user.displayName.toString(),
      );
      // print("signed in " + user.displayName);

      return user;
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/background.jpg'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 400,
                width: double.infinity,
                //color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Sign in to continue',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Food App',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.green.shade900,
                              offset: Offset(3, 3),
                            ),
                          ]),
                    ),
                    Column(
                      children: [
                        SignInButton(
                          Buttons.Google,
                          text: "Sign in with Google",
                          onPressed: () async {
                            await _googleSignUp().then(
                              (value) => Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          ' By signing in your are agreeing to our ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text('Terms and Privacy policy',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
