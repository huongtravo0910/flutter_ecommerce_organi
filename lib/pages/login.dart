import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    preferences = await SharedPreferences.getInstance();
    isLogedin = await googleSignIn.isSignedIn();

    if (isLogedin) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    }
    setState(() {
      loading = false;
    });
  }

  Future<UserCredential> handleSignIn() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
    // GoogleSignInAccount googleUser = await googleSignIn.signIn();
    // GoogleSignInAuthentication googleSignInAuthentication =
    //     await googleUser.authentication;
    // User user = await firebaseAuth.

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    UserCredential user = await firebaseAuth.signInWithCredential(credential);
    // print("signed in " + user.displayName);
    if (user != null) {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('users')
          .where('id', isEqualTo: user.user.uid)
          .get();
      final List<DocumentSnapshot> documents = result.docs;
      if (documents.length == 0) {
        //insert user to collection
        FirebaseFirestore.instance.collection('users').doc(user.user.uid).set({
          "id": user.user.uid,
          "username": user.user.displayName,
          "profilePicture": user.user.photoURL
        });
        await preferences.setString('id', user.user.uid);
        await preferences.setString('userName', user.user.displayName);
        await preferences.setString('photoUrl', user.user.photoURL);
      } else {
        await preferences.setString('id', documents[0]['id']);
        await preferences.setString('userName', documents[0]['userName']);
        await preferences.setString('photoUrl', documents[0]['photoUrl']);
      }
      Fluttertoast.showToast(msg: "Logged in");
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      Fluttertoast.showToast(msg: "Login failed");
    }
    print(user);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: new Text(
          "Login",
          style: TextStyle(color: Colors.red.shade900),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Visibility(
              visible: loading ?? true,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.9),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
          child: FlatButton(
              color: Colors.red,
              onPressed: () {
                handleSignIn();
              },
              child: Text(
                "Sign in / Sign up with google",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
