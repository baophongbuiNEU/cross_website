import 'package:cross_website/components/common/custom_grid.dart';
import 'package:cross_website/components/home_page/item_services.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:cross_website/constants/image_constant.dart';
import 'package:cross_website/language/language_manager.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';

class OurService extends StatelessComponent {
  const OurService({super.key});

  List<ItemServices> getListService(String lang) {
    return [
      ItemServices(
        title: LanguageManager.translate('our_service_seo_title', lang),
        content: LanguageManager.translate('our_service_seo_content', lang),
        backgroundColor: Color.hex('#F3F3F3'),
        backgroundItem: AppColors.primaryColor,
        backgroundText: AppColors.greenPrimary,
        titleColor: AppColors.primaryColor,
        contentColor: AppColors.primaryColor,
        itemColor: AppColors.greenPrimary,
        itemBig: Images.seoIcon,
      ),
      ItemServices(
        title: LanguageManager.translate('our_service_ppc_title', lang),
        content: LanguageManager.translate('our_service_ppc_content', lang),
        backgroundColor: AppColors.greenPrimary,
        backgroundItem: AppColors.primaryColor,
        backgroundText: Colors.white,
        titleColor: AppColors.primaryColor,
        contentColor: AppColors.primaryColor,
        itemColor: AppColors.greenPrimary,
        itemBig: Images.payPerClickIcon,
      ),
      ItemServices(
        title: LanguageManager.translate('our_service_smm_title', lang),
        content: LanguageManager.translate('our_service_smm_content', lang),
        backgroundColor: AppColors.primaryColor,
        backgroundItem: Colors.white,
        backgroundText: Colors.white,
        titleColor: AppColors.primaryColor,
        contentColor: Colors.white,
        itemColor: AppColors.greenPrimary,
        itemBig: Images.socialMediaMarketingIcon,
      ),
      ItemServices(
        title: LanguageManager.translate('our_service_email_title', lang),
        content: LanguageManager.translate('our_service_email_content', lang),
        backgroundColor: Color.hex('#F3F3F3'),
        backgroundItem: AppColors.primaryColor,
        backgroundText: AppColors.greenPrimary,
        titleColor: AppColors.primaryColor,
        contentColor: AppColors.primaryColor,
        itemColor: AppColors.greenPrimary,
        itemBig: Images.emailMarketingIcon,
      ),
      ItemServices(
        title: LanguageManager.translate('our_service_content_title', lang),
        content: LanguageManager.translate('our_service_content_content', lang),
        backgroundColor: AppColors.greenPrimary,
        backgroundItem: AppColors.primaryColor,
        backgroundText: Colors.white,
        titleColor: AppColors.primaryColor,
        contentColor: AppColors.primaryColor,
        itemColor: AppColors.greenPrimary,
        itemBig: Images.contentCreationIcon,
      ),
      ItemServices(
        title: LanguageManager.translate('our_service_analytics_title', lang),
        content:
            LanguageManager.translate('our_service_analytics_content', lang),
        backgroundColor: AppColors.primaryColor,
        backgroundItem: Colors.white,
        backgroundText: Colors.white,
        titleColor: AppColors.primaryColor,
        contentColor: Colors.white,
        itemColor: AppColors.greenPrimary,
        itemBig: Images.analyticsIcon,
      ),
    ];
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final selectedLang = context.watch(selectedLanguageProvider);

    final services = getListService(selectedLang);

    yield div(
      styles: Styles(
        width: 100.vw,
        justifyContent: JustifyContent.center,
        alignItems: AlignItems.center,
        alignSelf: AlignSelf.center,
      ),
      [
        for (var i = 0; i < services.length / 2; i++)
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
                services[i * 2],
                services[i * 2 + 1],
              ]),
            ],
          ),
      ],
    );
  }
}
