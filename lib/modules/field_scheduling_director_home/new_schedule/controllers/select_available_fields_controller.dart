import 'package:get/get.dart';

class SelectAvailableFieldsController extends GetxController {
  final RxList<String> availableFields = <String>[
    'Manara college stadium',
    'Northan field stadium',
    'Westine field',
  ].obs;

  final RxList<String> selectedFields = <String>[].obs;

  void toggleFieldSelection(String field) {
    if (selectedFields.contains(field)) {
      selectedFields.remove(field);
    } else {
      selectedFields.add(field);
    }
  }

  bool isFieldSelected(String field) {
    return selectedFields.contains(field);
  }

  void confirmSelection() {
    Get.back(result: selectedFields);
  }
}
