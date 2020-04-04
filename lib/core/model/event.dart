import 'package:allthingscharmaine/utils/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Event {
  Event({
    this.id,
    this.image,
    this.title,
    this.description,
    this.date,
  });

  final String id;
  final String title;
  final String description;
  final String image;
  final DateTime date;

  Event.fromSnapShot(DocumentSnapshot snapshot, String imageUrl):
        id = snapshot.documentID,
        title = snapshot[Config.title] as String,
        description = snapshot[Config.desc] as String,
        date = DateTime.parse(snapshot['eventDate'].toDate().toString()),
        image = imageUrl;


}
