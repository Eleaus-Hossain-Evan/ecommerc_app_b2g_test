import 'package:ecommerc_app_b2g_test/variables/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductAmountInc extends StatelessWidget {
  ProductAmountInc({
    Key? key,
    required this.productId,
    this.gap,
    this.isRounded = true,
    this.iconSize,
    this.textSize,
    this.iconColor,
  }) : super(key: key);

  final String productId;
  final double? gap;
  final double? iconSize;
  final double? textSize;
  final Color? iconColor;
  final bool isRounded;

  // final CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        // init: CartController(),
        builder: (controller) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            // onTap: () => controller.productQuantity.value > 1
            //     ? controller.productQuantity.value--
            //     : controller.removeitem(productId),
            child: Obx(() => Icon(
                  // controller.productQuantity.value < 2
                  //     ? Icons.delete
                  //     :
                  isRounded ? Icons.remove_circle : Icons.remove,
                  size: iconSize,
                  color: isRounded
                      ? iconColor ?? Colors.black.withOpacity(0.6)
                      : iconColor ?? Variables.primaryColor,
                )),
          ),
          SizedBox(
            width: gap ?? 9.w,
          ),
          Container(
            child: Obx(() => Text(
                  // "${controller.productQuantity.value}",
                  "0",
                  style: TextStyle(
                      fontSize: textSize ?? 18.sp,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline),
                )),
          ),
          SizedBox(
            width: gap ?? 9.w,
          ),
          InkWell(
            // onTap: () => controller.productQuantity.value++,
            child: Icon(
              isRounded ? Icons.add_circle : Icons.add,
              size: iconSize ?? 28.sp,
              color: isRounded
                  ? iconColor ?? Colors.black
                  : iconColor ?? Variables.primaryColor,
            ),
          ),
        ],
      );
    });
  }
}
