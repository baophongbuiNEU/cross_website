import 'package:jaspr/jaspr.dart';
import 'package:my_website/components/common/custom_grid.dart';
import 'package:my_website/components/common/size_box_component.dart';
import 'package:my_website/components/home_page/item_services.dart';
import 'package:my_website/constants/app_colors.dart';
import 'package:my_website/constants/image_constant.dart';

class OurService extends StatelessComponent {
  const OurService({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
        styles: Styles(
          width: 100.vw,
          justifyContent: JustifyContent.center,
          alignItems: AlignItems.center,
          alignSelf: AlignSelf.center,
        ),
        [
          for (var i = 0; i < listService.length / 2; i++)
            div(
                styles: Styles(
                  display: Display.flex,
                  padding: Padding.symmetric(horizontal: 5.percent),
                  justifyContent: JustifyContent.center,
                  alignItems: AlignItems.center,
                  alignSelf: AlignSelf.center,
                ),
                [
                  CustomGrid(children: [
                    listService[i * 2],
                    listService[i * 2 + 1],
                  ]),
                ]),
        ]);
  }
}

final listService = [
  ItemServices(
      title: "Search engine optimization",
      content: "Learn more",
      backgroundColor: Color.hex('#F3F3F3'),
      backgroundItem: AppColors.primaryColor,
      backgroundText: AppColors.greenPrimary,
      titleColor: AppColors.primaryColor,
      contentColor: AppColors.primaryColor,
      itemColor: AppColors.greenPrimary,
      itemBig: Images.seoIcon),
  ItemServices(
      title: "Pay-per-click advertising",
      content: "Learn more",
      backgroundColor: AppColors.greenPrimary,
      backgroundItem: AppColors.primaryColor,
      backgroundText: Colors.white,
      titleColor: AppColors.primaryColor,
      contentColor: AppColors.primaryColor,
      itemColor: AppColors.greenPrimary,
      itemBig: Images.payPerClickIcon),
  ItemServices(
      title: "Social Media Marketing",
      content: "Learn more",
      backgroundColor: AppColors.primaryColor,
      backgroundItem: Colors.white,
      backgroundText: Colors.white,
      titleColor: AppColors.primaryColor,
      contentColor: Colors.white,
      itemColor: AppColors.greenPrimary,
      itemBig: Images.socialMediaMarketingIcon),
  ItemServices(
      title: "Email Marketing",
      content: "Learn more",
      backgroundColor: Color.hex('#F3F3F3'),
      backgroundItem: AppColors.primaryColor,
      backgroundText: AppColors.greenPrimary,
      titleColor: AppColors.primaryColor,
      contentColor: AppColors.primaryColor,
      itemColor: AppColors.greenPrimary,
      itemBig: Images.emailMarketingIcon),
  ItemServices(
      title: "Content Creation",
      content: "Learn more",
      backgroundColor: AppColors.greenPrimary,
      backgroundItem: AppColors.primaryColor,
      backgroundText: Colors.white,
      titleColor: AppColors.primaryColor,
      contentColor: AppColors.primaryColor,
      itemColor: AppColors.greenPrimary,
      itemBig: Images.contentCreationIcon),
  ItemServices(
      title: "Analytics and Tracking",
      content: "Learn more",
      backgroundColor: AppColors.primaryColor,
      backgroundItem: Colors.white,
      backgroundText: Colors.white,
      titleColor: AppColors.primaryColor,
      contentColor: Colors.white,
      itemColor: AppColors.greenPrimary,
      itemBig: Images.analyticsIcon),
];
