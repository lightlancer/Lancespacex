import 'bloc/list_category_bloc.dart';
import 'models/list_category_model.dart';
import 'package:flutter/material.dart';
import 'package:lancespace/core/app_export.dart';
import 'package:lancespace/widgets/app_bar/appbar_leading_image.dart';
import 'package:lancespace/widgets/app_bar/appbar_subtitle.dart';
import 'package:lancespace/widgets/app_bar/custom_app_bar.dart';

class ListCategoryScreen extends StatelessWidget {
  const ListCategoryScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ListCategoryBloc>(
        create: (context) => ListCategoryBloc(
            ListCategoryState(listCategoryModelObj: ListCategoryModel()))
          ..add(ListCategoryInitialEvent()),
        child: ListCategoryScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<ListCategoryBloc, ListCategoryState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: SizedBox(
                  width: mediaQueryData.size.width,
                  child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: 10.v),
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 5.v),
                          child: Column(children: [
                            _buildCategoryOptionBikini(context,
                                userImage: ImageConstant.imgArrowLeftPrimary,
                                bikini: "lbl_shirt".tr, onTapBikiniIcon: () {
                              onTapArrowLeft1(context);
                            }),
                            _buildCategoryOptionBikini(context,
                                userImage: ImageConstant.imgBikiniIcon,
                                bikini: "lbl_bikini".tr),
                            _buildCategoryOptionBikini(context,
                                userImage: ImageConstant.imgClock,
                                bikini: "lbl_dress".tr),
                            _buildCategoryOptionBikini(context,
                                userImage: ImageConstant.imgManWorkEquipment,
                                bikini: "lbl_work_equipment".tr),
                            _buildCategoryOptionBikini(context,
                                userImage: ImageConstant.imgTrash,
                                bikini: "lbl_man_pants".tr),
                            _buildCategoryOptionBikini(context,
                                userImage: ImageConstant.imgTicket,
                                bikini: "lbl_man_shoes".tr),
                            _buildCategoryOptionBikini(context,
                                userImage: ImageConstant.imgForward,
                                bikini: "lbl_man_underwear".tr),
                            _buildCategoryOptionBikini(context,
                                userImage: ImageConstant.imgAirplane,
                                bikini: "lbl_man_t_shirt".tr),
                            _buildCategoryOptionBikini(context,
                                userImage: ImageConstant.imgTrashPrimary,
                                bikini: "lbl_woman_bag".tr),
                            _buildCategoryOptionBikini(context,
                                userImage: ImageConstant.imgWomanPantsIcon,
                                bikini: "lbl_woman_pants".tr),
                            _buildCategoryOptionBikini(context,
                                userImage: ImageConstant.imgWomanShoesIcon,
                                bikini: "lbl_high_heels".tr)
                          ]))))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftBlueGray300,
            margin: EdgeInsets.only(left: 16.h, top: 14.v, bottom: 17.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "lbl_category".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Common widget
  Widget _buildCategoryOptionBikini(
    BuildContext context, {
    required String userImage,
    required String bikini,
    Function? onTapBikiniIcon,
  }) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(
              imagePath: userImage,
              height: 24.adaptSize,
              width: 24.adaptSize,
              onTap: () {
                onTapBikiniIcon!.call();
              }),
          Padding(
              padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 3.v),
              child: Text(bikini,
                  style: theme.textTheme.labelLarge!.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(1))))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the previous screen.
  onTapArrowLeft1(BuildContext context) {
    NavigatorService.goBack();
  }
}
