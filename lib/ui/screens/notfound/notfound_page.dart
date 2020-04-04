import 'package:flutter/material.dart';


class NotFoundPage extends StatelessWidget {
  final String appTitle;
  final String title;
  final String message;
  final IconData icon;
  final String image;
  final Color iconColor;

  NotFoundPage(
      {this.appTitle = "Search",
      this.title = "No Result",
      this.message = "Try a more general keyword.",
      this.icon = Icons.search,
      this.image,
      this.iconColor = Colors.black});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("ROUTE NOT FOUND"),
    );
  }
}
