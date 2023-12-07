import 'package:flutter/material.dart';
import 'package:online_shop/core/app_export.dart';
import 'package:online_shop/widgets/app_bar/appbar_leading_image.dart';
import 'package:online_shop/widgets/app_bar/appbar_subtitle.dart';
import 'package:online_shop/widgets/app_bar/custom_app_bar.dart';

class AddPaymentScreen extends StatelessWidget {
  const AddPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 10.v),
                child: Column(children: [
                  _buildPaymentOption(context,
                      userImage: ImageConstant.imgCreditCardIcon,
                      userLabel: "msg_credit_card_or_debit".tr,
                      onTapPaymentOption: () {
                    onTapPaymentOption(context);
                  }),
                  _buildPaymentOption(context,
                      userImage: ImageConstant.imgPaypalIcon,
                      userLabel: "lbl_paypal".tr),
                  SizedBox(height: 5.v),
                  _buildPaymentOption(context,
                      userImage: ImageConstant.imgAirplanePrimary,
                      userLabel: "lbl_bank_transfer".tr)
                ]))));
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
            text: "lbl_payment".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Common widget
  Widget _buildPaymentOption(
    BuildContext context, {
    required String userImage,
    required String userLabel,
    Function? onTapPaymentOption,
  }) {
    return GestureDetector(
        onTap: () {
          onTapPaymentOption!.call();
        },
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(16.h),
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Row(children: [
              CustomImageView(
                  imagePath: userImage,
                  height: 24.adaptSize,
                  width: 24.adaptSize),
              Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 4.v),
                  child: Text(userLabel,
                      style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onPrimary.withOpacity(1))))
            ])));
  }
}
