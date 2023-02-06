import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managemen_sqlite/ui/widgets/snackbar_box.dart';

class DocumentProvider extends ChangeNotifier {
  // String uniqueIdName = DateTime.now().millisecondsSinceEpoch.toString();
  String fileName = DateTime.now().microsecondsSinceEpoch.toString();

  // Future uploadImageProduct(String path, String fileName) async {
  //   try {
  //     fsStorage.Reference reference = fsStorage.FirebaseStorage.instance
  //         .ref()
  //         .child('product')
  //         .child(firebaseAuth.currentUser!.uid)
  //         .child(fileName);

  //     fsStorage.UploadTask uploadTask = reference.putFile(
  //       File(path),
  //     );

  //     fsStorage.TaskSnapshot taskSnapshot =
  //         await uploadTask.whenComplete(() {}).catchError(
  //       (e) {
  //         Get.back();
  //         snackbarBox(e.toString());
  //       },
  //     );

  //     String downloadUrl = await taskSnapshot.ref.getDownloadURL();

  //     return downloadUrl;
  //   } on FirebaseException catch (e) {
  //     Get.back();

  //     snackbarBox(
  //       e.message.toString(),
  //     );
  //   }
  // }

  Future addDocument(Map<String, dynamic> data, String uniqueIdName) async {
    try {
      final ref = await FirebaseFirestore.instance.collection('document');

      ref.doc(uniqueIdName).set(data).catchError(
        (e) {
          return snackbarBox(e.toString());
        },
      );
    } on FirebaseException catch (e) {
      return snackbarBox(
        e.message.toString(),
      );
    }
  }

  // Future editImageProduct(String path, String idProduct) async {
  //   fsStorage.Reference reference = fsStorage.FirebaseStorage.instance
  //       .ref()
  //       .child('product')
  //       .child(firebaseAuth.currentUser!.uid)
  //       .child(idProduct);

  //   fsStorage.UploadTask uploadTask = reference.putFile(
  //     File(path),
  //   );

  //   fsStorage.TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});

  //   String downloadUrl = await taskSnapshot.ref.getDownloadURL();

  //   return downloadUrl;
  // }

  Future editDocument(String idDocument, Map<String, dynamic> data) async {
    try {
      final eProductUsers = await FirebaseFirestore.instance
          .collection('document')
          .doc(idDocument);

      eProductUsers.update(data);
    } on FirebaseException catch (e) {
      Get.back();

      snackbarBox(
        e.message.toString(),
      );
    }
  }

  Future deleteDocument(String idDocument) async {
    try {
      final dProductUsers =
          await FirebaseFirestore.instance.collection('document');
      dProductUsers.doc(idDocument).delete().catchError(
        (e) {
          Get.back();

          snackbarBox(
            e.toString(),
          );
        },
      );
    } on FirebaseException catch (e) {
      Get.back();

      snackbarBox(
        e.message.toString(),
      );
    }
  }
}
