import 'package:get/get.dart';

import '../config/dummy_data.dart';
import '../config/util_config.dart';
import '../models/enums/service_enum.dart';
import '../models/platter_combo_model.dart';

class PlatterController extends GetxController {
  // Properties from config
  final eventType = UtilConfig.currentEvent;
  final platterList = DummyData.platters;
  final mealCategories = [
    "All",
    "Breakfast",
    "Lunch & Dinner",
    "Snacks",
  ];

  // Reactive properties
  Rx<Service> selectedService = Service.delivery.obs;
  Rx<int> selectedMealIndex = 0.obs;

  // Computed properties
  late Rx<int> availablePlattersCount;
  late RxList<PlatterComboModel> filteredPlatters;

  // Initializer
  @override
  void onInit() {
    availablePlattersCount = platterList.length.obs;
    filteredPlatters = platterList.obs;
    super.onInit();
  }

  // Reactive Helper methods
  void changeService(Service service) {
    selectedService.value = service;
    filterPlatters();
  }

  void changeMealCategory(int index) {
    selectedMealIndex.value = index;
    filterPlatters();
  }

  // Computation Helper methods
  void filterPlatters() {
    filteredPlatters.value = getFilteredPlatters();
    availablePlattersCount.value = getFilteredPlatters().length;
  }

  // Computational methods
  List<PlatterComboModel> getFilteredPlatters() {
    final selectedMealCategory = mealCategories[selectedMealIndex.value];
    List<PlatterComboModel> filteredPlatters = platterList.where((platter) {
      if (selectedMealCategory == "All") {
        return true;
      }
      return platter.platterTypes.contains(selectedMealCategory);
    }).toList();
    filteredPlatters = filteredPlatters.where((platter) {
      return platter.availableServices.contains(selectedService.value);
    }).toList();
    return filteredPlatters;
  }
}
