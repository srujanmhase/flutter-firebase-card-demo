import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class profileDash extends StatefulWidget {
  @override
  _profileDashState createState() => _profileDashState();
}

class _profileDashState extends State<profileDash> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 10, 0, 12),
                child: Text(
                  'Profile',
                  style: GoogleFonts.comfortaa(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
