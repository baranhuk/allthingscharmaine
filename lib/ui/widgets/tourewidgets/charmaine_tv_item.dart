import 'package:allthingscharmaine/ui/screens/press/press_video_list_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CharmaineTvItem extends StatefulWidget {
  CharmaineTvItem({@required this.snapShot}) :assert(snapShot != null);
  final DocumentSnapshot snapShot;

  @override
  _CharmaineTvItemState createState() => _CharmaineTvItemState();

}
  class _CharmaineTvItemState extends State<CharmaineTvItem>{
  String _imageUrl;
  @override
  void initState() {
    super.initState();
    /*
    StorageReference storageReference = FirebaseStorage.instance.ref().child(widget.snapShot['image'].toString());
    storageReference.getDownloadURL().then((value) {

      if (!mounted) return;
      setState((){
        _imageUrl = loc;
      });
    });
    */
  }
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(child: SizedBox(
      height: 105.0,
      width: screenWidth,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      child: Stack(
        children: [
          (_imageUrl!= null)? CachedNetworkImage(
              imageUrl:_imageUrl,
              height: 105.0,
              width: screenWidth,
              fit: BoxFit.cover):
          Image.asset('assets/placeholder.png',
              height: 105.0,
              width: screenWidth,
              fit: BoxFit.cover),
        Center(child: Text(widget.snapShot['categoryName'].toString(), style: TextStyle(color: Colors.white, fontSize: 14.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500),),),

        ],
      ),),
    ),
      onTap: (){
      Navigator.push(context, MaterialPageRoute<void>(builder: (context) => PressVideoList(title: 'charmaine tv', category: widget.snapShot['categoryName'].toString(), categoryId: widget.snapShot.documentID,)));
    },);
  }
}