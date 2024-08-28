import 'package:get/get.dart';
import '../model/library_model.dart';

class LibraryController extends GetxController {
  // Observable list of specialties
  var specialties = <Specialty>[].obs;
  var filteredSpecialties = <Specialty>[].obs;

  LibraryController() {
    // Initialize the list with some example specialties
    specialties([
      Specialty(
        title: "Neurology",
        resources: "Books, Articles",
        duration: "8 Months",
        imagePath: "assets/images/card.jpeg",
      ),
      Specialty(
        title: "Internal Medicine",
        resources: "Books, Journals",
        duration: "7 Months",
        imagePath: "assets/images/heart.jpeg",
      ),
      Specialty(
        title: "Surgery",
        resources: "Videos, Case Studies",
        duration: "12 Months",
        imagePath: "assets/images/pediastric.jpeg",
      ),
    ]);

    // Initialize filtered specialties with all specialties
    filteredSpecialties.addAll(specialties);
  }

  // Filter specialties based on the selected category
  void filterSpecialties(String category) {
    if (category == 'All') {
      filteredSpecialties.assignAll(specialties);
    } else {
      filteredSpecialties.assignAll(
        specialties.where((specialty) => specialty.title == category),
      );
    }
  }
}
