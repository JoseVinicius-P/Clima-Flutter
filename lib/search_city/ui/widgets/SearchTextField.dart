import 'package:clima/values/MyColors.dart';
import 'package:clima/values/MyStrings.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      style: const TextStyle(
        color: MyColors.textColorPrimary,
      ),
      cursorColor: MyColors.textColorPrimary,
      autocorrect: false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15.5),
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: MyColors.textColorPrimary,
        ),
        hintText: MyStrings.pesquisar,
        hintStyle: const TextStyle(color: MyColors.textColorPrimary),
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
      ),
    );
  }
}