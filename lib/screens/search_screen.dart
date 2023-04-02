import 'package:flutter/material.dart';
import 'package:tif/apiStructure/event.dart';
import 'package:tif/apiCall/event_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tif/screens/event_details_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Event> _events = [];
  List<Event> _searchedEvents = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getEvents();
  }

  void _getEvents() async {
    try {
      final events = await EventsService.fetchEvents();
      setState(() {
        _events = events;
        _searchedEvents = events;
      });
    } catch (e) {
      print(e);
    }
  }

  void _searchEvents(String query) {
    final matchedEvents = _events
        .where(
            (event) => event.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      _searchedEvents = matchedEvents;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search by event title...',
            border: InputBorder.none,
          ),
          onChanged: (query) {
            _searchEvents(query);
          },
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _searchedEvents.length,
        itemBuilder: (context, index) {
          final event = _searchedEvents[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(event.bannerImage),
            ),
            title: Text(event.title),
            subtitle: Text(event.venueCity),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventDetailsScreen(event: event),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
