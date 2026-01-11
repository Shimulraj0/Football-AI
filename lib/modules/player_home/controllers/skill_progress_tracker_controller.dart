import 'package:get/get.dart';

class SkillProgressTrackerController extends GetxController {
  final selectedSkill = 'Passing'.obs;

  // Mock data for charts and summary
  // Structure: { 'Skill': { 'percentage': 0.65, 'week': 'Week 1', 'improvement': '+ 20 %', 'deterioration': null } }
  final Map<String, Map<String, dynamic>> skillData = {
    'Passing': {
      'percentage': 0.65,
      'label': '65 %',
      'week': 'Week 1',
      'summary': {
        'value':
            '85 %', // Different from chart for "Overall Summary" example? Or average? Using mock values from screenshot.
        'improvement': '+ 20 %',
        'isImprovement': true,
      },
    },
    'Dribbling': {
      'percentage': 0.40,
      'label': '40 %',
      'week': 'Week 1',
      'summary': {
        'value': '38 %',
        'improvement': '+ 10 %',
        'isImprovement': true,
      },
    },
    'Shooting': {
      'percentage': 0.98,
      'label': '98 %',
      'week': 'Week 1',
      'summary': {
        'value': '95 %',
        'improvement': '+ 50 %',
        'isImprovement': true,
      },
    },
    'Speed': {
      'percentage': 0.20,
      'label': '20 %',
      'week': 'Week 1',
      'summary': {
        'value': '20 %',
        'improvement': '- 5 %',
        'isImprovement': false, // deterioration
      },
    },
  };

  void selectSkill(String skill) {
    selectedSkill.value = skill;
  }

  Map<String, dynamic> getCurrentSkillData() {
    return skillData[selectedSkill.value] ?? skillData['Passing']!;
  }
}
