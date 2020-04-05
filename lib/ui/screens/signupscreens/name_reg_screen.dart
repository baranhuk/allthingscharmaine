
import 'package:allthingscharmaine/core/viewmodels/user_view_model.dart';

import 'package:allthingscharmaine/ui/widgets/nwagbawidgets/custom_appbar.dart';
import 'package:allthingscharmaine/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'email_reg_screen.dart';
import 'login_screen.dart';


class NameRegScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NameRegScreen();
  }
}

class _NameRegScreen extends State<NameRegScreen> {
  String _firstname, _lastname;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    var userProvider = Provider.of<UserViewModel>(context);
    return Scaffold(

      body: CustomScrollView(
       slivers: <Widget>[
         SliverAppBar(
           expandedHeight: 150.0,
           backgroundColor: Colors.transparent,
           flexibleSpace:  FlexibleSpaceBar(
             centerTitle: true,
             title: Text('What\'s  your name ?',textAlign: TextAlign.left,style: TextStyle(color: MyColors().pinkActive),),
           ),
         ),
         SliverToBoxAdapter(
           child:Container(
             padding: EdgeInsets.symmetric(horizontal: 10),
             child: Form(
               key: _formkey,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[

                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextFormField(
                       controller: null,
                       onSaved: (input) => _firstname = input,
                       validator: (value) {
                         if (value.isEmpty) {
                           return "Please enter your first name";
                         }
                         return null;
                       },
                       decoration: InputDecoration(
                         labelText: "first name",
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextFormField(
                       controller: null,
                       onSaved: (input) => _lastname = input,
                       validator: (value) {
                         if (value.isEmpty) {
                           return "Please enter your last name";
                         }
                         return null;
                       },
                       decoration: InputDecoration(
                         labelText: "last name",
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           )




             ),


       ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              child: FlatButton(onPressed: (){

              },
                  child: Text("skip",
                      style: TextStyle(color: MyColors().pinkActive))),
            ),


            Container(
             padding: EdgeInsets.all(8.0),
              child: FlatButton(onPressed: (){
                if(_formkey.currentState.validate()){
                  _formkey.currentState.save();
                   // userProvider.addnames(_firstname, _lastname);
                    UserViewModel().addnames(_firstname, _lastname);
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (context) => EmailRegScreen()));
                }
              },
                  child: Text("next",
                      style: TextStyle(color: MyColors().pinkActive))),
            ),

          ],
        ),
      ),
    );
  }
}
