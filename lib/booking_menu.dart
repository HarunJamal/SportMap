import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'bookingslot.dart';
import 'my_globals.dart' as globals;

class BookingMenu extends StatefulWidget {
  const BookingMenu({super.key});

  @override
  State<BookingMenu> createState() => _BookingMenuState();
}

class _BookingMenuState extends State<BookingMenu> {
  final CollectionReference _venues =
      FirebaseFirestore.instance.collection('venues');
  String venueName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          backgroundColor: Colors.green[700],
          title: const Text("Venues"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: StreamBuilder(
            stream: _venues.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    return Card(
                        margin: const EdgeInsets.all(15),
                        child: ListTile(
                          leading: Image.network(documentSnapshot['image']),
                          title: Text(documentSnapshot['name']),
                          subtitle: Text(documentSnapshot['sport']),
                          onLongPress: () {
                            globals.globalName = documentSnapshot['name'];
                            globals.globalImage = documentSnapshot['image'];
                            globals.globalArea = documentSnapshot['area'];
                            globals.globalPrice =
                                documentSnapshot['price_per_hr'];
                            globals.globalSport = documentSnapshot['sport'];
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed("bookingslot");
                          },
                        ));
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
