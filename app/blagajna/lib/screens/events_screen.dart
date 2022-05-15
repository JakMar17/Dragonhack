import 'package:blagajna/data/events_repo.dart';
import 'package:blagajna/qr_reader/qr_reader.dart';
import 'package:blagajna/screens/event_card.dart';
import 'package:blagajna/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class EventsScreen extends StatefulWidget {
  EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool loading = true;

  Barcode? result;
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    if (loading) {
      final eventRepo = EventsRepo();
      eventRepo.getEvents().then((value) {
        setState(() => loading = false);
      });
      return Scaffold(
        backgroundColor: ThemeColors.backeground,
        body: Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        )),
      );
    }

    return Scaffold(
      backgroundColor: ThemeColors.backeground,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.03),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: h * 0.03, bottom: h * 0.02),
                  child: Row(
                    children: [
                      Text(
                        "Aktivni dogodki",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    slivers: [
                      EventCard(),
                      EventCard(),
                      EventCard(),
                      EventCard(),
                      EventCard(),
                      EventCard(),
                      EventCard(),
                      EventCard(),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
