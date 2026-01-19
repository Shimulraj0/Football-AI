import 'package:get/get.dart';

class CurriculumAdaptationController extends GetxController {
  final RxString selectedFrequency = '2 Times/ Week'.obs;
  final List<String> frequencyOptions = [
    '1 Time/ Week',
    '2 Times/ Week',
    '3 Times/ Week',
    '4 Times/ Week',
  ];

  void setFrequency(String? value) {
    if (value != null) {
      selectedFrequency.value = value;
    }
  }
}
