import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelsgo_task/generated/assets.dart';
import 'package:hotelsgo_task/layout/cubit/hotel_cubit.dart';
import 'package:hotelsgo_task/shared/components/components.dart';
import 'package:hotelsgo_task/shared/styles/colors.dart';
import 'package:lottie/lottie.dart';

import '../shared/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        var hotelList = HotelCubit.get(context).hotelList;
        var cubit = HotelCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.bgColor,
          body: hotelList.isEmpty
              ? Center(
                  child: Lottie.asset(
                    Assets.assetsLoading,
                  ),
                )
              : CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.appbarPaddingHorizontal),
                      sliver: SliverAppBar(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.r),
                                bottomRight: Radius.circular(20.r))),
                        pinned: true,
                        expandedHeight: 50.h,
                        backgroundColor: AppColors.white,
                        elevation: 10,
                        centerTitle: true,
                        title: Row(
                          children: [
                            Expanded(
                              flex: 50,
                              child: IconTextButton(
                                icon: Icons.tune_outlined,
                                label: "Filters",
                                onPressed: () {
                                  cubit.displayFilterBottomSheet(context);
                                },
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 50,
                              child: IconTextButton(
                                icon: Icons.sort,
                                label: "Sort",
                                onPressed: () {
                                  cubit.displaySortBottomSheet(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: hotelList.length,
                          (context, index) =>
                              HotelItem(hotelModel: hotelList[index])),
                    ),
                  ],
                ),
          floatingActionButton: hotelList.isEmpty
              ? const SizedBox()
              : const FloatingActionBottomCard(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
