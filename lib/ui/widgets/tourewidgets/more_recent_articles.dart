import 'package:allthingscharmaine/ui/screens/press/press_article_list_page.dart';
import 'package:allthingscharmaine/ui/widgets/tourewidgets/press_article_item.dart';
import 'package:allthingscharmaine/utils/custom_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MoreRecentArticles extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Row(children: [
                    Padding(
                        padding: EdgeInsets.only(right: 2.0),
                        child: Text('most recent articles',
                            style: TextStyle(
                              color: CustomColors.TITLE_COLOR,
                              fontSize: 20.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ))),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12.0,
                      color: CustomColors.TITLE_COLOR,
                    )
                  ]),
                ),
                GestureDetector(child: Padding(
                    padding: EdgeInsets.only(top: 3.0, bottom: 3.0, left: 3.0),
                    child: Text('view all',
                        style: TextStyle(
                          color: CustomColors.TEXT_COLOR.withOpacity(0.5),
                          fontSize: 12.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ))),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (context) => PressArticleList()));
                  },)
              ],
            ),
            SizedBox(
              height: 19,
            ),
            StreamBuilder<QuerySnapshot>(stream: Firestore.instance.collection('article').orderBy('createdAt').limit(2).snapshots(),
                builder: (context, snapShot){
                  if(!snapShot.hasData)return const Center(child: Text('No Article'),);
                  return ListView.builder(
                      itemCount: snapShot.data.documents.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index){
                        return PressArticleItem(snapShot.data.documents[index]);
                      }
                  );
                }),
          ],
        ));
  }
}
