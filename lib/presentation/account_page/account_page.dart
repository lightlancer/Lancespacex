import 'bloc/account_bloc.dart';
import 'models/account_model.dart';
import 'package:flutter/material.dart';
import 'package:lancespace/core/app_export.dart';
import 'package:lancespace/widgets/app_bar/appbar_title.dart';
import 'package:lancespace/widgets/app_bar/appbar_trailing_image.dart';
import 'package:lancespace/widgets/app_bar/custom_app_bar.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<AccountBloc>(
        create: (context) =>
            AccountBloc(AccountState(accountModelObj: AccountModel()))
              ..add(AccountInitialEvent()),
        child: AccountPage());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 11.v),
                  child: Column(children: [
                    _buildAccountOptionOrder(context,
                        bagIconImage: ImageConstant.imgUserPrimary,
                        orderText: "lbl_profile".tr,
                        onTapAccountOptionOrder: () {
                      onTapAccountOption(context);
                    }),
                    _buildAccountOptionOrder(context,
                        bagIconImage: ImageConstant.imgBagIcon,
                        orderText: "lbl_order".tr),
                    _buildAccountOptionOrder(context,
                        bagIconImage: ImageConstant.imgLocation,
                        orderText: "lbl_address".tr),
                    SizedBox(height: 5.v),
                    _buildAccountOptionOrder(context,
                        bagIconImage: ImageConstant.imgCreditCardIcon,
                        orderText: "lbl_payment".tr,
                        onTapAccountOptionOrder: () {
                      onTapAccountOption1(context);
                    })
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: AppbarTitle(
            text: "lbl_account".tr, margin: EdgeInsets.only(left: 16.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNotificationIcon,
              margin: EdgeInsets.fromLTRB(13.h, 15.v, 13.h, 16.v),
              onTap: () {
                onTapNotificationIcon(context);
              })
        ]);
  }

  /// Common widget
  Widget _buildAccountOptionOrder(
    BuildContext context, {
    required String bagIconImage,
    required String orderText,
    Function? onTapAccountOptionOrder,
  }) {
    return GestureDetector(
        onTap: () {
          onTapAccountOptionOrder!.call();
        },
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(16.h),
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomImageView(
                  imagePath: bagIconImage,
                  height: 24.adaptSize,
                  width: 24.adaptSize),
              Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 3.v),
                  child: Text(orderText,
                      style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onPrimary.withOpacity(1))))
            ])));
  }

  /// Navigates to the notificationScreen when the action is triggered.
  onTapNotificationIcon(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.notificationScreen,
    );
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTapAccountOption(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.profileScreen,
    );
  }

  /// Navigates to the addPaymentScreen when the action is triggered.
  onTapAccountOption1(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addPaymentScreen,
    );
  }
}
