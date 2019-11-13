import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nflapp/models/team.dart';
import 'package:nflapp/screens/team_detail_screen.dart';
import 'package:nflapp/services/nfl_service.dart';

class TeamsScreen extends StatefulWidget {
  @override
  _TeamsScreenState createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  List<Team> teams = [];

  populateTeams() async {
    final listTeams = await NFLSevice.getTeams();

    setState(() {
      teams = listTeams;
    });
  }

  @override
  void initState() {
    populateTeams();
    super.initState();
  }

  _onPressed(Team team) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => TeamDetailScreen(
          team: team,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NFL'),
      ),
      body: ListView.builder(
        itemCount: teams.length,
        itemBuilder: (BuildContext context, int index) {
          final team = teams[index];

          return Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    child: Hero(
                      tag: team.teamID,
                      child: SvgPicture.network(
                        team.wikipediaLogoUrl,
                      ),
                    ),
                  ),
                  title: Text(team?.name),
                  subtitle: Text('${team.conference} ${team.division}'),
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text('DETAIL'),
                        onPressed: () => _onPressed(team),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
