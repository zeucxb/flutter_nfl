import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nflapp/models/team.dart';

class NFLSevice {
  static Future<List<Team>> getTeams() async {
    final response = await http.get(
        'https://api.sportsdata.io/v3/nfl/scores/json/Teams?key=46124bf15b8245d2a9a0ed9c776b7c73');

    Iterable jsonList = json.decode(response.body);

    return jsonList.map((json) => Team.fromJson(json)).toList();
  }
}
