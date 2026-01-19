import 'package:get/get.dart';

class AssignedAgeGroupsController extends GetxController {
  final List<String> ageGroups = [
    "U8",
    "U9",
    "U10",
    "U11",
    "U12",
    "U13",
    "U14",
    "U15",
    "U16",
    "U17",
    "U18",
  ];

  void onAgeGroupSelected(String group) {
    // Navigate to details or handle selection
    Get.snackbar("Selected", "You selected $group");
  }
}
