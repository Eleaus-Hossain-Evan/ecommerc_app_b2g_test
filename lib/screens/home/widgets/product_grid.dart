import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerc_app_b2g_test/variables/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:cart_stepper/cart_stepper.dart';

import '../../../controller/product_controller.dart';
import '../../../data/models/cart_model.dart';
import '../../../data/models/product_list_model.dart';
import 'product_Amount_inc.dart';

class ProductGrid extends StatefulWidget {
  final Item item;

  const ProductGrid({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  final ProductController _productController = Get.find();

  // Color animateBGColor = Variables.primaryColor;
  // Color animateFGColor = Variables.appBgColor;
  // bool isAnimate = false;
  // bool isDelayedAnimate = false;

  // double animateWith = 28.w;

  final RxInt _counter = 0.obs;

  int a = 0;

  // animationOpne() {
  //   setState(() {
  //     isAnimate = true;
  //     animateWith = 104.w;
  //   });
  // }

  // animationClose() {
  //   setState(() {
  //     isAnimate = false;
  //     animateWith = 28.w;
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  // var isProductAddedToCart = false.obs;
  // void delayeAnimate() {
  //   Future.delayed(Duration(milliseconds: 500))
  //       .then((value) => setState(() => isDelayedAnimate = !isDelayedAnimate));
  //   print("Delayed................$isDelayedAnimate");
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 162.w,
      height: 198.h,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      child: GetBuilder<ProductController>(
        // init: ProductController(),
        // initState: (_) {
        //   // _product = _productController.findProductById(widget.id);
        //   // isProductAddedToCart.value = _product.isFavourite!;
        // },
        builder: (controller) {
          final int ix = controller.cartList
              .indexWhere((element) => element.id == widget.item.id);
          _counter.value = ix > 0 ? controller.cartList.elementAt(ix).count : 0;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 162.w,
                height: 198.h,
                clipBehavior: Clip.hardEdge,
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
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: CachedNetworkImage(
                        imageUrl: '${Variables.domain}${widget.item.thumbnail}',
                        // placeholder: (context, url) => Icon(
                        //     Icons.image_outlined,
                        //     color: Colors.grey,
                        //     size: wd * .3),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error, size: 90.w, color: Colors.grey),
                        progressIndicatorBuilder: (context, string, progress) =>
                            Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: LinearProgressIndicator(
                              value: progress.progress,
                              backgroundColor: Variables.primaryColor,
                              color: Variables.purpleLite,
                            ),
                          ),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),

                    //Cart buttons
                    Positioned(
                      bottom: 0.h,
                      left: 10.w,
                      child: Padding(
                        padding: EdgeInsets.zero,
                        child: Center(
                          child: CartStepperInt(
                            count: ix == -1
                                ? 0
                                : controller.cartList.elementAt(ix).count,
                            size: 35,
                            activeBackgroundColor: Colors.transparent,
                            activeForegroundColor: Variables.primaryColor,
                            elevation: 0,
                            shadowColor: Variables.primaryColor.withOpacity(.8),
                            deActiveForegroundColor: Variables.purpleLite,
                            didChangeCount: (count) {
                              setState(() {});

                              ix == -1
                                  ? controller.cartList.add(CartModel(
                                      id: widget.item.id, count: count))
                                  : controller.cartList.elementAt(ix).count =
                                      count;
                            },
                          ),
                        ),
                      ),
                      // child: AnimatedContainer(
                      //   alignment: Alignment.center,
                      //   duration: const Duration(milliseconds: 500),
                      //   curve: Curves.easeOut,
                      //   width: animateWith,
                      //   height: 29.h,
                      //   clipBehavior: Clip.hardEdge,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(
                      //       23.r,
                      //     ),
                      //     border: Border.all(
                      //       color: isAnimate
                      //           ? Variables.primaryColor
                      //           : Colors.transparent,
                      //     ),
                      //     color: Colors.white,
                      //   ),
                      //   // child: isAnimate
                      //   //     ? Visibility(
                      //   //         visible: isDelayedAnimate,
                      //   //         child: SizedBox(
                      //   //           width: 104.w,
                      //   //           child: Row(
                      //   //             mainAxisAlignment:
                      //   //                 MainAxisAlignment.spaceEvenly,
                      //   //             children: [
                      //   //               Padding(
                      //   //                 padding: EdgeInsets.all(8),
                      //   //                 child: Center(
                      //   //                   child: CartStepperInt(
                      //   //                     count: _counter,
                      //   //                     size: 80,
                      //   //                     didChangeCount: (count) {
                      //   //                       setState(() {
                      //   //                         _counter = count;
                      //   //                       });
                      //   //                     },
                      //   //                   ),
                      //   //                 ),
                      //   //               ),
                      //   //               InkWell(
                      //   //                 child: Icon(
                      //   //                   FontAwesomeIcons.xmark,
                      //   //                   color: animateBGColor,
                      //   //                   size: 18.sp,
                      //   //                 ),
                      //   //                 onTap: () {
                      //   //                   animationClose();
                      //   //                   delayeAnimate();
                      //   //                 },
                      //   //               ),
                      //   //             ],
                      //   //           ),
                      //   //         ),
                      //   //       )
                      //   //     : Visibility(
                      //   //   visible: !isAnimate,
                      //   //   child: IconButton(
                      //   //       padding: const EdgeInsets.all(0),
                      //   //       alignment: Alignment.center,
                      //   //       icon: Icon(
                      //   //         isProductAddedToCart.isFalse
                      //   //             ? LineAwesomeIcons
                      //   //                 .shopping_cart_arrow_down
                      //   //             : FontAwesomeIcons.cartArrowDown,
                      //   //         color: Variables.primaryColor,
                      //   //         size: isProductAddedToCart.isFalse
                      //   //             ? 18.sp
                      //   //             : 20.sp,
                      //   //       ),
                      //   //       onPressed: () {
                      //   //         setState(() {
                      //   //           isAnimate = true;
                      //   //         });
                      //   //         delayeAnimate();
                      //   //         animationOpne();
                      //   //         isProductAddedToCart.toggle();
                      //   //         // _cartController.addItem(
                      //   //         //   _product.id,
                      //   //         //   _product.price,
                      //   //         //   _product.title,
                      //   //         //   1,
                      //   //         //   _product.images[0],
                      //   //         // );
                      //   //         print("Product added to Cart...");
                      //   //       }),
                      //   // ),

                      // ),
                    ),

                    //Price

                    Visibility(
                      visible: !(widget.item.variations[0].discountAmount == 0),
                      child: Positioned(
                        top: -7.h,
                        left: -7.w,
                        child: Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(.5),
                            borderRadius: BorderRadius.circular(7.r),
                          ),
                          child: Text(
                            "${widget.item.variations[0].discountAmount.toStringAsFixed(0)}\u{0025}",
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      color: Colors.white,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                        ),
                      ),
                    ),

                    //Favorite button

                    Positioned(
                      bottom: -5.5.h,
                      right: -7.w,
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          child: IconButton(
                            icon: _productController.favoriteList
                                    .toSet()
                                    .contains(widget.item.id)
                                ? Icon(
                                    FontAwesomeIcons.solidHeart,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    size: 20.sp,
                                  )
                                : Icon(
                                    FontAwesomeIcons.heart,
                                    color: Colors.grey.shade500,
                                    size: 20.sp,
                                  ),
                            onPressed: () {
                              _productController
                                  .toggleFavouriteStatus(widget.item);
                              Fluttertoast.showToast(
                                msg: _productController.favoriteList
                                        .toSet()
                                        .contains(widget.item.id)
                                    ? "Added to Wishlist"
                                    : "Remove from Wishlist",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              //Product title section....................
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.5.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.item.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.justify,
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              //Price section..............
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(
                  bottom: 5.5.h,
                  left: 3.5.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //discount price

                    Text(
                      "\u{09F3}${widget.item.buyingPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    //orginal price
                    // Text(
                    //   "\u{09F3}${_product.price.toStringAsFixed(2)}",
                    //   style: _product.discount == 0.0
                    //       ? const TextStyle(
                    //           fontWeight: FontWeight.w600,
                    //         )
                    //       : const TextStyle(
                    //           fontWeight: FontWeight.w600,
                    //           decoration: TextDecoration.lineThrough,
                    //           color: Colors.grey,
                    //         ),
                    // ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
