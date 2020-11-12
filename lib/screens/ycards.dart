import 'dart:ui';

import 'package:card_demo/dbservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:ui' as ui;
import 'package:card_demo/widgetassets.dart';
import 'package:card_demo/constants.dart';
import 'package:card_demo/routes.dart';

class ycards extends StatefulWidget {
  @override
  _ycardsState createState() => _ycardsState();
}

class _ycardsState extends State<ycards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 10, 0, 12),
                child: Text(
                  'Your Cards',
                  style: GoogleFonts.comfortaa(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 12, 5),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(12.0)),
                  height: 40,
                  width: 120,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, toAddYCard());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_circle_outline),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Add a Card')
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 550,
            child: yCardsStream(),
          )
        ],
      ),
    );
  }
}

// List<Widget> items = [
//   mainCard(themec: 0),
//   mainCard(themec: 1),
//   mainCard(themec: 2),
//   mainCard(themec: 0),
// ];
