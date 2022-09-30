import 'package:flutter/material.dart';

class CustomInputField {
  static Column _inputField(String title, TextEditingController controller) {
    return Column(
      children: [
        Text('$title',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
        Container(
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          width: double.infinity,
          child: TextFormField(
            controller: controller,
          ),
        )
      ],
    );
  }
}
