import 'package:get/get.dart';
import '../controllers/training_strategy_controller.dart';

class TrainingStrategyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrainingStrategyController>(() => TrainingStrategyController());
  }
}
