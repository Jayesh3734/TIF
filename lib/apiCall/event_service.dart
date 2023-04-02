import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tif/apiStructure/event.dart';

class EventsService {
  static const String apiUrl =
      'https://sde-007.api.assignment.theinternetfolks.works/v1/event';

  static Future<List<Event>> fetchEvents() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['content']['data'] as List;
      return jsonData.map((e) => Event.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch events from API');
    }
  }
}
