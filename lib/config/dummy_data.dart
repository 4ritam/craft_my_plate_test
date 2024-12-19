import 'package:craft_my_plate_test/models/platter_item_categories_model.dart';

import '../models/enums/service_enum.dart';
import '../models/platter_combo_model.dart';

class DummyData {
  static const starterCategory = PlatterItemCategoriesModel(
    name: 'Starter',
    image: 'assets/images/categories/starters.png',
  );
  static const mainsCategory = PlatterItemCategoriesModel(
    name: 'Mains',
    image: 'assets/images/categories/mains.png',
  );
  static const drinksCategory = PlatterItemCategoriesModel(
    name: 'Drinks',
    image: 'assets/images/categories/drinks.png',
  );
  static const sweetsCategory = PlatterItemCategoriesModel(
    name: 'Sweets',
    image: 'assets/images/categories/sweets.png',
  );
  static const riceCategory = PlatterItemCategoriesModel(
    name: 'Rice',
    image: 'assets/images/categories/rice.png',
  );

  static const demoAllPlatter = PlatterComboModel(
    name: 'Indian Soiree',
    price: 299.00,
    image: 'assets/images/platters/indian_soiree.png',
    items: {
      starterCategory: 2,
      mainsCategory: 3,
      riceCategory: 1,
      drinksCategory: 2,
      sweetsCategory: 2,
    },
    minOrder: {
      Service.delivery: 10,
      Service.catering: 25,
    },
    maxOrder: {
      Service.delivery: 120,
      Service.catering: 1500,
    },
    platterTypes: [
      'Lunch & Dinner',
    ],
    additionalInfo: 'Best for 🪔 Pooja',
    availableServices: [
      Service.delivery,
      Service.catering,
    ],
  );

  static const demoDeliveryPlatter = PlatterComboModel(
    name: 'Indian Soiree',
    price: 299.00,
    image: 'assets/images/platters/indian_soiree.png',
    items: {
      starterCategory: 2,
      mainsCategory: 3,
      riceCategory: 1,
      drinksCategory: 2,
      sweetsCategory: 2,
    },
    minOrder: {
      Service.delivery: 10,
      Service.catering: 25,
    },
    maxOrder: {
      Service.delivery: 120,
      Service.catering: 1500,
    },
    platterTypes: [
      'Lunch & Dinner',
    ],
    additionalInfo: 'Best for 🪔 Pooja',
    availableServices: [
      Service.delivery,
    ],
  );

  static const platters = [
    demoAllPlatter,
    demoDeliveryPlatter,
    demoDeliveryPlatter,
    demoAllPlatter,
  ];
}
