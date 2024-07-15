import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDiuIwmChKfGg-jBfb8CP-jyiqzB4zNUM8",
            authDomain: "daily-checkup-d6ixp1.firebaseapp.com",
            projectId: "daily-checkup-d6ixp1",
            storageBucket: "daily-checkup-d6ixp1.appspot.com",
            messagingSenderId: "753389128741",
            appId: "1:753389128741:web:426df8dfaf3af8a16003cc"));
  } else {
    await Firebase.initializeApp();
  }
}
