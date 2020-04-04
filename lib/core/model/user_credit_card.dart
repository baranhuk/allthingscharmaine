import 'package:cloud_firestore/cloud_firestore.dart';

class UserCreditCard {
  String creditcardType;
  String creditcardNumber;
  String creditcardHolderName;
  String expiryMonth;
  String expiryYear;
  bool defaultCard;
  final DocumentReference reference;

  UserCreditCard(
      {this.creditcardType,
      this.creditcardNumber,
      this.creditcardHolderName,
      this.expiryMonth,
      this.expiryYear,
      this.defaultCard,
      this.reference});

  UserCreditCard.fromMap(Map<dynamic, dynamic> map, {this.reference})
      : creditcardNumber = map["creditcardNumber"].toString(),
        creditcardHolderName = map["creditcardHolderName"].toString(),
        expiryMonth = map["expiryMonth"].toString(),
        defaultCard = map["defaultCard"] as bool,
        expiryYear = map["expiryYear"].toString(),
        creditcardType = map["creditcardType"].toString();

  UserCreditCard.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["expiryYear"] = expiryYear;
    data["creditcardType"] = creditcardType;
    data["creditcardNumber"] = creditcardNumber;
    data["creditcardHolderName"] = creditcardHolderName;
    data["expiryMonth"] = expiryMonth;
    data["defaultCard"] = defaultCard;
   
    return data;
  }
}

final userCreditCard = UserCreditCard();
