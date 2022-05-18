import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 50,
              color: const Color(0xFF0C9869).withOpacity(0.23),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: const TextStyle(color: Colors.green),
            suffixIcon: SvgPicture.asset(
              "assets/icons/search.svg",
              color: Colors.green,
            ),
            suffixIconConstraints: const BoxConstraints(maxHeight: 19.0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide.none
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          ),
        ),
      ),
    );
  }
}