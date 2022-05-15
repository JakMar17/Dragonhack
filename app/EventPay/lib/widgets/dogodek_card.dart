import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../router/routes.dart';
import '../style/colors.dart';
import '../style/constants.dart';

class DogodekCard extends StatelessWidget {
  final String datum;
  final String kraj;
  final String naslov;
  final String slika;

  final Function()? onTap;

  const DogodekCard(
      {Key? key,
      required this.datum,
      required this.kraj,
      required this.naslov,
      required this.slika,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              image: DecorationImage(
                image: NetworkImage(slika),
                fit: BoxFit.fill,
              ),
            ),
            width: double.infinity,
            height: 200,
          ),
          Positioned(
            child: Text(
              datum.split("T")[0],
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            top: 60,
            left: 15,
          ),
          Positioned(
            child: Text(
              kraj,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            top: 90,
            left: 15,
          ),
          Positioned(
            child: Text(
              naslov,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: 15,
            left: 15,
          ),
        ],
      ),
    );
  }
}
