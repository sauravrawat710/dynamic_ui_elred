import 'package:flutter/material.dart';

class BuildCustomTextField extends StatefulWidget {
  const BuildCustomTextField(
      {super.key, this.initialValue, required this.label, this.onChanged});

  final String? initialValue;
  final String label;
  final Function(String value)? onChanged;

  @override
  State<BuildCustomTextField> createState() => _BuildCustomTextFieldState();
}

class _BuildCustomTextFieldState extends State<BuildCustomTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF4F6F9),
          hintText: widget.label,
          hintStyle: const TextStyle(
            color: Color(0x7F060606),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
