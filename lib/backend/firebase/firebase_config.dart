import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDn7XKq0JNbNqj1eaLOel-Ua8mtjZ5dYzA",
            authDomain: "customdev-nu3food.firebaseapp.com",
            projectId: "customdev-nu3food",
            storageBucket: "customdev-nu3food.appspot.com",
            messagingSenderId: "1052547698119",
            appId: "1:1052547698119:web:1532ffd461f5c1ef255de2",
            measurementId: "G-YFH0JFDXGK"));
  } else {
    await Firebase.initializeApp();
  }
}
