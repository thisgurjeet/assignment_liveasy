import 'package:flutter/material.dart';

class LanguagePicker extends StatefulWidget {
  const LanguagePicker({super.key});

  @override
  State<LanguagePicker> createState() => _LanguagePickerState();
}

class _LanguagePickerState extends State<LanguagePicker> {
  String selectedLanguage = 'English';
  List<String> languages = ['English', 'Spanish', 'French', 'German'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: 260,
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black,
        width: 1.0,
      )),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
          child: Text(
            selectedLanguage,
            style: const TextStyle(fontSize: 18, color: Colors.black87),
          ),
        ),
        Expanded(child: Container()),
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 30,
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            onChanged: (String? newValue) {
              setState(() {
                selectedLanguage = newValue!;
              });
            },
            items: languages.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ]),
    );
  }
}
