import 'package:ecommerc_app_b2g_test/variables/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HomeAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  HomeAppBar({Key? key, this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            // onTap: () => scaffoldKey!.currentState!.openDrawer(),
            child: Icon(
              LineAwesomeIcons.bars,
              color: Colors.grey.shade800,
              size: 28.sp,
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    border: Border.all(width: 1, color: Colors.grey.shade400)),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 3.5.w),
                    Text(
                      'Search Product',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          InkWell(
            child: Stack(
              children: [
                Icon(
                  LineAwesomeIcons.bell,
                  color: Colors.grey.shade800,
                  size: 30.sp,
                ),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(2.5.w),
                    decoration: const BoxDecoration(
                        color: Variables.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      '9+',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 3.5.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            onTap: () {},
          ),
          const SizedBox(width: 8.0),
        ],
      ),
    );
  }
}
