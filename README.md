# flutter-firebase-card-demo
### [ a.o. 11/11/2020 ongoing - not complete] A complete digital Business Contact-Card social network.

This project intends to accomplish the following two distinct functionalities to provide a complete end-to-end digital business card manager:

1. Creating digital online "Business Cards" with all the relevant information and easy access links to contact information and being able to share them to those with or without the app easily using QR Code and E-Mail. If the user scanning the business card has the app, they can easily save it in their "Scanned Cards" section. If the user does not have the app, then they will be redirected to a webpage in a normal browser with the business card and have an option to have it sent it to their inbox to save it.

[DONE: Create a card and use a StreamBuilder to show realtime changes in "My Cards" stream] 

[DONE: Be able to change the card theme while creating it] 

[TODO: Implementing Share via QR and edit functionality]

---

2. Using Smartphone/Tablet camera to scan existing physical business cards, using Firebase ML to scan the text and save it in the form of card in their "Scanned cards" section.
[not-implemented]

## What is planned to accomplish
To make physical business cards redundant during in-person business meetings and making the vast chunk of physical business cards of power users easily searchable and more accessible.

## Technology Stack
Adobe XD, Flutter, Firebase.


## Appendix:
1. The business cards: user created & scanned to be stored in Firestore. 
2. Storing the photographs of scanned physical business cards in Firebase Storage bucket.

## Packages a.o. 12/11/2020
  - google_fonts: ^1.1.0
  - firebase_core: ^0.5.0
  - firebase_auth: ^0.18.0+1
  - http: ^0.12.2
  - google_sign_in: ^4.5.3
  - cloud_firestore: ^0.14.0+2
  - time_machine: ^0.9.13
  - flutter_signin_button: ^1.1.0
  - hexcolor: ^1.0.4
  - flutter_svg: ^0.19.0
  - uuid: ^2.2.2
  
Working Video: 

[![Alt text](https://img.youtube.com/vi/qSlq393dCOI/0.jpg)](https://www.youtube.com/watch?v=qSlq393dCOI)

## Firestore Storage Structure
![alt text](https://github.com/srujanmhase/flutter-firebase-card-demo/blob/main/arch1.JPG?raw=true)
Fig.1: Consolidated Card List with details and doc.id: UUID (v4) generated at the time of creation of the card.

![alt text](https://github.com/srujanmhase/flutter-firebase-card-demo/blob/main/arch2_LI.jpg?raw=true)
Fig.2: Individual users with their doc.id: "Firebase Auth uid"; nested under which is a simple latest login time in UTC and a collection "cards"

![alt text](https://github.com/srujanmhase/flutter-firebase-card-demo/blob/main/arch3_LI.jpg?raw=true)
Fig.3: The nested cards collection inside the individual user document which consist of a list of docs with UUIDs of the cards created BY the users.

## Service Delivery Structure
As indicated above, each individual firebase auth uid document will have nested "collection" of card UUIDs acting as a list of cards the auth ID has the permission to edit. The changes will be written to the main "cards" collection. The Card UUID will point to the right card in the collection. The card information is stored in the 'global' collection i.e., outside the individual Firebase auth uid so that when the card information is shared, the Firebase auth uid of the card 'owner' doesn't need to be sent over the network.
