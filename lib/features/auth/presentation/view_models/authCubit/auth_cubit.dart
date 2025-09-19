import 'package:aloroupia/features/auth/data/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  UserModel userModel = UserModel();
  bool? obscurePasswordTextValue = true;

  GlobalKey<FormState> resetPasswordFormKey = GlobalKey();
  bool? termsAndConditionCheckBox = false;
  Future<void> signUpWithEmailAndPassword() async {
    try {
      // Validate required fields
      if (userModel.email == null || userModel.email!.isEmpty) {
        if (!isClosed)
          emit(SignUpFailuerState(errMessage: "Email is required"));
        return;
      }
      if (userModel.password == null || userModel.password!.isEmpty) {
        if (!isClosed)
          emit(SignUpFailuerState(errMessage: "Password is required"));
        return;
      }

      if (!isClosed) emit(SignUpLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userModel.email!,
        password: userModel.password!,
      );
      await addUserProfile();
      await verifyAccout();
      if (!isClosed) emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      _signUpHandFirebaseException(e);
    } catch (e) {
      if (!isClosed) emit(SignUpFailuerState(errMessage: e.toString()));
    }
  }

  void _signUpHandFirebaseException(FirebaseAuthException e) {
    if (isClosed) return;

    if (e.code == "weak-password") {
      emit(SignUpFailuerState(errMessage: "The password provided is too weak"));
    } else if (e.code == "email-already-in-use") {
      emit(
        SignUpFailuerState(
          errMessage: "The account already exists for that email",
        ),
      );
    } else if (e.code == "invalid-email") {
      emit(SignUpFailuerState(errMessage: "The email is invalid."));
    } else {
      emit(SignUpFailuerState(errMessage: e.code));
    }
  }

  // void updateTremsAndConditionCheckBox({required newValue}) {
  //   termsAndConditionCheckBox = newValue;
  //   emit(TermsAndConditionUpdateState());
  // }

  Future<void> verifyAccout() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await currentUser.sendEmailVerification();
    }
  }

  void obscurePasswordText() {
    if (isClosed) return;

    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      // Validate required fields
      if (userModel.email == null || userModel.email!.isEmpty) {
        if (!isClosed)
          emit(SignInFailuerState(errMessage: "Email is required"));
        return;
      }
      if (userModel.password == null || userModel.password!.isEmpty) {
        if (!isClosed)
          emit(SignInFailuerState(errMessage: "Password is required"));
        return;
      }

      if (!isClosed) emit(SignInLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userModel.email!,
        password: userModel.password!,
      );
      if (!isClosed) emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (isClosed) return;

      if (e.code == 'user-not-found') {
        emit(SignInFailuerState(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(
          SignInFailuerState(
            errMessage: 'Wrong password provided for that user.',
          ),
        );
      } else {
        emit(SignInFailuerState(errMessage: 'Email or password not correct'));
      }
    } catch (e) {
      if (!isClosed) emit(SignInFailuerState(errMessage: e.toString()));
    }
  }

  Future<void> resetPasswordWithLink() async {
    try {
      // Validate required fields
      if (userModel.email == null || userModel.email!.isEmpty) {
        if (!isClosed)
          emit(ResetPasswordFailuerState(errMessage: "Email is required"));
        return;
      }

      if (!isClosed) emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: userModel.email!,
      );
      if (!isClosed) emit(ResetPasswordSuccessState());
    } catch (e) {
      if (!isClosed) emit(ResetPasswordFailuerState(errMessage: e.toString()));
    }
  }

  Future<void> addUserProfile() async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    await users.add({
      "email": userModel.email,
      "name": userModel.name,
      "birthDate": userModel.birthDate,
      "profileImage": userModel.profileImage,
    });
  }
}
