import 'package:chatapp/Provider/product_provider.dart';
import 'package:chatapp/Services/firestore_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Learn/edit_product.dart';
///Firebase
const String kProjectID = 'chatapp-d205a';
const String kFirebaseAPIKey = 'AIzaSyA012Ez6F8n9J0PLSSNV4OzqalHeVCHo74';


const String kFirebaseAndroidAppID = '1:837487054656:android:690c5b34febf115e8874a5';
const String kFirebaseMessagingID = '837487054656';

final FirebaseOptions kFirebaseOptions = FirebaseOptions(
  appId:kFirebaseAndroidAppID,
  apiKey: kFirebaseAPIKey,
  projectId: kProjectID,
  messagingSenderId: kFirebaseMessagingID,
);


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var firebaseApp = await Firebase.initializeApp(options: kFirebaseOptions);
  runApp(FlutterChatApp());
}

class FlutterChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreServie();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) => ProductProvider()),
        StreamProvider(create: (context) => firestoreService.getProducts()),
      ],

      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Chat App",

        home: EditProduct(),
      ),
    );
  }
}