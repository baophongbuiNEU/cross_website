import 'package:cross_website/components/common/size_box_component.dart';
import 'package:cross_website/components/home_page/item_services.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:cross_website/constants/image_constant.dart';
import 'package:cross_website/language/language_manager.dart';
import 'package:jaspr/jaspr.dart';

class OurService extends StatelessComponent {
  const OurService({super.key});

  // Danh sách dịch vụ với dữ liệu động từ LanguageManager
  List<ItemServices> getListService() {
    return [
      ItemServices(
        title: LanguageManager.translate('our_service_seo_title'),
        content: LanguageManager.translate('our_service_seo_content'),
        backgroundColor: AppColors.backgroundWhite,
        backgroundItem: AppColors.primaryColor,
        backgroundText: AppColors.greenPrimary,
        titleColor: AppColors.primaryColor,
        contentColor: AppColors.primaryColor,
        itemColor: AppColors.greenPrimary,
        itemBig: Images.seoIcon,
      ),
      ItemServices(
        title: LanguageManager.translate('our_service_ppc_title'),
        content: LanguageManager.translate('our_service_ppc_content'),
        backgroundColor: AppColors.greenPrimary,
        backgroundItem: AppColors.primaryColor,
        backgroundText: AppColors.white,
        titleColor: AppColors.primaryColor,
        contentColor: AppColors.primaryColor,
        itemColor: AppColors.greenPrimary,
        itemBig: Images.payPerClickIcon,
      ),
      ItemServices(
        title: LanguageManager.translate('our_service_smm_title'),
        content: LanguageManager.translate('our_service_smm_content'),
        backgroundColor: AppColors.primaryColor,
        backgroundItem: AppColors.white,
        backgroundText: AppColors.white,
        titleColor: AppColors.primaryColor,
        contentColor: AppColors.white,
        itemColor: AppColors.greenPrimary,
        itemBig: Images.socialMediaMarketingIcon,
      ),
      ItemServices(
        title: LanguageManager.translate('our_service_email_title'),
        content: LanguageManager.translate('our_service_email_content'),
        backgroundColor: AppColors.backgroundWhite,
        backgroundItem: AppColors.primaryColor,
        backgroundText: AppColors.greenPrimary,
        titleColor: AppColors.primaryColor,
        contentColor: AppColors.primaryColor,
        itemColor: AppColors.greenPrimary,
        itemBig: Images.emailMarketingIcon,
      ),
      ItemServices(
        title: LanguageManager.translate('our_service_content_title'),
        content: LanguageManager.translate('our_service_content_content'),
        backgroundColor: AppColors.greenPrimary,
        backgroundItem: AppColors.primaryColor,
        backgroundText: AppColors.white,
        titleColor: AppColors.primaryColor,
        contentColor: AppColors.primaryColor,
        itemColor: AppColors.greenPrimary,
        itemBig: Images.contentCreationIcon,
      ),
      ItemServices(
        title: LanguageManager.translate('our_service_analytics_title'),
        content: LanguageManager.translate('our_service_analytics_content'),
        backgroundColor: AppColors.primaryColor,
        backgroundItem: AppColors.white,
        backgroundText: AppColors.white,
        titleColor: AppColors.primaryColor,
        contentColor: AppColors.white,
        itemColor: AppColors.greenPrimary,
        itemBig: Images.analyticsIcon,
      ),
    ];
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield ValueListenableBuilder<String>(
      listenable:
          LanguageManager.selectedLanguage, // Lắng nghe thay đổi ngôn ngữ
      builder: (context, lang) sync* {
        final services = getListService();

        yield div(
          styles: Styles(width: 100.vw),
          [
            div(
              styles: Styles(
                display: Display.flex,
                padding: Padding.symmetric(horizontal: 100.px),
                flexDirection: FlexDirection.column,
              ),
              [
                for (var i = 0; i < services.length / 2; i++)
                  div([
                    div(
                      styles: Styles(
                        display: Display.flex,
                        flexDirection: FlexDirection.row,
                        justifyContent: JustifyContent.spaceAround,
                      ),
                      [
                        services[i * 2],
                        SizeBoxComponent(width: 20),
                        services[i * 2 + 1],
                      ],
                    ),
                    SizeBoxComponent(height: 40),
                  ]),
              ],
            ),
          ],
        );
      },
    );
  }
}
