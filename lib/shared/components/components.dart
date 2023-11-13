import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelsgo_task/generated/assets.dart';
import 'package:hotelsgo_task/model/hotel_model.dart';
import 'package:hotelsgo_task/shared/styles/colors.dart';

import '../constants.dart';

class HotelItem extends StatelessWidget {
  final HotelModel hotelModel;
  const HotelItem({super.key, required this.hotelModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: AppConstants.hotelItemPaddingHorizontal,
          left: AppConstants.hotelItemPaddingHorizontal,
          top: 10.h,
          bottom: 5.h),
      child: Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(AppConstants.hotelItemCardRadios))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HotelItemPic(
              hotelModel: hotelModel,
            ),
            HotelItemText(
              hotelModel: hotelModel,
            ),
          ],
        ),
      ),
    );
  }
}

class HotelItemPic extends StatelessWidget {
  final HotelModel hotelModel;
  const HotelItemPic({super.key, required this.hotelModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: 180.0.h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppConstants.hotelItemCardRadios),
                topLeft: Radius.circular(AppConstants.hotelItemCardRadios)),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: hotelModel.image!,
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                size: MediaQuery.of(context).size.width /
                    MediaQuery.of(context).size.height *
                    100,
              ),
            ),
          ),
          Positioned(
            right: 20.w,
            top: 20.h,
            child: CircleAvatar(
              radius: 25.r,
              backgroundColor: AppColors.iconFavoriteBgColor,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border_outlined,
                  size: 30.r,
                ),
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HotelItemText extends StatelessWidget {
  final HotelModel hotelModel;
  const HotelItemText({super.key, required this.hotelModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.0,
        right: AppConstants.appbarPaddingHorizontal,
        left: AppConstants.appbarPaddingHorizontal,
      ),
      child: SizedBox(
        height: 240.0.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 9,
              child: RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    style: const TextStyle(color: AppColors.textColor),
                    children: [
                      TextSpan(
                        text:
                            ' ${convertNumberToStars(hotelModel.starts!)}  Hotel \n\n',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: ' ${hotelModel.name!}\n',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.r),
                          ),
                          color: AppColors.textBgColor,
                          child: SizedBox(
                            width: 35.w,
                            height: 24.h,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "${hotelModel.reviewScore}",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: '${hotelModel.review}  ',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      WidgetSpan(
                          child: Icon(
                        Icons.location_on,
                        size: 16.sp,
                      )),
                      TextSpan(
                        text: ' ${hotelModel.address}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ]),
              ),
            ),
            Expanded(
              flex: 11,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(AppConstants.hotelItemCardRadios),
                  side: const BorderSide(
                    color: AppColors.iconFavoriteBgColor,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Text(
                          'View Deal',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.sp),
                        ),
                        label: Icon(Icons.arrow_forward_ios, size: 20.r),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 14.w, top: 2.h),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              style:
                                  const TextStyle(color: AppColors.textColor),
                              children: [
                                TextSpan(
                                  text: 'Our lowest price\n\n',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    background: Paint()
                                      ..color = AppColors.textPriceBgColor
                                      ..strokeWidth = 14.w
                                      ..strokeJoin = StrokeJoin.round
                                      ..strokeCap = StrokeCap.round
                                      ..style = PaintingStyle.stroke,
                                  ),
                                ),
                                TextSpan(
                                  text: '\$ ',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textBgColor,
                                  ),
                                ),
                                TextSpan(
                                  text: '${hotelModel.price}\n',
                                  style: TextStyle(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textBgColor,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Renaissance',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'More prices',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.gray,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FloatingActionBottomCard extends StatelessWidget {
  const FloatingActionBottomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 160.w,
        height: 80.h,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 3.w, color: AppColors.white),
                borderRadius: BorderRadius.all(
                  Radius.circular(AppConstants.hotelItemCardRadios),
                ),
              ),
              child: Image.asset(
                fit: BoxFit.fill,
                Assets.assetsMapsIc,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.r),
                ),
                color: AppColors.floatingActionButtonBg,
                child: SizedBox(
                  width: 60.w,
                  height: 40.h,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Map',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w900,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String convertNumberToStars(num number) {
  switch (number) {
    case 0:
      {
        return '';
      }
    case 1:
      {
        return '★';
      }
    case 2:
      {
        return '★★';
      }
    case 3:
      {
        return '★★★';
      }
    case 4:
      {
        return '★★★★';
      }
    case 5:
      {
        return '★★★★★';
      }
    default:
      {
        return '';
      }
  }
}

class IconTextButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function() onPressed;
  const IconTextButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: AppColors.iconTextContentColor,
        size: 40.w,
      ),
      label: Text(
        label,
        style:
            TextStyle(color: AppColors.iconTextContentColor, fontSize: 20.sp),
      ),
    );
  }
}

class LoadingCard extends StatelessWidget {
  const LoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

