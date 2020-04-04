import 'package:allthingscharmaine/core/viewmodels/login_view_model.dart';
import 'package:allthingscharmaine/ui/screens/QA/qascreen.dart';
import 'package:allthingscharmaine/ui/screens/charmainetv/charmaine_tv_list_page.dart';
import 'package:allthingscharmaine/ui/screens/forumscreens/category_screen.dart';
import 'package:allthingscharmaine/ui/screens/otherscreens/order_history.dart';
import 'package:allthingscharmaine/ui/screens/profilescreens/my_account.dart';
import 'package:allthingscharmaine/ui/screens/signupscreens/name_reg_screen.dart';
import 'package:allthingscharmaine/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<LoginViewModel>(context);
    return Container(
      padding: EdgeInsets.only(right: 20.0, left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.close,
                    color: CustomColors.TEXT_COLOR,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          ),
          Expanded(
              child: ListView(
            children: [
              ListTile(
                title: Text(
                  'charmaine tv',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: CustomColors.TITLE_COLOR,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute<void>(builder: (context) => CharmaineTv()));
                },
              ),
              ListTile(
                title: Text(
                  'forum',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: CustomColors.TITLE_COLOR,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (context) => CategoryScreen()));
                },
              ),
              ListTile(
                title: Text(
                  'Q/A',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: CustomColors.TITLE_COLOR,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute<void>(builder: (context) => QAScreen()));
                },
              ),
              ListTile(
                title: Text(
                  'library',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: CustomColors.TITLE_COLOR,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'my account',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: CustomColors.TITLE_COLOR,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => MyAccount(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'purchases',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: CustomColors.TITLE_COLOR,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute<void>(builder: (context) => OrderHistory()));
                },
              ),
              ListTile(
                title: Text(
                  'billing information',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: CustomColors.TITLE_COLOR,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'contact us',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: CustomColors.TITLE_COLOR,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          )),
          ListTile(
            title: Text(
              'logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xffED9B9D),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              userProvider.signUserOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute<void>(builder: (context) => NameRegScreen()));
            },
          ),
        ],
      ),
    );
  }
}
