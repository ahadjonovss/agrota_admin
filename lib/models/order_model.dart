import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
  final int id;
  final DateTime createdAt, updatedAt;
  final int status;
  final List<ProductItem> cart;
  final String totalPrice;
  final String lan, lat;
  final User user;
  final String companyName;
  final String companyINN;
  final String companyPhone;

  final PaymentType paymentType;
  final DeliveryType deliveryTypes;
  final Branch branch;

  const OrderModel({
    this.companyName = '',
    this.companyINN = '',
    this.companyPhone = '',
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.cart,
    required this.totalPrice,
    required this.lan,
    required this.lat,
    required this.user,
    required this.paymentType,
    required this.deliveryTypes,
    required this.branch,
  });

  @override
  List<Object> get props => [
        id,
        createdAt,
        updatedAt,
        status,
        cart,
        totalPrice,
        lan,
        lat,
        user,
        paymentType,
        deliveryTypes,
        branch,
        companyINN,
        companyPhone,
        companyPhone
      ];

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'] ?? 0,
        companyINN: json['companyInn'] ?? '',
        companyName: json['companyName'] ?? '',
        companyPhone: json['companyPhone'] ?? '',
        createdAt:
            DateTime.parse(json['createdAt'] ?? DateTime.now().toString())
                .toLocal(),
        updatedAt:
            DateTime.parse(json['updatedAt'] ?? DateTime.now().toString())
                .toLocal(),
        status: json['status'] ?? 0,
        cart: List<ProductItem>.from(
            (json['cart'] ?? []).map((x) => ProductItem.fromJson(x))),
        totalPrice: json['total_price'] ?? '0',
        lan: json['lan'] ?? '0',
        lat: json['lat'] ?? '0',
        user: User.fromJson(json['user'] ?? {}),
        paymentType: PaymentType.fromJson(json['paymentType'] ?? {}),
        deliveryTypes: DeliveryType.fromJson(json['deliveryTypes'] ?? {}),
        branch: Branch.fromJson(json['branch'] ?? {}),
      );
}

class ProductItem extends Equatable {
  final int id;
  final DateTime createdAt, updatedAt;
  final String nameUz, nameRu;
  final String descriptionUz, descriptionRu;
  final String basePrice, price;
  final String sellerCode;
  final int amount;
  final bool topProduct, newProduct, isDeleted;
  final int discount;
  final ProductImages images;
  final Category category;

  ProductItem({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.nameUz,
    required this.nameRu,
    required this.descriptionUz,
    required this.descriptionRu,
    required this.basePrice,
    required this.price,
    required this.sellerCode,
    required this.amount,
    required this.topProduct,
    required this.newProduct,
    required this.isDeleted,
    required this.discount,
    required this.images,
    required this.category,
  });

  @override
  List<Object> get props => [
        id,
        createdAt,
        updatedAt,
        nameUz,
        nameRu,
        descriptionUz,
        descriptionRu,
        basePrice,
        price,
        sellerCode,
        amount,
        topProduct,
        newProduct,
        isDeleted,
        discount,
        images,
        category
      ];

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    final productJson = json['product'] ??
        {}; // Fallback to an empty map if 'product' is not found
    return ProductItem(
      id: productJson['id'] ?? 0,
      createdAt: productJson['createdAt'] != null
          ? DateTime.parse(productJson['createdAt'])
          : DateTime.now(),
      updatedAt: productJson['updatedAt'] != null
          ? DateTime.parse(productJson['updatedAt'])
          : DateTime.now(),
      nameUz: productJson['name_uz'] ?? 'Unknown',
      nameRu: productJson['name_ru'] ?? 'Unknown',
      descriptionUz: productJson['description_uz'] ?? '',
      descriptionRu: productJson['description_ru'] ?? '',
      basePrice: productJson['base_price'] ?? '0',
      price: productJson['price'] ?? '0',
      sellerCode: productJson['seller_code'] ?? 'Unknown',
      amount: productJson['amount'] ?? 0,
      topProduct: productJson['top_product'] ?? false,
      newProduct: productJson['new_product'] ?? false,
      isDeleted: productJson['isDeleted'] ?? false,
      discount: productJson['discount'] ?? 0,
      images: ProductImages.fromJson(json['product']['images'] ?? {}),
      category: Category.fromJson(json['product']['category'] ?? {}),
    );
  }
}

class ProductImages extends Equatable {
  final int id;
  final DateTime createdAt, updatedAt;
  final List<String> images;

  ProductImages({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });

  @override
  List<Object> get props => [id, createdAt, updatedAt, images];

  factory ProductImages.fromJson(Map<String, dynamic> json) => ProductImages(
        id: json['id'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        images: List<String>.from(json['images']),
      );
}

class Category extends Equatable {
  final int id;
  final DateTime createdAt, updatedAt;
  final String name;
  final int? parentId;
  final String? code, packageCode;
  final double? vatPercent;
  final bool isMain, isDeleted;

  Category({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    this.parentId,
    this.code,
    this.packageCode,
    this.vatPercent,
    required this.isMain,
    required this.isDeleted,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        name,
        parentId,
        code,
        packageCode,
        vatPercent,
        isMain,
        isDeleted
      ];

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        name: json['name'],
        parentId: json['parent_id'],
        code: json['code'],
        packageCode: json['package_code'],
        vatPercent: (json['vat_percent'] ?? 0).toDouble(),
        isMain: json['isMain'],
        isDeleted: json['isDeleted'],
      );
}

class User extends Equatable {
  final int userId;
  final String firstname;
  final String login;
  final String password;
  final String role;
  final String status;
  final DateTime createdAt;

  User({
    required this.userId,
    required this.firstname,
    required this.login,
    required this.password,
    required this.role,
    required this.status,
    required this.createdAt,
  });

  @override
  List<Object> get props =>
      [userId, firstname, login, password, role, status, createdAt];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'] ?? 0,
      firstname: json['firstname'] ?? '',
      login: json['login'] ?? '',
      password: json['password'] ?? '',
      role: json['role'] ?? 'user',
      status: json['status'] ?? 'active',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
    );
  }
}

class PaymentType extends Equatable {
  final int id;
  final DateTime createdAt, updatedAt;
  final String name;
  final bool isActive;

  PaymentType({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.isActive,
  });

  @override
  List<Object> get props => [id, createdAt, updatedAt, name, isActive];

  factory PaymentType.fromJson(Map<String, dynamic> json) {
    return PaymentType(
      id: json['id'] ?? 0,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
      name: json['name'] ?? 'Unknown',
      isActive: json['isActive'] ?? false,
    );
  }
}

class DeliveryType extends Equatable {
  final int id;
  final DateTime createdAt, updatedAt;
  final String name, description;
  final bool isActive;
  final String basePrice, additionalCostPerItem;
  final int estimatedDeliveryTime;

  DeliveryType({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    required this.isActive,
    required this.basePrice,
    required this.additionalCostPerItem,
    required this.estimatedDeliveryTime,
  });

  @override
  List<Object> get props => [
        id,
        createdAt,
        updatedAt,
        name,
        description,
        isActive,
        basePrice,
        additionalCostPerItem,
        estimatedDeliveryTime
      ];

  factory DeliveryType.fromJson(Map<String, dynamic> json) {
    return DeliveryType(
      id: json['id'] ?? 0,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
      name: json['name'] ?? 'Unknown',
      description: json['description'] ?? 'No Description',
      isActive: json['isActive'] ?? false,
      basePrice: json['basePrice'] ?? '0',
      additionalCostPerItem: json['additionalCostPerItem'] ?? '0',
      estimatedDeliveryTime: json['estimatedDeliveryTime'] ?? 0,
    );
  }
}

class Branch extends Equatable {
  final int id;
  final DateTime createdAt, updatedAt;
  final Map<String, String> name, address;
  final String longitude, latitude;

  Branch({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.address,
    required this.longitude,
    required this.latitude,
  });

  @override
  List<Object> get props =>
      [id, createdAt, updatedAt, name, address, longitude, latitude];

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      id: json['id'] ?? 0,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
      name: Map<String, String>.from(json['name'] ?? {}),
      address: Map<String, String>.from(json['address'] ?? {}),
      longitude: json['longitude'] ?? '0',
      latitude: json['latitude'] ?? '0',
    );
  }
}

class Name extends Equatable {
  final String ru;
  final String uz;

  const Name({required this.ru, required this.uz});

  @override
  List<Object> get props => [ru, uz];

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        ru: json['ru'] ?? '',
        uz: json['uz'] ?? '',
      );
}

class Address extends Equatable {
  final String ru;
  final String uz;

  const Address({required this.ru, required this.uz});

  @override
  List<Object> get props => [ru, uz];

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        ru: json['ru'] ?? '',
        uz: json['uz'] ?? '',
      );
}
