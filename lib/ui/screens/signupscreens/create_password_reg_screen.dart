import 'package:allthingscharmaine/core/viewmodels/user_view_model.dart';
import 'package:allthingscharmaine/ui/screens/signupscreens/pick_photo_screen.dart';

import 'package:allthingscharmaine/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

class PasswordRegScreen extends StatefulWidget {
  @override
  _PasswordRegScreenState createState() => _PasswordRegScreenState();
}

class _PasswordRegScreenState extends State<PasswordRegScreen> {
  String password, confirmPassword;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserViewModel>(context);
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150.0,
            backgroundColor: Colors.transparent,
            flexibleSpace:  FlexibleSpaceBar(
              centerTitle: true,
              title: Text('create a password',textAlign: TextAlign.left,style: TextStyle(color: MyColors().pinkActive),),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        controller: null,
                        onSaved: (input) => password = input,
                        validator: (value) {
                          if (value.isEmpty || value.length < 6) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: "password"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: null,
                        onSaved: (input) => confirmPassword = input,
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty || value.length < 6) {
                            return "Please enter your password again";
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: "repeat password"),
                      ),
                    ),
                  ],
                ),
              )
            )
          )
        ],

      ),
      bottomNavigationBar:  Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Text(
                  "Skip",
                  style: TextStyle(color: MyColors().pinkInactive),
                ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              ),
            ),

             FlatButton(onPressed: (){
                if (_formkey.currentState.validate()) {
                  _formkey.currentState.save();
                  if (password == confirmPassword) {
                    userProvider.addPassword(password);
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (context) => PickPhotoScreen()));
                  } else {
                    _displaySnackBar(context);
                  }
                }
              }, child: Text("next",
                  style: TextStyle(color: MyColors().pinkActive)),),


          ],
        ),
      )
    );
  }

 void _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text("passwords don't match"),
      duration: Duration(seconds: 1),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
