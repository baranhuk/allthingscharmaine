import 'dart:io';

import 'package:allthingscharmaine/core/model/user_signup_dto.dart';
import 'package:allthingscharmaine/utils/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class UserViewModel extends ChangeNotifier {

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final StorageReference  storageRef = FirebaseStorage.instance.ref();
  CollectionReference ref;

  void showInSnackBar(String value,GlobalKey<ScaffoldState> scaffoldkey) {
    scaffoldkey.currentState.showSnackBar(SnackBar(
      content: Text(value,style: TextStyle(fontSize: 20),),
      backgroundColor: Colors.redAccent,
    ));
  }

  Future<void> compressAndGetFile(File file, String targetPath) async {

    return await FlutterImageCompress.compressAndGetFile(
      file.absolute.path, targetPath,
      quality: 88,

    ).then((File value){
      uploadImage(value);
    });




  }

  void uploadImage(File image) async {
   
    storageRef.child(Config.profilePics).child(image.path.toString());
    StorageUploadTask uploadTask = storageRef.putFile(image);

    StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);

    // String downloadURL =
    //     (await uploadTask.onComplete).ref.getDownloadURL().toString();

    final String url = (await downloadUrl.ref.getDownloadURL()).toString();

    print("Image url is "+url);
    userSignupDTO.imageUri = url;
  }
  void addnames(String firstname, String lastname) {
    userSignupDTO.firstName = firstname;
    userSignupDTO.lastName = lastname;
    print("${userSignupDTO.firstName},${userSignupDTO.lastName}");
  }

  void addEmail(String email) {
    userSignupDTO.email = email;
    print(userSignupDTO.email);
  }

  void addPassword(String password) {
    userSignupDTO.password = password;
    print(userSignupDTO.password);
  }

  void addFile(File imageFile) {
    userSignupDTO.image = imageFile;
    print(userSignupDTO.image.uri.toString());
  }

  

  void addSecurityAnswers(
      String firstSecurityAnswer, String secondSecurityAnswer) {
    userSignupDTO.firstSecurityQuestion = firstSecurityAnswer;
    userSignupDTO.secSecurityQuestion = secondSecurityAnswer;
    print("${userSignupDTO.firstSecurityQuestion} ${userSignupDTO.secSecurityQuestion}");
    print("${userSignupDTO.firstName} ${userSignupDTO.lastName}");
    print("${userSignupDTO.email} ${userSignupDTO.password}");
  }
}
