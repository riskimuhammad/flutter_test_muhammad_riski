import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  RxList<Contact> contactsList = <Contact>[].obs;
  Rx<bool> contactPermission = false.obs;
  Rx<bool> isLoading = false.obs;

  build() {}

  Future _permission() async {
    try {
      isLoading.value = false;
      final status = await FlutterContacts.requestPermission();
      if (!status) {
        contactPermission.value = true;
      } else {
        contactPermission.value = true;
        await getContact();
        isLoading.value = true;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  getContact() async {
    contactsList.clear();
    final contacts = await FlutterContacts.getContacts();
    for (var element in contacts) {
      final contactById = await FlutterContacts.getContact(element.id);
      if (contactById != null) {
        contactsList.add(contactById);
      }
    }
  }

  createExternalContact() async {
    await FlutterContacts.openExternalInsert();
  }

  Widget validationDataEntry(
      {Widget? loading, Widget? emptyData, Widget? child}) {
    if (contactsList.isEmpty) {
      return emptyData!;
    } else {
      return child!;
    }
  }

  @override
  void onInit() {
    _permission();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
