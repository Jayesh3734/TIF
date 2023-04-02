import 'package:flutter/material.dart';
import 'package:tif/apiStructure/event.dart';
import 'package:intl/intl.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;

  const EventDetailsScreen({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(event.title),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(event.bannerImage),
                SizedBox(height: 16.0),
                Text(
                  event.title,
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(height: 16.0),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(event.organizerIcon),
                  ),
                  title: Text(event.organizerName),
                  subtitle: Text("Organizer"),
                ),
                ListTile(
                  leading: Icon(Icons.date_range),
                  title: Text(DateFormat.yMMMMd().format(event.dateTime)),
                  subtitle: Text(DateFormat.jm().format(event.dateTime)),
                ),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text(event.venueName),
                  subtitle: Text('${event.venueCity}, ${event.venueCountry}'),
                ),
                SizedBox(height: 16.0),
                Text(
                  "About Event",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 16.0),
                Text(
                  event.description,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ));
  }
}
