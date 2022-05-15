import 'package:blagajna/styles/colors.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class EventCard extends StatelessWidget {
  final String image = "";
  const EventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Card(
      child: Container(
        height: h * 0.25,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg"),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Text("YOUR TEXT"),
      ),
    );
  }
}
