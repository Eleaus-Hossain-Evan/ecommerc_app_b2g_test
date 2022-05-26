import 'dart:convert';
import 'dart:developer';

import 'package:ecommerc_app_b2g_test/data/remote_service/remote_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../data/models/cart_model.dart';
import '../data/models/product_list_model.dart';
import '../variables/variables.dart';

class ProductController extends GetxController {
  var loading = false.obs;

  RxList<CartModel> cartList = <CartModel>[].obs;
  RxList<String> favoriteList = <String>[].obs;

  ///Details page variables
  int detailsCartCount = 0;

  Rx<ProductListModel> productListModel = ProductListModel.init().obs;

  @override
  void onInit() {
    super.onInit();
    _initData();
    cartList.add(CartModel(id: '6265127ee6cb1cd77f9c78ee', count: 3));
  }

  Future<void> _initData() async {
    await getProductList();
    update();
  }

  Future<void> getProductList() async {
    loading(true);

    try {
      var temp = await RemoteService.initialFetch();

      if (temp != null) {
        productListModel.value = temp;
        Logger().wtf(productListModel.value.toMap());
      }

      // if (response.statusCode == 200) {
      //   final jsonData = jsonDecode(response.body);
      //   if (jsonData['success'] == true) {
      //     productListModel.value = productListModelFromJson(response.body);
      //   }
      // }
      loading(false);
      update();
    } finally {
      loading(false);
    }
    loading(false);
    update();
  }

  Future<void> refreshProductList() async {
    try {
      http.Response response =
          await http.get(Uri.parse(Variables.baseUrl + 'home'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['success'] == true) {
          productListModel.value = productListModelFromJson(response.body);
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void toggleFavouriteStatus(Item item) {
    if (favoriteList.toSet().contains(item.id)) {
      favoriteList.remove(item.id);
    } else {
      favoriteList.add(item.id);
    }
    update();
  }

  void addToCart(Item item, int v) {
    CartModel cart = CartModel(id: item.id, count: v);
    if (cartList.toSet().contains(cart)) {
      int i = cartList.indexWhere((element) => element.id == item.id);
      if (i > 0) cartList.elementAt(i).count = v;
    } else {
      cartList.add(cart);
    }
    update();
  }
}
