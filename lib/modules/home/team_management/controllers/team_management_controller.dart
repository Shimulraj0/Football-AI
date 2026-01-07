import 'package:get/get.dart';

class TeamManagementController extends GetxController {
  final players = [
    {
      "name": "Sarah Martinez",
      "age": "13 years",
      "role": "Midfielder",
      "team": "Team A",
      "attendance": 92,
      "passing": 92,
      "dribbling": 40,
    },
    {
      "name": "Alex Johnson",
      "age": "13 years",
      "role": "Midfielder",
      "team": "Team A",
      "attendance": 98,
      "passing": 98,
      "dribbling": 80,
    },
    {
      "name": "Mike Chen",
      "age": "13 years",
      "role": "Midfielder",
      "team": "Team A",
      "attendance": 80,
      "passing": 80,
      "dribbling": 10,
    },
  ].obs;

  void addPlayer(String name, String age, String role, String team) {
    players.add({
      "name": name,
      "age": "$age years", // formatting as existing data
      "role": role,
      "team": team,
      "attendance": 0,
      "passing": 0,
      "dribbling": 0,
    });
  }
}
