import 'package:craft_my_plate_test/models/platter_item_categories_model.dart';

import 'enums/service_enum.dart';

class PlatterComboModel {
  final String name;
  final double price;
  final String image;
  final Map<PlatterItemCategoriesModel, int> items;
  final Map<Service, int> minOrder;
  final Map<Service, int> maxOrder;
  final String? additionalInfo;
  final List<String> platterTypes;
  final List<Service> availableServices;

  const PlatterComboModel({
    required this.name,
    required this.price,
    required this.image,
    required this.items,
    required this.minOrder,
    required this.maxOrder,
    this.additionalInfo,
    required this.platterTypes,
    required this.availableServices,
  });

  int get totalItems => items.values.fold(0, (prev, element) => prev + element);
  int get totalCategories => items.keys.length;
}
