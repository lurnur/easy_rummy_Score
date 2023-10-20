import 'package:flutter/material.dart';

class ScoreCardView extends StatelessWidget {
  ScoreCardView({
      super.key, 
      required this.playerName,
    }
  );
  String playerName='';
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient:  LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: const [
              Colors.lightBlue,
              Colors.lightBlueAccent,
              Colors.blue,
              Colors.blueAccent,
            ],
          ),
        ),
        child: ListTile(
          leading: CircleAvatar(child: Text('A')),
          title: Text(playerName),
          subtitle: Text('128\n20\n5'),
        )
      ),
    );
  }
}
