import 'package:get/get.dart';
import '../model/medical_item_model.dart';

class DashboardController extends GetxController {
  var medicalItems = <MedicalItem>[].obs;
  var filteredItems = <MedicalItem>[].obs;
  var newUpdates = <MedicalItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMedicalItems();
    loadNewUpdates();
  }

  void loadMedicalItems() {
    // Initialize Recently Played data
    medicalItems.value = [
      MedicalItem(
        title: 'Cardiology',
        description: 'Heart health and treatments.',
        time: '10 min',
        rating: 4.5,
        ratingCount: 20,
        image: 'assets/images/heart.jpeg',
      ),
      MedicalItem(
        title: 'Dermatology',
        description: 'Skin care and conditions.',
        time: '8 min',
        rating: 4.2,
        ratingCount: 15,
        image: 'assets/images/brain.jpeg',
      ),
      // Add more items as needed
    ];
    filteredItems.value = medicalItems;
  }

  void loadNewUpdates() {
    // Initialize New Updates data
    newUpdates.value = [
      MedicalItem(
        title: 'Skin Disorder',
        description: 'Understanding and managing skin disorders.',
        time: '15 min',
        rating: 4.7,
        ratingCount: 30,
        image: 'assets/images/skin.jpeg',
      ),
      MedicalItem(
        title: 'Bone Health',
        description: 'Tips for maintaining healthy bones.',
        time: '12 min',
        rating: 4.6,
        ratingCount: 25,
        image: 'assets/images/bone.webp',
      ),
      // Add more items as needed
    ];
  }

  void filterItems(String category) {
    if (category == 'All') {
      filteredItems.value = medicalItems;
    } else {
      filteredItems.value = medicalItems.where((item) => item.title == category).toList();
    }
  }

  void navigateToDetailPage(MedicalItem item) {
    switch (item.title) {
      case 'Cardiology':
        Get.toNamed('/cardiology', arguments: item);
        break;
      case 'Dermatology':
        Get.toNamed('/Dermatology', arguments: item);
        break;
    // Add more cases for other items as needed
      default:
        print('No route defined for ${item.title}');
    }
  }
}
