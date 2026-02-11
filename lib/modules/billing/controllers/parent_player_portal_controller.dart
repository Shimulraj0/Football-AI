import 'package:get/get.dart';

class ParentPlayerPortalController extends GetxController {
  final RxString selectedCardTitle = 'Child Development Summary'.obs;

  void selectCard(String title) {
    selectedCardTitle.value = title;
  }
}
