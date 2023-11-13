import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/constants.dart';
import '../../shared/styles/colors.dart';

class BottomSheetFilterCard extends StatelessWidget {
  const BottomSheetFilterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.95,
      minChildSize: 0.7,
      maxChildSize: 0.95,
      builder: (_, controller) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppConstants.bottomSheetRadios),
          ),
        ),
        color: AppColors.white,
        child: ListView(
          controller: controller,
          children: const [
            BottomSheetFilterAppbar(),
            BottomSheetPriceSelection(),
            BottomSheetRating(),
            BottomSheetHotelClass(),
            BottomSheetLocation(),
            ShowResultCard(),
          ],
        ),
      ),
    );
  }
}

class BottomSheetFilterAppbar extends StatelessWidget {
  const BottomSheetFilterAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shadowColor: AppColors.shadowColor,
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppConstants.bottomSheetRadios),
        ),
      ),
      child: SizedBox(
        height: 70.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Reset',
                style: TextStyle(
                  color: AppColors.gray,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Text(
              'Filters',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                size: 25.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSheetPriceSelection extends StatefulWidget {
  const BottomSheetPriceSelection({super.key});

  @override
  State<BottomSheetPriceSelection> createState() =>
      _BottomSheetPriceSelectionState();
}

class _BottomSheetPriceSelectionState extends State<BottomSheetPriceSelection> {
  double _currentValue = 100;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppConstants.bottomSheetItemPaddingHorizontal,
          vertical: AppConstants.bottomSheetItemPaddingVertical),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'PRICE PER NIGHT',
                style: TextStyle(
                  color: AppColors.bottomSheetLabelTextColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w900,
                  wordSpacing: 3.w,
                ),
              ),
              SizedBox(
                height: 50.h,
                width: 70.w,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: AppColors.gray),
                    borderRadius:
                    BorderRadius.all(Radius.circular(AppConstants.radios5)),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${_currentValue.round()} \$',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
              )
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 18.r,
                elevation: 5,
              ),
            ),
            child: Slider(
              min: 20,
              max: 540,
              value: _currentValue,
              onChanged: (value) {
                setState(() {
                  _currentValue = value;
                });
              },
              activeColor: AppColors.sliderBarActiveColor,
              thumbColor: AppColors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 28.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$20',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.gray,
                  ),
                ),
                Text(
                  '\$540+',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.gray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheetRating extends StatelessWidget {
  const BottomSheetRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppConstants.bottomSheetItemPaddingHorizontal,
          vertical: AppConstants.bottomSheetItemPaddingVerticalCustom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'RATING',
            style: TextStyle(
              color: AppColors.bottomSheetLabelTextColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w900,
              wordSpacing: 3.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RatingCard(
                  label: '0+',
                  backgroundColor: AppColors.bottomSheetRatingColors.rate0,
                ),
                RatingCard(
                  label: '7+',
                  backgroundColor: AppColors.bottomSheetRatingColors.rate7,
                ),
                RatingCard(
                  label: '7.5+',
                  backgroundColor: AppColors.bottomSheetRatingColors.rate75,
                ),
                RatingCard(
                  label: '8+',
                  backgroundColor: AppColors.bottomSheetRatingColors.rate8,
                ),
                RatingCard(
                  label: '8.5+',
                  backgroundColor: AppColors.bottomSheetRatingColors.rate85,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RatingCard extends StatefulWidget {
  final String label;
  final Color backgroundColor;
  const RatingCard(
      {super.key, required this.label, required this.backgroundColor});

  @override
  State<RatingCard> createState() => _RatingCardState();
}

class _RatingCardState extends State<RatingCard> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isSelected) {
          setState(() {
            isSelected = false;
          });
        } else {
          setState(() {
            isSelected = true;
          });
        }
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radios5),
            side: BorderSide(
              width: 5.w,
              color:
              isSelected ? AppColors.textPriceBgColor : Colors.transparent,
            )),
        color: widget.backgroundColor,
        child: SizedBox(
          width: 50.w,
          height: 50.h,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomSheetHotelClass extends StatelessWidget {
  const BottomSheetHotelClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppConstants.bottomSheetItemPaddingHorizontal,
          vertical: AppConstants.bottomSheetItemPaddingVerticalCustom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'HOTEL CLASS',
            style: TextStyle(
              color: AppColors.bottomSheetLabelTextColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w900,
              wordSpacing: 3.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 14.h),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HotelClassCard(starsCount: 1),
                HotelClassCard(starsCount: 2),
                HotelClassCard(starsCount: 3),
                HotelClassCard(starsCount: 4),
                HotelClassCard(starsCount: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HotelClassCard extends StatefulWidget {
  final int starsCount;
  const HotelClassCard({super.key, required this.starsCount});

  @override
  State<HotelClassCard> createState() => _HotelClassCardState();
}

class _HotelClassCardState extends State<HotelClassCard> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isSelected) {
          setState(() {
            isSelected = false;
          });
        } else {
          setState(() {
            isSelected = true;
          });
        }
      },
      child: widget.starsCount == 5
          ? Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radios5),
          side: isSelected
              ? BorderSide(
            width: 5.w,
            color: AppColors.textPriceBgColor,
          )
              : BorderSide(
            width: 1.w,
            color: AppColors.starColor,
          ),
        ),
        color: AppColors.white,
        child: SizedBox(
          width: 50.w,
          height: 50.h,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.starColor,
                          size: 20.w,
                        ),
                        Icon(
                          Icons.star,
                          color: AppColors.starColor,
                          size: 20.w,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Icon(
                      Icons.star,
                      color: AppColors.starColor,
                      size: 20.w,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.starColor,
                          size: 20.w,
                        ),
                        Icon(
                          Icons.star,
                          color: AppColors.starColor,
                          size: 20.w,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
          : Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radios5),
          side: isSelected
              ? BorderSide(
            width: 5.w,
            color: AppColors.textPriceBgColor,
          )
              : BorderSide(
            width: 1.w,
            color: AppColors.starColor,
          ),
        ),
        color: AppColors.white,
        child: SizedBox(
          width: 50.w,
          height: 50.h,
          child: Align(
            alignment: Alignment.center,
            child: Wrap(
              alignment: WrapAlignment.center,
              verticalDirection: VerticalDirection.up,
              children: List.generate(
                widget.starsCount,
                    (index) => Icon(
                  Icons.star,
                  color: AppColors.starColor,
                  size: 20.w,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomSheetLocation extends StatelessWidget {
  const BottomSheetLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppConstants.bottomSheetItemPaddingHorizontal,
          vertical: AppConstants.bottomSheetItemPaddingVerticalCustom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'DISTANCE FROM',
            style: TextStyle(
              color: AppColors.bottomSheetLabelTextColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w900,
              wordSpacing: 3.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: const Divider(
              color: AppColors.iconFavoriteBgColor,
              thickness: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Location',
                style: TextStyle(
                  color: AppColors.bottomSheetLabelTextColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  wordSpacing: 3.w,
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Text(
                  'City Center',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: AppColors.gray,
                  ),
                ),
                label: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.r,
                  color: AppColors.gray,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: const Divider(
              color: AppColors.iconFavoriteBgColor,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class ShowResultCard extends StatelessWidget {
  const ShowResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.showResultColor,elevation: 0),
          onPressed: () {},
          child: Text(
            'Show results',
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}