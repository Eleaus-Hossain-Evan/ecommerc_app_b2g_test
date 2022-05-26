import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../../models/product_list_model.dart';
import '../network/api.dart';
import '../network/network_hendler.dart';

class RemoteService {
  static Future<ProductListModel?> initialFetch() async {
    try {
      var responseBody = await Network.handleResponse(await Network.getRequest(
        API.home,
        queryParams: API.homePostQuery,
        mapHeaders: API.appIdHeaders,
      ));
      Logger().d(responseBody);
      return ProductListModel.fromMap(responseBody);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
