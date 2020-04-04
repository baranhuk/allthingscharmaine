
import 'package:allthingscharmaine/router/router.dart';
import 'package:allthingscharmaine/core/viewmodels/shopVM.dart';
import 'package:allthingscharmaine/core/viewmodels/socialVM.dart';
import 'package:allthingscharmaine/ui/screens/home_screen.dart';
import 'package:allthingscharmaine/ui/screens/signupscreens/name_reg_screen.dart';
import 'package:allthingscharmaine/utils/my_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/viewmodels/loginviewmodel.dart';
import 'core/viewmodels/user_creditcard_viewmodel.dart';
import 'core/viewmodels/userviewmodel.dart';

import 'ui/screens/signupscreens/login_screen.dart';

void main() {

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<FirebaseUser>(
      future: FirebaseAuth.instance.currentUser(),
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.hasData) {
          // FirebaseUser user = snapshot.data;
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => UserViewModel(),
              ),
              ChangeNotifierProvider(
                create: (_) => LoginViewmodel(),
              ),
              ChangeNotifierProvider(
                create: (_) => UserCreditCardViewmodel(),
              ),
              ChangeNotifierProvider(
                create: (_) => ShopVM(),
              ),
              ChangeNotifierProvider(
                create: (_) => SocialVM(),
              )
            ],
            child: MaterialApp(
              home: HomeScreen(),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  cursorColor: MyColors().pinkInactive,
                  primaryColor: MyColors().pinkInactive,
                  accentColor: MyColors().pinkActive,
                  fontFamily: 'Poppins'),
onGenerateRoute: Router.generateRoute,
onUnknownRoute: Router.unknownRoute,
            ),
          );
        } else {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => UserViewModel(),
              ),
              ChangeNotifierProvider(
                create: (_) =>LoginViewmodel(),
              ),
              ChangeNotifierProvider(
                create: (_) => UserCreditCardViewmodel(),
              ),
              ChangeNotifierProvider(
                create: (_) => ShopVM(),
              ),
              ChangeNotifierProvider(
                create: (_) => SocialVM(),
              )

            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Homepage(),
              theme: ThemeData(
                  cursorColor: MyColors().pinkInactive,
                  primaryColor: MyColors().pinkInactive,
                  accentColor: MyColors().pinkActive,
                  fontFamily: 'Poppins'),
                  onGenerateRoute: Router.generateRoute,
                  onUnknownRoute: Router.unknownRoute,
            ),
          );
        }
      },
    );

  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return LoginScreen();
  }
}

