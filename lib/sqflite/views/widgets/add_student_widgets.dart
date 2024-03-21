import 'package:flutter/material.dart';

class AddStudentWidgets {
  BuildContext context;

  AddStudentWidgets({required this.context});

  AppBar appBarView({String title = "Add New Student"}) => AppBar(
        title: Text(title),
      );

  Widget textFormField(TextEditingController controller,
      {String hintText = "", int? maxLength,TextInputType keyBoardType = TextInputType.text}) {
    return TextFormField(
      keyboardType: keyBoardType,
      controller: controller,
      maxLength: maxLength,
      validator: (text) =>
          text?.isNotEmpty == true ? null : "This field is required",
      decoration: _decorator(hintText),
    );
  }

  Widget genderDropDown(List<String> items,
          {required void Function(String?)? onChanged,
          String hintText = "",
          String selected = "Male"}) =>
      DropdownButtonFormField(
        value: selected,
        items: items
            .map((e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
        onChanged: onChanged,
        decoration: _decorator(hintText),
      );

  Widget maritalCheckBox(bool isSelected,
          {required void Function(bool?)? onChanged}) =>
      CheckboxListTile(
          title: const Text("Is Married"),
          value: isSelected,
          activeColor: Colors.deepPurple,
          onChanged: onChanged);

  _decorator(String hintText) => InputDecoration(
      hintText: hintText,
      counterText: "",
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple)));

  Widget addButtonView({void Function()? onPressed, String title = "Add"}) =>
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              fixedSize: Size(MediaQuery.of(context).size.width,50)),
          onPressed: onPressed,
          child: Text(
            title,
            style: const TextStyle(fontSize: 20),
          ));
}
