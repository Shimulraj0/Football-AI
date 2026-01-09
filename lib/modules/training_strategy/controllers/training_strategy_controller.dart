import 'package:get/get.dart';

class TrainingStrategyController extends GetxController {
  final selectedGoal = RxnString();
  final isGenerating = false.obs;
  final generatedPlan = Rxn<Map<String, dynamic>>();

  final List<String> trainingGoals = [
    'Defense Improvement',
    'Ball Control',
    'Stamina Building',
    'Passing Accuracy',
    'Attacking Drills',
  ];

  final List<Map<String, dynamic>> savedPlans = [
    {
      'title': '3-Day Passing Improvement',
      'goal': 'Improve team passing accuracy and speed',
      'duration': '3 days',
      'drills': [
        'Day 1: Triangle passing drills (20 min)',
        'Day 1: Wall passing practice (15 min)',
        'Day 2: Moving target passing (25 min)',
        'Day 2: Long-range accuracy (15 min)',
        'Day 3: Game simulation with passing focus (30 min)',
      ],
    },
    {
      'title': 'Defense Coordination Week',
      'goal':
          'Improve team passing accuracy and speed', // Kept from design text, might want to change later
      'duration': '3 days',
      'drills': [
        'Day 1-2: Defensive line drills (30 min each)',
        'Day 3: 2v2 defending practice (25 min)',
        'Day 4: Transition defense drills (30 min)',
        'Day 5: Full team defensive scrimmage (40 min)',
      ],
    },
  ];

  void selectGoal(String? goal) {
    selectedGoal.value = goal;
  }

  Future<void> generatePlan() async {
    if (selectedGoal.value == null) return;

    isGenerating.value = true;

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    generatedPlan.value = {
      'title': '${selectedGoal.value} Training Plan',
      'duration': '7 days',
      'schedule': [
        {'type': 'Warm-up', 'details': 'Dynamic stretching (10 min)'},
        {
          'type': 'Drill 1',
          'details': '${selectedGoal.value} focused exercise (20 min)',
        },
        {'type': 'Drill 2', 'details': 'Small-sided game (15 min)'},
        {'type': 'Cool-down', 'details': 'Static stretching (10 min)'},
      ],
    };

    isGenerating.value = false;
  }

  void exportPlan() {
    Get.snackbar('Export', 'Training plan exported successfully!');
  }
}
