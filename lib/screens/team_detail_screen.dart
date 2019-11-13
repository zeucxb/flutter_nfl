import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nflapp/models/team.dart';

class TeamDetailScreen extends StatelessWidget {
  final Team team;

  const TeamDetailScreen({
    Key key,
    this.team,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(team.name),
      ),
      body: Center(
        child: Hero(
          tag: team.teamID,
          child: SvgPicture.network(
            team.wikipediaLogoUrl,
          ),
        ),
      ),
    );
  }
}
