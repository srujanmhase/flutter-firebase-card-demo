import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dbservice.dart';
import 'package:hexcolor/hexcolor.dart';
import 'constants.dart';

class addYCardActivity extends StatefulWidget {
  @override
  _addYCardActivityState createState() => _addYCardActivityState();
}

class _addYCardActivityState extends State<addYCardActivity> {
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
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close))
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 7,
              ),
              Text(
                'New Sharable Card',
                style: GoogleFonts.comfortaa(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            height: screenHeight(context, mulBy: 0.85),
            child: ListView(
              //itemExtent: 75,
              children: formItems,
            ),
          )
        ],
      )),
    );
  }
}

class cardForm extends StatefulWidget {
  @override
  _cardFormState createState() => _cardFormState();
}

class _cardFormState extends State<cardForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final websiteController = TextEditingController();
  final descriptionController = TextEditingController();
  final organisationController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    websiteController.dispose();
    descriptionController.dispose();
    organisationController.dispose();
    super.dispose();
  }

  int radioValue = 0;
  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  String setTheme(int radioValue) {
    if (radioValue == 0) {
      return 'tealTheme';
    }
    if (radioValue == 1) {
      return 'orangeTheme';
    }
    if (radioValue == 2) {
      return 'blueTheme';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
                border: const OutlineInputBorder(), labelText: 'Name'),
          ),
          formsizer(),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
                border: const OutlineInputBorder(), labelText: 'E-Mail'),
            keyboardType: TextInputType.emailAddress,
          ),
          formsizer(),
          TextField(
            controller: phoneController,
            decoration: InputDecoration(
                border: const OutlineInputBorder(), labelText: 'Phone'),
            keyboardType: TextInputType.phone,
          ),
          formsizer(),
          TextField(
            controller: websiteController,
            decoration: InputDecoration(
                border: const OutlineInputBorder(), labelText: 'Website URL'),
          ),
          formsizer(),
          TextFormField(
            controller: descriptionController,
            maxLength: 100,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Short Description',
            ),
          ),
          formsizer(),
          TextFormField(
            controller: organisationController,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Organisation Name'),
          ),
          Text('Choose a card theme'),
          formsizer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54, width: 0.6),
                    borderRadius: BorderRadius.circular(7)),
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
                    Text('Teal'),
                    Radio(
                      value: 0,
                      groupValue: radioValue,
                      onChanged: handleRadioValueChanged,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54, width: 0.6),
                    borderRadius: BorderRadius.circular(7)),
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
                    Text('Flame'),
                    Radio(
                      value: 1,
                      groupValue: radioValue,
                      onChanged: handleRadioValueChanged,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54, width: 0.6),
                    borderRadius: BorderRadius.circular(7)),
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
                    Text('Ocean'),
                    Radio(
                      value: 2,
                      groupValue: radioValue,
                      onChanged: handleRadioValueChanged,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
              color: Colors.blue,
              onPressed: () {
                addCardService(
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        theme: setTheme(radioValue),
                        website: websiteController.text,
                        organisation: organisationController.text,
                        description: descriptionController.text)
                    .addCard();
                Navigator.pop(context);
              },
              child: Text(
                'Add Sharable Card',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}

class formsizer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
    );
  }
}

List<Widget> formItems = [
  cardForm(),
];
