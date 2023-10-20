import 'package:flutter/material.dart';
import 'package:easy_rummy_score/players/player_tab.dart';
import 'package:easy_rummy_score/score/score_tab.dart';
import 'package:easy_rummy_score/settings/setting_tab.dart';
import 'package:easy_rummy_score/players/player_model.dart';

class ScoreAppHome extends StatefulWidget {
  const ScoreAppHome({super.key});


  @override
  State<ScoreAppHome> createState() => _ScoreAppHomeState();
}

class _ScoreAppHomeState extends State<ScoreAppHome> {
  int currentPageIndex = 0;

  List<Widget> appTabScreens = [];
  final List<Player> players = [];


  @override
  void initState() {
    appTabScreens = <Widget>[
      PlayersTab(players: players),
      ScoreTab(players: players),
      SettingsTab(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Rummy Score'),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber[800],
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon:Icon(Icons.scoreboard_outlined),
            icon: Icon(Icons.people),
            label: 'Players',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.people_outlined),
            icon: Icon(Icons.scoreboard),
            label: 'Score',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings_outlined),
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: appTabScreens[currentPageIndex],
    );
  }
}