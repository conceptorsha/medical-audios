import 'package:get/get.dart';
import '../model/cardiology_model.dart';

class CardioController extends GetxController {
  var cardioUnits = <CardioUnit>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Load initial data
    fetchCardioUnits();
  }

  void fetchCardioUnits() {
    // Here you could fetch data from an API or database
    var loadedUnits = [
      CardioUnit(
        title: 'UNIT 1: INTRODUCTION TO CARDIOVASCULAR ANATOMY',
        topics: 4,
        duration: '6 hrs 20 mins',
      ),
      CardioUnit(
        title: 'UNIT 2: HEART AND BLOOD VESSELS',
        topics: 5,
        duration: '7 hrs 15 mins',
      ),
      // Add more units as needed
    ];
    cardioUnits.value = loadedUnits;
  }
}
