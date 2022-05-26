import 'dart:convert';

import 'package:flutter/foundation.dart';

ProductListModel productListModelFromJson(String str) =>
    ProductListModel.fromJson(json.decode(str));

class ProductListModel {
  final Data data;
  final bool success;
  ProductListModel({
    required this.data,
    required this.success,
  });

  factory ProductListModel.init() =>
      ProductListModel(data: Data.init(), success: false);

  ProductListModel copyWith({
    Data? data,
    bool? success,
  }) {
    return ProductListModel(
      data: data ?? this.data,
      success: success ?? this.success,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.toMap(),
      'success': success,
    };
  }

  factory ProductListModel.fromMap(Map<String, dynamic> map) {
    return ProductListModel(
      data: Data.fromMap(map['data']),
      success: map['success'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductListModel.fromJson(String source) =>
      ProductListModel.fromMap(json.decode(source));

  @override
  String toString() => 'ProductListModel(data: $data, success: $success)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductListModel &&
        other.data == data &&
        other.success == success;
  }

  @override
  int get hashCode => data.hashCode ^ success.hashCode;
}

class Data {
  final Info info;
  final List<Category> category;
  final Brand shop;
  final Brand brand;
  final List<ProductSection> productSection;

  Data({
    required this.info,
    required this.category,
    required this.shop,
    required this.brand,
    required this.productSection,
  });

  factory Data.init() => Data(
        info: Info.init(),
        category: <Category>[],
        shop: Brand.init(),
        brand: Brand.init(),
        productSection: <ProductSection>[],
      );

  Data copyWith({
    Info? info,
    List<Category>? category,
    Brand? shop,
    Brand? brand,
    List<ProductSection>? productSection,
  }) {
    return Data(
      info: info ?? this.info,
      category: category ?? this.category,
      shop: shop ?? this.shop,
      brand: brand ?? this.brand,
      productSection: productSection ?? this.productSection,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'info': info.toMap(),
      'category': category.map((x) => x.toMap()).toList(),
      'shop': shop.toMap(),
      'brand': brand.toMap(),
      'product_section': productSection.map((x) => x.toMap()).toList(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      info: Info.fromMap(map['info']),
      category: List<Category>.from(
          map['category']?.map((x) => Category.fromMap(x)) ?? const []),
      shop: Brand.fromMap(map['shop']),
      brand: Brand.fromMap(map['brand']),
      productSection: map['productSection'] != null
          ? List<ProductSection>.from(
              map['productSection'].map((x) => ProductSection.fromMap(x)) ??
                  const [])
          : <ProductSection>[],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Data(info: $info, category: $category, shop: $shop, brand: $brand, productSection: $productSection)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data &&
        other.info == info &&
        listEquals(other.category, category) &&
        other.shop == shop &&
        other.brand == brand &&
        listEquals(other.productSection, productSection);
  }

  @override
  int get hashCode {
    return info.hashCode ^
        category.hashCode ^
        shop.hashCode ^
        brand.hashCode ^
        productSection.hashCode;
  }
}

class Brand {
  final String title;
  final List<Category> items;

  Brand({
    required this.title,
    required this.items,
  });

  factory Brand.init() => Brand(
        title: "",
        items: <Category>[],
      );

  factory Brand.fromJson(Map<String?, dynamic> json) => Brand(
        title: json["title"],
        items:
            List<Category>.from(json["items"].map((x) => Category.fromJson(x))),
      );

  Brand copyWith({
    String? title,
    List<Category>? items,
  }) {
    return Brand(
      title: title ?? this.title,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory Brand.fromMap(Map<String, dynamic> map) {
    return Brand(
      title: map['title'] ?? '',
      items: List<Category>.from(
          map['items']?.map((x) => Category.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());
  @override
  String toString() => 'Brand(title: $title, items: $items)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Brand &&
        other.title == title &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode => title.hashCode ^ items.hashCode;
}

class Category {
  final bool active;
  final String id;
  final String name;
  final String image;
  final String slug;
  Category({
    required this.active,
    required this.id,
    required this.name,
    required this.image,
    required this.slug,
  });

  factory Category.init() =>
      Category(active: false, id: "", name: "", image: '', slug: '');

  Category copyWith({
    bool? active,
    String? id,
    String? name,
    String? image,
    String? slug,
  }) {
    return Category(
      active: active ?? this.active,
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      slug: slug ?? this.slug,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'active': active,
      'id': id,
      'name': name,
      'image': image,
      'slug': slug,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      active: map['active'] ?? false,
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      slug: map['slug'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Category(active: $active, id: $id, name: $name, image: $image, slug: $slug)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.active == active &&
        other.id == id &&
        other.name == name &&
        other.image == image &&
        other.slug == slug;
  }

  @override
  int get hashCode {
    return active.hashCode ^
        id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        slug.hashCode;
  }
}

class Info {
  final String firstBanner;
  final String secondBanner;
  final String thirdBanner;
  final bool badge;
  final int deliveryChargeInsideDhaka;
  final int deliveryChargeOutsideDhaka;
  final String appVersionCode;
  final String appVersionName;
  final bool androidUpdateMandatory;
  final bool iosUpdateMandatory;
  final String appStoreUrl;
  final String playStoreUrl;
  final String id;
  final String name;
  final String email;
  final String phone;
  final String aboutUs;
  final String address;
  final String facebook;
  final String instagram;
  final String logo;
  final String invoiceLogo;
  final List<Category> sliders;
  final String footerLogo;
  final String topLogo;
  final TermsPrivacyAbout termsPrivacyAbout;
  final int firstOrderDiscount;

  Info({
    required this.firstBanner,
    required this.secondBanner,
    required this.thirdBanner,
    required this.badge,
    required this.deliveryChargeInsideDhaka,
    required this.deliveryChargeOutsideDhaka,
    required this.appVersionCode,
    required this.appVersionName,
    required this.androidUpdateMandatory,
    required this.iosUpdateMandatory,
    required this.appStoreUrl,
    required this.playStoreUrl,
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.aboutUs,
    required this.address,
    required this.facebook,
    required this.instagram,
    required this.logo,
    required this.invoiceLogo,
    required this.sliders,
    required this.footerLogo,
    required this.topLogo,
    required this.termsPrivacyAbout,
    required this.firstOrderDiscount,
  });

  factory Info.init() => Info(
        firstBanner: '',
        secondBanner: '',
        thirdBanner: 'thirdBanner',
        badge: false,
        deliveryChargeInsideDhaka: 0,
        deliveryChargeOutsideDhaka: 0,
        appVersionCode: '',
        appVersionName: '',
        androidUpdateMandatory: false,
        iosUpdateMandatory: false,
        appStoreUrl: '',
        playStoreUrl: '',
        id: '',
        name: '',
        email: '',
        phone: '',
        aboutUs: '',
        address: '',
        facebook: '',
        instagram: '',
        logo: '',
        invoiceLogo: '',
        sliders: <Category>[],
        footerLogo: '',
        topLogo: '',
        termsPrivacyAbout: TermsPrivacyAbout.init(),
        firstOrderDiscount: 0,
      );

  Info copyWith({
    String? firstBanner,
    String? secondBanner,
    String? thirdBanner,
    bool? badge,
    int? deliveryChargeInsideDhaka,
    int? deliveryChargeOutsideDhaka,
    String? appVersionCode,
    String? appVersionName,
    bool? androidUpdateMandatory,
    bool? iosUpdateMandatory,
    String? appStoreUrl,
    String? playStoreUrl,
    String? id,
    String? name,
    String? email,
    String? phone,
    String? aboutUs,
    String? address,
    String? facebook,
    String? instagram,
    String? logo,
    String? invoiceLogo,
    List<Category>? sliders,
    String? footerLogo,
    String? topLogo,
    TermsPrivacyAbout? termsPrivacyAbout,
    int? firstOrderDiscount,
  }) {
    return Info(
      firstBanner: firstBanner ?? this.firstBanner,
      secondBanner: secondBanner ?? this.secondBanner,
      thirdBanner: thirdBanner ?? this.thirdBanner,
      badge: badge ?? this.badge,
      deliveryChargeInsideDhaka:
          deliveryChargeInsideDhaka ?? this.deliveryChargeInsideDhaka,
      deliveryChargeOutsideDhaka:
          deliveryChargeOutsideDhaka ?? this.deliveryChargeOutsideDhaka,
      appVersionCode: appVersionCode ?? this.appVersionCode,
      appVersionName: appVersionName ?? this.appVersionName,
      androidUpdateMandatory:
          androidUpdateMandatory ?? this.androidUpdateMandatory,
      iosUpdateMandatory: iosUpdateMandatory ?? this.iosUpdateMandatory,
      appStoreUrl: appStoreUrl ?? this.appStoreUrl,
      playStoreUrl: playStoreUrl ?? this.playStoreUrl,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      aboutUs: aboutUs ?? this.aboutUs,
      address: address ?? this.address,
      facebook: facebook ?? this.facebook,
      instagram: instagram ?? this.instagram,
      logo: logo ?? this.logo,
      invoiceLogo: invoiceLogo ?? this.invoiceLogo,
      sliders: sliders ?? this.sliders,
      footerLogo: footerLogo ?? this.footerLogo,
      topLogo: topLogo ?? this.topLogo,
      termsPrivacyAbout: termsPrivacyAbout ?? this.termsPrivacyAbout,
      firstOrderDiscount: firstOrderDiscount ?? this.firstOrderDiscount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstBanner': firstBanner,
      'secondBanner': secondBanner,
      'thirdBanner': thirdBanner,
      'badge': badge,
      'deliveryChargeInsideDhaka': deliveryChargeInsideDhaka,
      'deliveryChargeOutsideDhaka': deliveryChargeOutsideDhaka,
      'appVersionCode': appVersionCode,
      'appVersionName': appVersionName,
      'androidUpdateMandatory': androidUpdateMandatory,
      'iosUpdateMandatory': iosUpdateMandatory,
      'appStoreUrl': appStoreUrl,
      'playStoreUrl': playStoreUrl,
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'aboutUs': aboutUs,
      'address': address,
      'facebook': facebook,
      'instagram': instagram,
      'logo': logo,
      'invoiceLogo': invoiceLogo,
      'sliders': sliders.map((x) => x.toMap()).toList(),
      'footerLogo': footerLogo,
      'topLogo': topLogo,
      'termsPrivacyAbout': termsPrivacyAbout.toMap(),
      'firstOrderDiscount': firstOrderDiscount,
    };
  }

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      firstBanner: map['firstBanner'] ?? '',
      secondBanner: map['secondBanner'] ?? '',
      thirdBanner: map['thirdBanner'] ?? '',
      badge: map['badge'] ?? false,
      deliveryChargeInsideDhaka: map['deliveryChargeInsideDhaka']?.toInt() ?? 0,
      deliveryChargeOutsideDhaka:
          map['deliveryChargeOutsideDhaka']?.toInt() ?? 0,
      appVersionCode: map['appVersionCode'] ?? '',
      appVersionName: map['appVersionName'] ?? '',
      androidUpdateMandatory: map['androidUpdateMandatory'] ?? false,
      iosUpdateMandatory: map['iosUpdateMandatory'] ?? false,
      appStoreUrl: map['appStoreUrl'] ?? '',
      playStoreUrl: map['playStoreUrl'] ?? '',
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      aboutUs: map['aboutUs'] ?? '',
      address: map['address'] ?? '',
      facebook: map['facebook'] ?? '',
      instagram: map['instagram'] ?? '',
      logo: map['logo'] ?? '',
      invoiceLogo: map['invoiceLogo'] ?? '',
      sliders: List<Category>.from(
          map['sliders']?.map((x) => Category.fromMap(x)) ?? const []),
      footerLogo: map['footerLogo'] ?? '',
      topLogo: map['topLogo'] ?? '',
      termsPrivacyAbout: TermsPrivacyAbout.fromMap(map['termsPrivacyAbout']),
      firstOrderDiscount: map['firstOrderDiscount']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Info.fromJson(String source) => Info.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Info(firstBanner: $firstBanner, secondBanner: $secondBanner, thirdBanner: $thirdBanner, badge: $badge, deliveryChargeInsideDhaka: $deliveryChargeInsideDhaka, deliveryChargeOutsideDhaka: $deliveryChargeOutsideDhaka, appVersionCode: $appVersionCode, appVersionName: $appVersionName, androidUpdateMandatory: $androidUpdateMandatory, iosUpdateMandatory: $iosUpdateMandatory, appStoreUrl: $appStoreUrl, playStoreUrl: $playStoreUrl, id: $id, name: $name, email: $email, phone: $phone, aboutUs: $aboutUs, address: $address, facebook: $facebook, instagram: $instagram, logo: $logo, invoiceLogo: $invoiceLogo, sliders: $sliders, footerLogo: $footerLogo, topLogo: $topLogo, termsPrivacyAbout: $termsPrivacyAbout, firstOrderDiscount: $firstOrderDiscount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Info &&
        other.firstBanner == firstBanner &&
        other.secondBanner == secondBanner &&
        other.thirdBanner == thirdBanner &&
        other.badge == badge &&
        other.deliveryChargeInsideDhaka == deliveryChargeInsideDhaka &&
        other.deliveryChargeOutsideDhaka == deliveryChargeOutsideDhaka &&
        other.appVersionCode == appVersionCode &&
        other.appVersionName == appVersionName &&
        other.androidUpdateMandatory == androidUpdateMandatory &&
        other.iosUpdateMandatory == iosUpdateMandatory &&
        other.appStoreUrl == appStoreUrl &&
        other.playStoreUrl == playStoreUrl &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.aboutUs == aboutUs &&
        other.address == address &&
        other.facebook == facebook &&
        other.instagram == instagram &&
        other.logo == logo &&
        other.invoiceLogo == invoiceLogo &&
        listEquals(other.sliders, sliders) &&
        other.footerLogo == footerLogo &&
        other.topLogo == topLogo &&
        other.termsPrivacyAbout == termsPrivacyAbout &&
        other.firstOrderDiscount == firstOrderDiscount;
  }

  @override
  int get hashCode {
    return firstBanner.hashCode ^
        secondBanner.hashCode ^
        thirdBanner.hashCode ^
        badge.hashCode ^
        deliveryChargeInsideDhaka.hashCode ^
        deliveryChargeOutsideDhaka.hashCode ^
        appVersionCode.hashCode ^
        appVersionName.hashCode ^
        androidUpdateMandatory.hashCode ^
        iosUpdateMandatory.hashCode ^
        appStoreUrl.hashCode ^
        playStoreUrl.hashCode ^
        id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        aboutUs.hashCode ^
        address.hashCode ^
        facebook.hashCode ^
        instagram.hashCode ^
        logo.hashCode ^
        invoiceLogo.hashCode ^
        sliders.hashCode ^
        footerLogo.hashCode ^
        topLogo.hashCode ^
        termsPrivacyAbout.hashCode ^
        firstOrderDiscount.hashCode;
  }
}

class TermsPrivacyAbout {
  final String termsAndCondition;
  final String privacyPolicy;
  final String aboutUs;

  TermsPrivacyAbout({
    required this.termsAndCondition,
    required this.privacyPolicy,
    required this.aboutUs,
  });

  factory TermsPrivacyAbout.init() =>
      TermsPrivacyAbout(termsAndCondition: "", privacyPolicy: '', aboutUs: '');

  TermsPrivacyAbout copyWith({
    String? termsAndCondition,
    String? privacyPolicy,
    String? aboutUs,
  }) {
    return TermsPrivacyAbout(
      termsAndCondition: termsAndCondition ?? this.termsAndCondition,
      privacyPolicy: privacyPolicy ?? this.privacyPolicy,
      aboutUs: aboutUs ?? this.aboutUs,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'termsAndCondition': termsAndCondition,
      'privacyPolicy': privacyPolicy,
      'aboutUs': aboutUs,
    };
  }

  factory TermsPrivacyAbout.fromMap(Map<String, dynamic> map) {
    return TermsPrivacyAbout(
      termsAndCondition: map['termsAndCondition'] ?? '',
      privacyPolicy: map['privacyPolicy'] ?? '',
      aboutUs: map['aboutUs'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TermsPrivacyAbout.fromJson(String source) =>
      TermsPrivacyAbout.fromMap(json.decode(source));

  @override
  String toString() =>
      'TermsPrivacyAbout(termsAndCondition: $termsAndCondition, privacyPolicy: $privacyPolicy, aboutUs: $aboutUs)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TermsPrivacyAbout &&
        other.termsAndCondition == termsAndCondition &&
        other.privacyPolicy == privacyPolicy &&
        other.aboutUs == aboutUs;
  }

  @override
  int get hashCode =>
      termsAndCondition.hashCode ^ privacyPolicy.hashCode ^ aboutUs.hashCode;
}

class ProductSection {
  final String title;
  final List<Item> items;
  final String slug;

  ProductSection({
    required this.title,
    required this.items,
    required this.slug,
  });

  factory ProductSection.init() => ProductSection(
        title: "",
        items: <Item>[],
        slug: "",
      );

  factory ProductSection.fromJson(Map<String?, dynamic> json) => ProductSection(
        title: json["title"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        slug: json["slug"],
      );

  ProductSection copyWith({
    String? title,
    List<Item>? items,
    String? slug,
  }) {
    return ProductSection(
      title: title ?? this.title,
      items: items ?? this.items,
      slug: slug ?? this.slug,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'items': items.map((x) => x.toMap()).toList(),
      'slug': slug,
    };
  }

  factory ProductSection.fromMap(Map<String, dynamic> map) {
    return ProductSection(
      title: map['title'] ?? '',
      items: map['items'] != null
          ? List.from(map['items'].map((x) => Item.fromMap(x)))
          : const <Item>[],
      slug: map['slug'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'ProductSection(title: $title, items: $items, slug: $slug)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductSection &&
        other.title == title &&
        listEquals(other.items, items) &&
        other.slug == slug;
  }

  @override
  int get hashCode => title.hashCode ^ items.hashCode ^ slug.hashCode;
}

class Item {
  final Category brand;
  final int price;
  final int buyingPrice;
  final int currentStock;
  final String id;
  final String name;
  final List<Variation> variations;
  final String description;
  final String thumbnail;
  final String slug;
  final String sku;

  Item({
    required this.brand,
    required this.price,
    required this.buyingPrice,
    required this.currentStock,
    required this.id,
    required this.name,
    required this.variations,
    required this.description,
    required this.thumbnail,
    required this.slug,
    required this.sku,
  });

  factory Item.init() => Item(
        brand: Category.init(),
        price: 0,
        buyingPrice: 0,
        currentStock: 0,
        id: "",
        name: "",
        description: "",
        thumbnail: "",
        slug: '',
        sku: '',
        variations: [],
      );

  Item copyWith({
    Category? brand,
    int? price,
    int? buyingPrice,
    int? currentStock,
    String? id,
    String? name,
    List<Variation>? variations,
    String? description,
    String? thumbnail,
    String? slug,
    String? sku,
  }) {
    return Item(
      brand: brand ?? this.brand,
      price: price ?? this.price,
      buyingPrice: buyingPrice ?? this.buyingPrice,
      currentStock: currentStock ?? this.currentStock,
      id: id ?? this.id,
      name: name ?? this.name,
      variations: variations ?? this.variations,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
      slug: slug ?? this.slug,
      sku: sku ?? this.sku,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'brand': brand.toMap(),
      'price': price,
      'buyingPrice': buyingPrice,
      'currentStock': currentStock,
      'id': id,
      'name': name,
      'variations': variations.map((x) => x.toMap()).toList(),
      'description': description,
      'thumbnail': thumbnail,
      'slug': slug,
      'sku': sku,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      brand: Category.fromMap(map['brand']),
      price: map['price']?.toInt() ?? 0,
      buyingPrice: map['buyingPrice']?.toInt() ?? 0,
      currentStock: map['currentStock']?.toInt() ?? 0,
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      variations: map['variations'] != null
          ? List<Variation>.from(
              map['variations'].map((x) => Variation.fromMap(x)))
          : <Variation>[],
      description: map['description'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
      slug: map['slug'] ?? '',
      sku: map['sku'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(brand: $brand, price: $price, buyingPrice: $buyingPrice, currentStock: $currentStock, id: $id, name: $name, variations: $variations, description: $description, thumbnail: $thumbnail, slug: $slug, sku: $sku)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.brand == brand &&
        other.price == price &&
        other.buyingPrice == buyingPrice &&
        other.currentStock == currentStock &&
        other.id == id &&
        other.name == name &&
        listEquals(other.variations, variations) &&
        other.description == description &&
        other.thumbnail == thumbnail &&
        other.slug == slug &&
        other.sku == sku;
  }

  @override
  int get hashCode {
    return brand.hashCode ^
        price.hashCode ^
        buyingPrice.hashCode ^
        currentStock.hashCode ^
        id.hashCode ^
        name.hashCode ^
        variations.hashCode ^
        description.hashCode ^
        thumbnail.hashCode ^
        slug.hashCode ^
        sku.hashCode;
  }
}

class Variation {
  final String value1;
  final String value2;
  final int discountType;
  final int discountAmount;
  final List<String> image;
  final int regularPrice;
  final int buyingPrice;
  final int maxPrice;
  final int minPrice;
  final int stock;
  final String id;

  Variation({
    required this.value1,
    required this.value2,
    required this.discountType,
    required this.discountAmount,
    required this.image,
    required this.regularPrice,
    required this.buyingPrice,
    required this.maxPrice,
    required this.minPrice,
    required this.stock,
    required this.id,
  });

  factory Variation.init() => Variation(
        buyingPrice: 0,
        discountAmount: 0,
        discountType: 0,
        id: "",
        image: [],
        maxPrice: 0,
        minPrice: 0,
        regularPrice: 0,
        stock: 0,
        value1: "",
        value2: "",
      );

  Variation copyWith({
    String? value1,
    String? value2,
    int? discountType,
    int? discountAmount,
    List<String>? image,
    int? regularPrice,
    int? buyingPrice,
    int? maxPrice,
    int? minPrice,
    int? stock,
    String? id,
  }) {
    return Variation(
      value1: value1 ?? this.value1,
      value2: value2 ?? this.value2,
      discountType: discountType ?? this.discountType,
      discountAmount: discountAmount ?? this.discountAmount,
      image: image ?? this.image,
      regularPrice: regularPrice ?? this.regularPrice,
      buyingPrice: buyingPrice ?? this.buyingPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      minPrice: minPrice ?? this.minPrice,
      stock: stock ?? this.stock,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value1': value1,
      'value2': value2,
      'discountType': discountType,
      'discountAmount': discountAmount,
      'image': image,
      'regularPrice': regularPrice,
      'buyingPrice': buyingPrice,
      'maxPrice': maxPrice,
      'minPrice': minPrice,
      'stock': stock,
      'id': id,
    };
  }

  factory Variation.fromMap(Map<String, dynamic> map) {
    return Variation(
      value1: map['value1'] ?? '',
      value2: map['value2'] ?? '',
      discountType: map['discountType']?.toInt() ?? 0,
      discountAmount: map['discountAmount']?.toInt() ?? 0,
      image: List<String>.from(map['image'] ?? const []),
      regularPrice: map['regularPrice']?.toInt() ?? 0,
      buyingPrice: map['buyingPrice']?.toInt() ?? 0,
      maxPrice: map['maxPrice']?.toInt() ?? 0,
      minPrice: map['minPrice']?.toInt() ?? 0,
      stock: map['stock']?.toInt() ?? 0,
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Variation.fromJson(String source) =>
      Variation.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Variation(value1: $value1, value2: $value2, discountType: $discountType, discountAmount: $discountAmount, image: $image, regularPrice: $regularPrice, buyingPrice: $buyingPrice, maxPrice: $maxPrice, minPrice: $minPrice, stock: $stock, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Variation &&
        other.value1 == value1 &&
        other.value2 == value2 &&
        other.discountType == discountType &&
        other.discountAmount == discountAmount &&
        listEquals(other.image, image) &&
        other.regularPrice == regularPrice &&
        other.buyingPrice == buyingPrice &&
        other.maxPrice == maxPrice &&
        other.minPrice == minPrice &&
        other.stock == stock &&
        other.id == id;
  }

  @override
  int get hashCode {
    return value1.hashCode ^
        value2.hashCode ^
        discountType.hashCode ^
        discountAmount.hashCode ^
        image.hashCode ^
        regularPrice.hashCode ^
        buyingPrice.hashCode ^
        maxPrice.hashCode ^
        minPrice.hashCode ^
        stock.hashCode ^
        id.hashCode;
  }
}
