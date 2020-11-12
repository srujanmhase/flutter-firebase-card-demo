import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

import 'package:hexcolor/hexcolor.dart';
import 'dart:ui' as ui;

class mainLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logoTag',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'nex',
            style: GoogleFonts.comfortaa(
              fontSize: 25,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            width: 0,
          ),
          Text(
            'Card',
            style: GoogleFonts.comfortaa(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class headerLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'nex',
          style: GoogleFonts.comfortaa(
            fontSize: 23,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          width: 0,
        ),
        Text(
          'Card',
          style: GoogleFonts.comfortaa(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class mainCard extends StatelessWidget {
  mainCard(
      {this.name,
      this.email,
      this.phone,
      this.website,
      this.themec,
      this.organisation,
      this.description});

  final String name;
  final String email;
  final String phone;
  final String website;
  final String themec;
  final String organisation;
  final String description;
  Map theme;

  layoutSetter(string) {
    if (string.length <= 75) {
      return 285.0;
    }
    if (string.length > 75) {
      return 310.0;
    }
  }

  themeSetter(themec) {
    if (themec == 'tealTheme') {
      return tealTheme;
    }
    if (themec == 'orangeTheme') {
      return orangeTheme;
    }
    if (themec == 'blueTheme') {
      return blueTheme;
    } else {
      return blueTheme;
    }
  }

  @override
  Widget build(BuildContext context) {
    double buildheight = layoutSetter(description);
    theme = themeSetter(themec);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: buildheight,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Hexcolor(theme['strong']),
                        Hexcolor(theme['light'])
                      ]),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Hexcolor(theme['strong']),
                      blurRadius: 10, // soften the shadow
                      spreadRadius: 1, //extend the shadow
                      offset: Offset(
                        3, // Move to right 10  horizontally
                        3, // Move to bottom 10 Vertically
                      ),
                    )
                  ]),
              child: Stack(
                overflow: Overflow.clip,
                children: [
                  Positioned(
                    top: 90,
                    left: 160,
                    child: Container(
                      height: 135,
                      width: 135,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          //color: Colors.blue,
                          border: Border.all(
                              color: theme['bcolor'].withOpacity(0.5),
                              width: 10)),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 50,
                    child: Container(
                      height: 185,
                      width: 185,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          //color: Colors.blue,
                          border: Border.all(
                              color: theme['bcolor'].withOpacity(0.3),
                              width: 10)),
                    ),
                  ),
                  Positioned(
                    top: 25,
                    right: 15,
                    left: 15,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: ClipRect(
                            child: BackdropFilter(
                              filter:
                                  ui.ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                              child: Container(
                                  //height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius:
                                          BorderRadius.circular(14.0)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: Container(
                                          height: 75,
                                          width: 75,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white
                                                  .withOpacity(0.4)),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 13, 0, 13),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              name,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: 175,
                                              child: Text(
                                                description,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: double.infinity,
                          height: 80,
                          child: ClipRect(
                            child: BackdropFilter(
                              filter:
                                  ui.ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                              child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius:
                                          BorderRadius.circular(14.0)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.ac_unit,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "LinkedIn",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.work,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Website",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.phone_in_talk,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Phone",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      left: 20,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Made in nexCard Free",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            organisation,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Edit Card"),
                    ],
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(Icons.photo_size_select_large),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Share with QR Code"),
                        ],
                      ),
                    )),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(Icons.email),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Share via Email"),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
