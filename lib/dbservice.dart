import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:time_machine/time_machine.dart';
import 'authservice.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';
import 'widgetassets.dart';
import 'constants.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> initUserData() async {
    var now = Instant.now();
    final DocumentReference docCollection =
        FirebaseFirestore.instance.collection('users').doc(uid);

    return docCollection.set({
      'exists': true,
      'UTCTime': '${now.toString('dddd yyyy-MM-dd HH:mm')}',
    });
  }
}

class yCardsStream extends StatelessWidget {
  //yCardsStream({this.uid});
  static String uid = FirebaseAuth.instance.currentUser.uid;
  CollectionReference universalcardcol =
      FirebaseFirestore.instance.collection('cards');
  CollectionReference privatecardlist = FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('cards');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: privatecardlist.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CupertinoActivityIndicator());
          }

          return ListView(
            children: (snapshot.data.docs.length == 0)
                ? noData
                : snapshot.data.docs.map((DocumentSnapshot document) {
                    String docid = document.id;
                    DocumentReference targetCard = universalcardcol.doc(docid);
                    return new cardPainter(targetCard: targetCard);
                  }).toList(),
          );
        });
  }
}

List<Widget> noData = [
  SizedBox(
    height: 70,
  ),
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 75,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Hexcolor(tealTheme['strong']),
                          Hexcolor(tealTheme['light'])
                        ]),
                    borderRadius: BorderRadius.circular(7)),
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 10),
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 75,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Hexcolor(orangeTheme['strong']),
                          Hexcolor(orangeTheme['light'])
                        ]),
                    borderRadius: BorderRadius.circular(7)),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 75,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Hexcolor(blueTheme['strong']),
                          Hexcolor(blueTheme['light'])
                        ]),
                    borderRadius: BorderRadius.circular(7)),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
  SizedBox(
    height: 20,
  ),
  Center(
    child: Text(
      'No Cards Yet',
      style: GoogleFonts.comfortaa(
        fontSize: 18,
        fontWeight: FontWeight.w300,
      ),
    ),
  ),
];

class cardPainter extends StatelessWidget {
  cardPainter({this.targetCard});

  final DocumentReference targetCard;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: targetCard.get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return mainCard(
            name: data['name'],
            website: data['website'],
            description: data['description'],
            email: data['email'],
            organisation: data['organisation'],
            phone: data['phone'],
            themec: data['theme'],
          );
        }

        return Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }
}

class addCardService {
  addCardService(
      {this.name,
      this.email,
      this.phone,
      this.website,
      this.theme,
      this.organisation,
      this.description});

  final String name;
  final String email;
  final String phone;
  final String website;
  final String theme;
  final String organisation;
  final String description;

  var uuid = Uuid();

  Future addCard() async {
    try {
      String uid = FirebaseAuth.instance.currentUser.uid;
      CollectionReference universalcardcol =
          FirebaseFirestore.instance.collection('cards');
      CollectionReference privatecardlist = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('cards');
      String cuuid = uuid.v4();

      final setuniversalValue = await universalcardcol.doc(cuuid).set({
        'name': '${this.name}',
        'website': '${this.website}',
        'phone': '${this.phone}',
        'theme': '${this.theme}',
        'email': '${this.email}',
        'organisation': '${this.organisation}',
        'description': '${this.description}'
      });
      setuniversalValue;

      final setprivateList =
          await privatecardlist.doc(cuuid).set({'exists': true});
      setprivateList;
    } catch (error) {
      print(error);
    }
  }
}
