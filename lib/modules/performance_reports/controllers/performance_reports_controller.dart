import 'package:get/get.dart';

class PerformanceReportsController extends GetxController {
  // Team Averages Data (0.0 to 1.0 scale for progress bars)
  late final Map<String, double> teamAverages;

  // Raw percentage strings for display
  late final Map<String, String> teamAveragesDisplay;

  final List<Map<String, dynamic>> topPerformers = [
    {
      'rank': 1,
      'name': 'Sarah Martinez',
      'role': 'Midfielder',
      'score': '87 %',
    },
    {'rank': 2, 'name': 'Alex Johnson', 'role': 'Forward', 'score': '90 %'},
    {'rank': 3, 'name': 'Mike Chen', 'role': 'Defender', 'score': '80 %'},
  ];

  final List<Map<String, dynamic>> individualReports = [
    {
      'name': 'Sarah Martinez',
      'role': 'Midfielder',
      'stats': {
        'passing': '90 %',
        'dribbling': '85 %',
        'shooting': '70 %',
        'defense': '60 %',
        'stamina': '40 %',
      },
    },
    {
      'name': 'Alex Johnson',
      'role': 'Forward',
      'stats': {
        'passing': '90 %',
        'dribbling': '85 %',
        'shooting': '70 %',
        'defense': '60 %',
        'stamina': '40 %',
      },
    },
    {
      'name': 'Mike Chen',
      'role': 'Defender',
      'stats': {
        'passing': '90 %',
        'dribbling': '85 %',
        'shooting': '70 %',
        'defense': '60 %',
        'stamina': '40 %',
      },
    },
  ];

  @override
  void onInit() {
    super.onInit();
    // Initialize mock data
    teamAverages = {
      'passing': 0.73,
      'dribbling': 0.83,
      'shooting': 0.70,
      'defense': 0.86,
    };

    teamAveragesDisplay = {
      'passing': '73 %',
      'dribbling': '83 %',
      'shooting': '70 %',
      'defense': '86 %',
    };
  }

  void shareReport() {
    Get.snackbar('Share Report', 'Report sharing initiated!');
  }
}
