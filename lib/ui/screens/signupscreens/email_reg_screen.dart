
import 'package:allthingscharmaine/core/viewmodels/user_view_model.dart';
import 'package:allthingscharmaine/ui/widgets/nwagbawidgets/custom_appbar.dart';
import 'package:allthingscharmaine/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'create_password_reg_screen.dart';
import 'login_screen.dart';

class EmailRegScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EmailRegScreenState();
  }
}

class _EmailRegScreenState extends State<EmailRegScreen> {
  String _email;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150.0,
            backgroundColor: Colors.transparent,
            flexibleSpace:  FlexibleSpaceBar(
              centerTitle: true,
              title: Text('your email?',textAlign: TextAlign.left,style: TextStyle(color: MyColors().pinkActive),),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onSaved: (input) => _email = input,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter your email";
                            }
                            return null;
                          },
                          decoration: InputDecoration(labelText: "email"),
                        ),
                      ),
                      // Spacer(),
                    ],
                  ),
              ),
            )
          )
        ],

      ),
      bottomNavigationBar: Container(
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

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Text("next",
                    style: TextStyle(color: MyColors().pinkActive)),
                onTap: () {
                  if (_formkey.currentState.validate()) {
                    _formkey.currentState.save();
                    userProvider.addEmail(_email);
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (context) => PasswordRegScreen()));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
