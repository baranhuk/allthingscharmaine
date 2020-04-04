import 'package:allthingscharmaine/ui/screens/press/press_video_list_page.dart';
import 'package:allthingscharmaine/ui/widgets/tourewidgets/header_video_item.dart';
import 'package:allthingscharmaine/utils/custom_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MoreRecentVideos extends StatelessWidget {
  MoreRecentVideos(this._hLoad, this._categoryId);

  bool _hLoad;
  String _categoryId;

  PageController _pageController = PageController(initialPage: 1, viewportFraction: 0.86);

  @override
  Widget build(BuildContext context) {
    print(_categoryId);
    return Container(
        child: StreamBuilder<QuerySnapshot>(stream: (_categoryId==null)?
        Firestore.instance.collection('video').orderBy('createdAt', descending: true).limit(4).snapshots():
        Firestore.instance.collection('video').where('category', arrayContains: _categoryId).orderBy('createdAt', descending: true).limit(4).snapshots(),
    builder: (context, snapShot){
    if(!snapShot.hasData)return Container();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(children: [
                        Padding(
                            padding: EdgeInsets.only(right: 2.0),
                            child: Text('most recent videos',
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
                    _hLoad ? GestureDetector(child: Padding(
                      padding: EdgeInsets.only(
                          top: 3.0, bottom: 3.0, left: 3.0),
                      child: Text('view all',
                          style: TextStyle(
                            color: CustomColors.TEXT_COLOR.withOpacity(0.5),
                            fontSize: 12.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          )),), onTap: () {
                      Navigator.push(context, MaterialPageRoute<void>(
                          builder: (context) =>
                              PressVideoList(
                                title: 'press', category: 'videos',)));
                    },) : Container()
                  ],
                )),

            SizedBox(
              height: 19,
            ),
            SizedBox.fromSize(
              size: const Size.fromHeight(260.0),
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemCount: snapShot.data.documents.length,
                  itemBuilder: (context, position){
                    return imageSlider(position, snapShot.data.documents[position]);
                  }),)
          ],);

    }));
  }

  Widget imageSlider(int index, DocumentSnapshot snapShot){
    return AnimatedBuilder(
        child: HeaderMovieItem(snapShot),
        animation: _pageController,
        builder: (context, widget){
          double bias = 1.0;
          if(_pageController.position.haveDimensions){
            bias = _pageController.page - index;
            bias = (1 - (bias.abs()*0.25)).clamp(0.0, 1.0) as double;
          }
          return Center(child:
          SizedBox(width: Curves.easeInOut.transform(bias)*330, height: Curves.easeInOut.transform(bias)*260, child: widget,));
        });
  }


}
