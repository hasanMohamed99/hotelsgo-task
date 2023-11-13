import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/constants.dart';
import '../../shared/styles/colors.dart';

class BottomSheetSortCard extends StatelessWidget {
  const BottomSheetSortCard({super.key});

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
            BottomSheetSortAppbar(),
            SortTypeListTile(label: 'Our recommendations'),
            CustomDivider(),
            SortTypeListTile(label: 'Rating & Recommended'),
            CustomDivider(),
            SortTypeListTile(label: 'Price & Recommended'),
            CustomDivider(),
            SortTypeListTile(label: 'Distance & Recommended'),
            CustomDivider(),
            SortTypeListTile(label: 'Rating only'),
            CustomDivider(),
            SortTypeListTile(label: 'Price only'),
            CustomDivider(),
            SortTypeListTile(label: 'Distance only'),
            CustomDivider(),
          ],
        ),
      ),
    );
  }
}

class BottomSheetSortAppbar extends StatelessWidget {
  const BottomSheetSortAppbar({super.key});

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
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Sort by',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  size: 25.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SortTypeListTile extends StatefulWidget {
  final String label;
  const SortTypeListTile({super.key, required this.label});

  @override
  State<SortTypeListTile> createState() => _SortTypeListTileState();
}

class _SortTypeListTileState extends State<SortTypeListTile> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: Theme(
        data: ThemeData(
          unselectedWidgetColor: Colors.transparent,
        ),
        child: CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          dense: true,
          title: Text(
            widget.label,
            style: TextStyle(
              fontSize: 16.sp,
              wordSpacing: 3.w,
            ),
          ),
          value: _isChecked,
          onChanged: (bool? newValue) {
            setState(() {
              _isChecked = newValue!;
            });
          },
          activeColor: Colors.transparent,
          checkColor: AppColors.showResultColor,

        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: const Divider(
        color: AppColors.iconFavoriteBgColor,
        thickness: 1,
      ),
    );
  }
}

