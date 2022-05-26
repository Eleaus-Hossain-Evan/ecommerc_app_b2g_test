import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerc_app_b2g_test/controller/product_controller.dart';
import 'package:ecommerc_app_b2g_test/models/product_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../variables/variables.dart';

class CategoryGridView extends StatelessWidget {
  CategoryGridView({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<Category> list;

  final pc = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 255.h,
      width: Get.width,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: .8,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: list.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              margin: EdgeInsets.all(4.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(2, 2),
                    blurRadius: 2,
                    spreadRadius: .5,
                  ),
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(-2, -2),
                    blurRadius: 2,
                    spreadRadius: .5,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 120.h,
                      padding: EdgeInsets.only(left: 8.w, right: 15.w),
                      child: Text(
                        list[index].name,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CachedNetworkImage(
                      imageUrl: '${Variables.domain}${list[index].image}',
                      placeholder: (context, url) => Icon(
                        Icons.image_outlined,
                        color: Colors.grey,
                        size: 80.h,
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        color: Colors.grey,
                        size: 80.h,
                      ),
                      height: 80.h,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
