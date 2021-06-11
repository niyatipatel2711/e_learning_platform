import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final googleSignIn = GoogleSignIn();

Future<bool?> SignUpUser(String name, String email, String password) async {

  try{
    UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);
    // User? user = result.user;
    return Future.value(true);
  }
  catch(e){
    switch(e){
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        print('serror');
    }
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

  try{
    UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
    // User? user = result.user;
    return Future.value(true);
  }
  catch(e){
    switch(e){
      case 'ERROR_INVALID_EMAIL':
        print('serror');
    }
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

  User? user = auth.currentUser;
  
  if(user!.providerData[0].providerId == 'google.com'){
    await googleSignIn.disconnect();
  }
  // await auth.signOut();
  // return Future.value(true);
}

Future<bool?> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if(googleSignInAccount != null){
      final GoogleSignInAuthentication googleAuth = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      UserCredential result = await auth.signInWithCredential(credential);

      User? user = auth.currentUser;
      user = result.user;

      print(user!.uid);

      return Future.value(true);

    }
  }

