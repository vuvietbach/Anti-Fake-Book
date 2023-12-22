import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final String placeholder;
  final Function(String)? searchCallback;
  final Function? onClear;
  final bool readOnly;
  const CustomSearchBar(
      {super.key,
      this.placeholder = "Tìm kiếm",
      this.searchCallback,
      this.onClear,
      this.readOnly = false});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      readOnly: widget.readOnly,
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
        if (widget.searchCallback != null) {
          widget.searchCallback!.call(_controller.text);
        }
      },
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200], // Grey background color
        hintText: widget.placeholder, // Text placeholder
        hintStyle: const TextStyle(color: Colors.grey),
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        border: OutlineInputBorder(
          borderSide: BorderSide.none, // Remove border
          borderRadius: BorderRadius.circular(30.0), // Adjust the border radius
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        suffixIcon: IconButton(
          onPressed: () {
            _controller.clear();
            if (widget.onClear != null) {
              widget.onClear!();
            }
          },
          icon: const Icon(Icons.clear, color: Colors.grey),
        ),
      ),
    );
  }
}
