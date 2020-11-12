import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class sccards extends StatefulWidget {
  @override
  _sccardsState createState() => _sccardsState();
}

class _sccardsState extends State<sccards> {
  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double screenHeight(BuildContext context, {double mulBy = 1}) {
    return screenSize(context).height * mulBy;
  }

  double screenWidth(BuildContext context, {double mulBy = 1}) {
    return screenSize(context).width * mulBy;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 10, 0, 10),
                child: Text(
                  'Add a New Card',
                  style: GoogleFonts.comfortaa(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Container(
              width: double.infinity,
              height: 65,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_circle_outline),
                        SizedBox(
                          width: 17,
                        ),
                        Text("Scan a new card")
                      ],
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 10, 0, 10),
                child: Text(
                  'Scanned Cards',
                  style: GoogleFonts.comfortaa(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
            child: Container(
              width: double.infinity,
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Search by contact details or event...",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  Icon(Icons.search),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
