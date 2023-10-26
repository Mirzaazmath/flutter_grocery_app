import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state_management/loading_provider.dart';
import 'firebase_services/store_user_in_database.dart';


class AuthServices  {
  static signupUser(
      String email, String password, String name, BuildContext context,WidgetRef ref) async {
    try {
      // this line create a user in database
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      // here we are saving the user detail in user section in our database
      await FirestoreServices.saveUser(name, email, userCredential.user!.uid,password);
     // success
      ref.read(loadingProvider.notifier).update((state) => LoadingState.success);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registration Successful')));
      // errors
    } on FirebaseAuthException catch (e) {

      if (e.code == 'weak-password') {
        // weak password error
        // State Change
        ref.read(loadingProvider.notifier).update((state) => LoadingState.failure);
        // error display
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Password Provided is too weak')));
      } else if (e.code == 'email-already-in-use') {
        // exsisting  user error
        // State Change
        ref.read(loadingProvider.notifier).update((state) => LoadingState.failure);
        // error display
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Email Provided already Exists')));
      }
      // for other errors
    } catch (e) {

      // State Change
      ref.read(loadingProvider.notifier).update((state) => LoadingState.failure);
      // error display
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }

  }

  static signinUser(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('You are Logged in')));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No user Found with this Email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Password did not match')));
      }
    }
  }
}