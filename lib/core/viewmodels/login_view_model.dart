
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/widgets.dart';

class LoginViewModel extends ChangeNotifier {


  final Firestore _db = Firestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  CollectionReference ref;

  void showInSnackBar(String value,GlobalKey<ScaffoldState> scaffoldkey) {
    scaffoldkey.currentState.showSnackBar(SnackBar(
      content: Text(value,style: TextStyle(fontSize: 20),),
      backgroundColor: Colors.redAccent,
    ));
  }

  Future<void> signUp(String email, String passsword) async {
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: passsword);
  }


  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  bool _loggedIn = false;
  bool get loggedIn=> _loggedIn;
  set loggedIn(bool val) {
    _loggedIn = val;
    notifyListeners();
  }
  /*
    Future signUpUserNSaveData() async {
      signUp(userSignupDTO.email, userSignupDTO.password).then((user) async {
        await uploadImage(userSignupDTO.image);
  
  
  
        api.saveUserData("users",userSignupDTO.toJson(),userCreditCard.toJson());
  
        api.saveUserCreditcard("CreditCards", userCreditCard.toJson());
  
  
      });
    }
  */
    Future<FirebaseUser> signInUser(String email, String password,GlobalKey<ScaffoldState> scaffoldkey) async {
      String errorMessage;
       return await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value){
         isLoading = false;
         loggedIn = true;
         return value.user;
       })
          .catchError((Object onError){
            PlatformException error = onError as PlatformException;
         switch (error.code) {
           case "ERROR_INVALID_EMAIL":
             errorMessage = "Your email address appears to be malformed.";

             break;
           case "ERROR_WRONG_PASSWORD":
             errorMessage = "Your password is wrong.";
             break;
           case "ERROR_USER_NOT_FOUND":
             errorMessage = "User with this email doesn't exist.";
             break;
           case "ERROR_USER_DISABLED":
             errorMessage = "User with this email has been disabled.";
             break;
           case "ERROR_TOO_MANY_REQUESTS":
             errorMessage = "Too many requests. Try again later.";
             break;
           case "ERROR_OPERATION_NOT_ALLOWED":
             errorMessage = "Signing in with Email and Password is not enabled.";
             break;
           default:
             errorMessage = "An undefined Error happened.";
         }
          showInSnackBar(errorMessage, scaffoldkey);
          isLoading = false;
          return null;

      });

  
    }
  
    Future signUserOut()async{
      await _firebaseAuth.signOut();
    }

}
