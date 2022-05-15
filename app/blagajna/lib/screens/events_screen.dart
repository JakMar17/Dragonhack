import 'package:blagajna/screens/event_card.dart';
import 'package:blagajna/styles/colors.dart';
import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backeground,
      body: SafeArea(
        child: Column(children: [
          EventCard(),
          EventCard(),
          EventCard(),
        ]),
      ),
    );
  }
}
