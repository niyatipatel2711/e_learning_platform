import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final googleSignIn = GoogleSignIn();

// ignore: non_constant_identifier_names
Future<bool?> SignUpUser(String name, String email, String password) async {
  try {
    // ignore: unused_local_variable
    UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);
    // User? user = result.user;
    return Future.value(true);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } on PlatformException catch(e) {
    print(e);
  } catch (e) {
    print('Error: $e');
  }

  // FirebaseAuth _auth = FirebaseAuth.instance;

  // try{
  //   User? user = (await _auth.createUserWithEmailAndPassword(email: email, password: password)).user;

  //   if(user != null){
  //     print("Sign up successful");
  //     return user;
  //   }
  //   else{
  //     print("Sign up failed");
  //     return user;
  //   }
  // }
  // catch(e){
  //   print(e);
  //   return null;
  // }
}

Future<bool?> loginUser(String email, String password) async {
  try {
    // ignore: unused_local_variable
    UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    // User? user = result.user;
    return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      print('No user found for that email.');
      } 
      else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } on PlatformException catch(e) {
      print(e);
    }
  catch (e) {
    print('Error: $e');
  }
  // FirebaseAuth _auth = FirebaseAuth.instance;

  // try{
  //   User? user = (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;

  //   if(user != null){
  //     print("Login successful");
  //     return user;
  //   }
  //   else{
  //     print("Login failed");
  //     return user;
  //   }
  // }
  // catch(e){
  //   print(e);
  //   return null;
  // }
}
Future<void> logOut() async {
  await FirebaseAuth.instance.signOut();
  await googleSignIn.signOut();
}

Future<bool?> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleSignInAccount.authentication;
            
        final AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      
        UserCredential result = await auth.signInWithCredential(credential);
      
        User? user = auth.currentUser;
        user = result.user;
      
        print(user!.uid);
      
        return Future.value(true);
      }
  } on PlatformException catch (e) {
      print(e);
  }
}
