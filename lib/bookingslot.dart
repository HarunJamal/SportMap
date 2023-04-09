import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'my_globals.dart' as globals;

class BookingSlot extends StatefulWidget {
  const BookingSlot({super.key});

  @override
  State<BookingSlot> createState() => _BookingSlotState();
}

class _BookingSlotState extends State<BookingSlot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text(globals.globalName),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Image.network(
            globals.globalImage,
            fit: BoxFit.cover,
            width: 400,
            height: 400,
          ),
          SizedBox(width: 500),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(children: [
              Icon(Icons.watch_later_outlined),
              Text('10 AM - 8 PM'),
              SizedBox(width: 150),
              Text("Price/hr: ${globals.globalPrice}"),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [Icon(Icons.location_on), Text(globals.globalArea)],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pushNamed("slot_screen");
        },
        label: Text('Book Slot'),
        icon: Icon(Icons.access_time),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
