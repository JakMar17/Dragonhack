import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../router/routes.dart';
import '../../style/colors.dart';
import '../../style/constants.dart';

class EPCard extends StatelessWidget {
  final String title;
  final num money;
  final String pic;

  final Function()? onTap;

  const EPCard(
      {Key? key,
      required this.title,
      required this.money,
      required this.pic,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(24.0)),
              image: DecorationImage(
                image: NetworkImage(pic),
                fit: BoxFit.fill,
              ),
            ),
            width: double.infinity,
            height: 170,
          ),
          Positioned(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: 15,
            left: 30,
          ),
          Positioned(
            child: Text(
              money.toString() + '€',
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: 15,
            right: 30,
          ),
        ],
      ),
    );
  }
}
