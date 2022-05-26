import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerc_app_b2g_test/controller/product_controller.dart';
import 'package:ecommerc_app_b2g_test/screens/home/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../variables/variables.dart';
import 'widgets/category_view_item.dart';
import 'widgets/home_appbar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final pc = Get.find<ProductController>();

  String catItem = '';
  String storeItem = '';
  String brandItem = '';

  @override
  Widget build(BuildContext context) {
    final double wd = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: HomeAppBar(scaffoldKey: _scaffoldKey),
        ),
        body: GetBuilder<ProductController>(
          builder: (controller) {
            return SafeArea(
              child: Scaffold(
                body: pc.loading == true
                    ? const Center(child: CircularProgressIndicator())
                    : _bodyUI(controller),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _bodyUI(ProductController pc) {
    final banners = [
      pc.productListModel.value.data.info.firstBanner,
      pc.productListModel.value.data.info.secondBanner,
      pc.productListModel.value.data.info.thirdBanner,
    ];
    return RefreshIndicator(
      onRefresh: () async => await pc.refreshProductList(),
      backgroundColor: Colors.white,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          SizedBox(height: 15.h),

          //Banner

          SizedBox(
            width: Get.width,
            height: 180.h,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(8.r),
              ),
              child: Swiper(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  var item = banners[index];
                  return Center(
                    child: CachedNetworkImage(
                      imageUrl: '${Variables.domain}${item}',
                      // placeholder: (context, url) => Icon(
                      //     Icons.image_outlined,
                      //     color: Colors.grey,
                      //     size: wd * .3),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error, size: 90.w, color: Colors.grey),
                      progressIndicatorBuilder: (context, string, progress) =>
                          const CircularProgressIndicator(),
                      fit: BoxFit.fitHeight,
                    ),
                  );
                },
                pagination: const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.grey,
                  ),
                ),
                autoplay: true,
              ),
            ),
          ),

          SizedBox(height: 15.h),

          ///Shop by Categories
          Text(
            'Shop By Categories',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.pink,
            ),
          ),
          CategoryGridView(list: pc.productListModel.value.data.category),

          SizedBox(height: 15.h),

          ///Shop by brand
          Text(
            pc.productListModel.value.data.brand.title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.pink,
            ),
          ),

          Container(
            height: 108.h,
            margin: EdgeInsets.only(top: 7.h, bottom: 15.h),
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 7.w),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: pc.productListModel.value.data.brand.items.length,
              itemBuilder: (context, index) => _brandTile(pc, index),
            ),
          ),

          ///Shop by store
          Text(pc.productListModel.value.data.shop.title,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.pink)),
          Container(
            height: 32.h,
            margin: EdgeInsets.only(top: 7.h),
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 7.w),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: pc.productListModel.value.data.shop.items.length,
              itemBuilder: (context, index) => _shopTile(pc, index),
            ),
          ),

          ///Image Slider

          SizedBox(
            width: Get.width,
            height: 180.h,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(8.r),
              ),
              child: Swiper(
                itemCount: pc.productListModel.value.data.info.sliders.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = pc.productListModel.value.data.info.sliders[index];
                  return Center(
                    child: CachedNetworkImage(
                      imageUrl: '${Variables.domain}${item.image}',
                      // placeholder: (context, url) => Icon(
                      //     Icons.image_outlined,
                      //     color: Colors.grey,
                      //     size: wd * .3),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error, size: 90.w, color: Colors.grey),
                      progressIndicatorBuilder: (context, string, progress) =>
                          const CircularProgressIndicator(),
                      fit: BoxFit.cover,
                    ),
                  );
                },
                pagination: const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.grey,
                  ),
                ),
                autoplay: true,
              ),
            ),
          ),
          SizedBox(height: 15.h),

          ///Product with title
          ListView.separated(
            padding: EdgeInsets.only(top: 15.h),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: pc.productListModel.value.data.productSection.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 30.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Divider(
                  thickness: 1.5.w,
                  color: Variables.primaryColor.withOpacity(.1),
                ),
              ),
            ),
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      pc.productListModel.value.data.productSection[index]
                          .title,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'View all \u{2192}',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Variables.primaryColor,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 5.h,
                ),

                ///Products

                SizedBox(
                  height: 250.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return ProductGrid(
                        item: pc.productListModel.value.data
                            .productSection[index].items[i],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: 5.w,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        // child: Divider(
                        //   thickness: 1.5.w,
                        //   color: Variables.primaryColor.withOpacity(.1),
                        // ),
                      ),
                    ),
                    itemCount: pc.productListModel.value.data
                        .productSection[index].items.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryTile(ProductController pc, int index) => InkWell(
        onTap: () =>
            catItem = pc.productListModel.value.data.category[index].name,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(
                width: 2.w,
                color: catItem ==
                        pc.productListModel.value.data.category[index].name
                    ? Variables.primaryColor.withOpacity(.3)
                    : Colors.white,
              )),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl:
                    '${Variables.domain}${pc.productListModel.value.data.category[index].image}',
                placeholder: (context, url) =>
                    Icon(Icons.image_outlined, color: Colors.grey, size: 29.sp),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error, color: Colors.grey, size: 29.sp),
                height: 29.sp,
                fit: BoxFit.cover,
              ),
              Text(' ${pc.productListModel.value.data.category[index].name}',
                  style: TextStyle(
                      color: Variables.textColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      );

  Widget _brandTile(ProductController pc, int index) => InkWell(
        onTap: () =>
            brandItem = pc.productListModel.value.data.brand.items[index].name,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.r),
                  ),
                  border: Border.all(
                    width: 2.w,
                    color: brandItem ==
                            pc.productListModel.value.data.brand.items[index]
                                .name
                        ? Variables.primaryColor.withOpacity(.3)
                        : Colors.white,
                  )),
              child: CachedNetworkImage(
                imageUrl:
                    '${Variables.domain}${pc.productListModel.value.data.brand.items[index].image}',
                placeholder: (context, url) =>
                    Icon(Icons.image_outlined, color: Colors.grey, size: 72.sp),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error, color: Colors.grey, size: 72.sp),
                height: 72.h,
                fit: BoxFit.cover,
              ),
            ),
            Text(' ${pc.productListModel.value.data.brand.items[index].name}',
                style: TextStyle(color: Variables.textColor, fontSize: 15.sp)),
          ],
        ),
      );

  Widget _shopTile(ProductController pc, int index) => InkWell(
        onTap: () =>
            storeItem = pc.productListModel.value.data.shop.items[index].name,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8.r),
              ),
              border: Border.all(
                width: 2.w,
                color: storeItem ==
                        pc.productListModel.value.data.shop.items[index].name
                    ? Variables.primaryColor.withOpacity(.3)
                    : Colors.white,
              )),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl:
                    '${Variables.domain}${pc.productListModel.value.data.shop.items[index].image}',
                placeholder: (context, url) =>
                    Icon(Icons.image_outlined, color: Colors.grey, size: 29.sp),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error, color: Colors.grey, size: 29.sp),
                height: 29.h,
                fit: BoxFit.cover,
              ),
              Text(' ${pc.productListModel.value.data.shop.items[index].name}',
                  style: TextStyle(
                      color: Variables.textColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      );
}
