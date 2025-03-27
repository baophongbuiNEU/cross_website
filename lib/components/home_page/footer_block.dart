import 'package:cross_website/components/common/size_box_component.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:cross_website/constants/image_constant.dart';
import 'package:cross_website/language/language_manager.dart';
import 'package:jaspr/jaspr.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:cross_website/constants/image_constant.dart';
import '../common/size_box_component.dart';

class FooterBlock extends StatelessComponent {
  const FooterBlock({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield ValueListenableBuilder<String>(
      listenable: LanguageManager.selectedLanguage,
      builder: (context, lang) sync* {
        yield div(
          styles: Styles(
            display: Display.flex,
            height: 400.px,
            padding: Padding.symmetric(horizontal: 60.px, vertical: 50.px),
            margin: Margin.symmetric(horizontal: 100.px),
            radius: BorderRadius.only(
              topLeft: Radius.circular(45.px),
              topRight: Radius.circular(45.px),
            ),
            flexDirection: FlexDirection.column,
            justifyContent: JustifyContent.spaceBetween,
            backgroundColor: AppColors.primaryColor,
          ),
          [_header(), _body(), _footer()],
        );
      },
    );
  }

  Component _header() {
    return div(
      styles: Styles(
        display: Display.flex,
        flexDirection: FlexDirection.row,
        justifyContent: JustifyContent.spaceBetween,
      ),
      [
        div(
          styles: Styles(
            display: Display.flex,
            flexDirection: FlexDirection.row,
            alignItems: AlignItems.center,
          ),
          [
            img(
              width: 30,
              height: 30,
              styles: Styles(raw: {"filter": "invert(1)"}),
              src: Images.imagePrimary,
              attributes: {'alt': 'Logo'}, // Thêm alt cho accessibility
            ),
            SizeBoxComponent(width: 6),
            div(
              styles: Styles(
                color: AppColors.white,
                fontSize: 30.px,
                fontWeight: FontWeight.w500,
              ),
              [
                text(LanguageManager.translate('footer_company_name')),
              ],
            ),
          ],
        ),
        div(
          styles: Styles(
            display: Display.flex,
            flexDirection: FlexDirection.row,
            color: AppColors.white,
            fontSize: 18.px,
            fontWeight: FontWeight.w400,
            textDecoration: TextDecoration(line: TextDecorationLine.underline),
          ),
          [
            text(LanguageManager.translate('footer_about_us')),
            SizeBoxComponent(width: 40),
            text(LanguageManager.translate('footer_services')),
            SizeBoxComponent(width: 40),
            text(LanguageManager.translate('footer_user_case')),
            SizeBoxComponent(width: 40),
            text(LanguageManager.translate('footer_pricing')),
          ],
        ),
        div(
          styles: Styles(
            display: Display.flex,
            flexDirection: FlexDirection.row,
          ),
          [
            img(
              src: Images.instagramIcon,
              height: 30,
              width: 30,
              attributes: {'alt': 'Instagram'},
            ),
            SizeBoxComponent(width: 20),
            img(
              src: Images.facebookIcon,
              height: 30,
              width: 30,
              attributes: {'alt': 'Facebook'},
            ),
            SizeBoxComponent(width: 20),
            img(
              src: Images.twitterIcon,
              height: 30,
              width: 30,
              attributes: {'alt': 'Twitter'},
            ),
          ],
        ),
      ],
    );
  }

  Component _body() {
    return div(
      styles: Styles(
        display: Display.flex,
        height: 185.px,
        flexDirection: FlexDirection.row,
        justifyContent: JustifyContent.spaceBetween,
      ),
      [
        _contentUs(),
        _inputEmail(),
      ],
    );
  }

  Component _contentUs() {
    return div(
      styles: Styles(
        display: Display.flex,
        width: 30.percent,
        height: 100.percent,
        flexDirection: FlexDirection.column,
        justifyContent: JustifyContent.spaceBetween,
        color: AppColors.white,
        fontSize: 18.px,
        fontWeight: FontWeight.w400,
      ),
      [
        div(
          styles: Styles(
            display: Display.inlineBlock,
            padding: Padding.symmetric(horizontal: 7.px),
            radius: BorderRadius.circular(7.px),
            alignSelf: AlignSelf.start,
            color: Colors.black,
            backgroundColor: Colors.yellow,
          ),
          [
            text(LanguageManager.translate('footer_contact_us')),
          ],
        ),
        div([
          a(
            href: "mailto:info@crosstech.com",
            styles: Styles(
              color: AppColors.white,
              textDecoration: TextDecoration(line: TextDecorationLine.none),
            ),
            [
              text(LanguageManager.translate('footer_email_label')),
            ],
          ),
        ]),
        div([
          a(
            href: "tel:0338305895",
            styles: Styles(
              color: AppColors.white,
              textDecoration: TextDecoration(line: TextDecorationLine.none),
            ),
            [
              text(LanguageManager.translate('footer_phone_label')),
            ],
          ),
        ]),
        div([
          a(
            href: "https://maps.app.goo.gl/8RR39Ge1WESWiPcj6",
            target: Target.blank,
            styles: Styles(
              color: AppColors.white,
              textDecoration: TextDecoration(line: TextDecorationLine.none),
            ),
            [
              text(LanguageManager.translate('footer_address_label')),
            ],
          ),
        ]),
      ],
    );
  }

  Component _inputEmail() {
    return div(
      styles: Styles(
        display: Display.flex,
        width: 60.percent,
        height: 100.percent,
        padding: Padding.symmetric(horizontal: 40.px),
        radius: BorderRadius.circular(14.px),
        flexDirection: FlexDirection.row,
        justifyContent: JustifyContent.spaceBetween,
        alignItems: AlignItems.center,
        backgroundColor: AppColors.background292A32,
      ),
      [
        textarea(
          placeholder: "Email",
          styles: Styles(
            width: 100.percent,
            height: 22.px,
            padding: Padding.symmetric(horizontal: 30.px, vertical: 22.px),
            border: Border(color: AppColors.white, width: 2.px),
            radius: BorderRadius.circular(14.px),
            alignItems: AlignItems.center,
            color: Colors.white,
            fontSize: 18.px,
            fontWeight: FontWeight.w400,
            backgroundColor: Colors.transparent,
            raw: {
              'resize': 'none',
              "white-space": "nowrap",
              "overflow": "hidden",
            },
          ),
          [],
        ),
        SizeBoxComponent(width: 20),
        div(
          styles: Styles(
            display: Display.flex,
            width: 80.percent,
            height: 40.px,
            padding: Padding.symmetric(vertical: 15.px, horizontal: 15.px),
            radius: BorderRadius.circular(14.px),
            justifyContent: JustifyContent.center,
            alignItems: AlignItems.center,
            fontSize: 18.px,
            fontWeight: FontWeight.w400,
            backgroundColor: AppColors.greenPrimary,
          ),
          [
            text(LanguageManager.translate('footer_subscribe_to_news')),
          ],
        ),
      ],
    );
  }

  Component _footer() {
    return div(
      styles: Styles(
        display: Display.flex,
        padding: Padding.only(top: 50.px),
        border:
            Border.only(top: BorderSide(width: 1.px, color: AppColors.white)),
        color: AppColors.white,
      ),
      [
        text(LanguageManager.translate('footer_copyright')),
        SizeBoxComponent(width: 40),
        div(
          styles: Styles(
            textDecoration: TextDecoration(line: TextDecorationLine.underline),
          ),
          [
            text(LanguageManager.translate('footer_privacy_policy')),
          ],
        ),
      ],
    );
  }

  @css
  static final style = [
    css('.footer_block', [
      css('&').styles(
          display: Display.flex,
          padding: Padding.symmetric(horizontal: 5.percent, vertical: 50.px),
          margin: Margin.symmetric(horizontal: 5.percent),
          radius: BorderRadius.only(
              topLeft: Radius.circular(45.px),
              topRight: Radius.circular(45.px)),
          flexDirection: FlexDirection.column,
          justifyContent: JustifyContent.spaceBetween,
          backgroundColor: AppColors.primaryColor)
    ]),
    css('.footer_header', [
      css('&').styles(
        display: Display.flex,
        margin: Spacing.only(
          bottom: 20.px,
        ),
        flexDirection: FlexDirection.row,
        justifyContent: JustifyContent.spaceBetween,
        alignItems: AlignItems.center,
      ),
    ]),
    css('.footer_body', [
      css('&').styles(
        display: Display.flex,
        flexDirection: FlexDirection.row,
        justifyContent: JustifyContent.spaceBetween,
        alignItems: AlignItems.center,
      ),
    ]),
    css('.footer_content_us', [
      css('&').styles(
          display: Display.flex,
          width: 30.percent,
          height: 100.percent,
          flexDirection: FlexDirection.column,
          justifyContent: JustifyContent.spaceBetween,
          color: Colors.white,
          fontSize: 18.px,
          fontWeight: FontWeight.w400)
    ]),
    css('.footer_input_email', [
      css('&').styles(
        display: Display.flex,
        width: 60.percent,
        height: 100.percent,
        padding: Padding.symmetric(horizontal: 40.px, vertical: 5.percent),
        radius: BorderRadius.circular(14.px),
        flexDirection: FlexDirection.row,
        justifyContent: JustifyContent.spaceBetween,
        alignItems: AlignItems.center,
        backgroundColor: AppColors.background292A32,
      ),
      css('.input_email').styles(
        width: 90.percent,
        height: 22.px,
        padding: Padding.symmetric(horizontal: 30.px, vertical: 22.px),
        border: Border(color: Colors.white, width: 2.px),
        radius: BorderRadius.circular(14.px),
        alignItems: AlignItems.center,
        color: Colors.white,
        fontSize: 18.px,
        fontWeight: FontWeight.w400,
        backgroundColor: Colors.transparent,
        raw: {'resize': 'none', "white-space": "nowrap", "overflow": "hidden"},
      ),
      css('.footer_button').styles(
          width: 40.percent,
          padding: Padding.symmetric(vertical: 20.px, horizontal: 35.px),
          radius: BorderRadius.circular(14.px),
          justifyContent: JustifyContent.center,
          alignItems: AlignItems.center,
          textAlign: TextAlign.center,
          fontSize: 20.px,
          fontWeight: FontWeight.w400,
          backgroundColor: AppColors.greenPrimary),
    ]),
    css.media(MediaQuery.screen(maxWidth: 1000.px), [
      css('.footer_block', [
        css('&').styles(
            flexDirection: FlexDirection.column,
            justifyContent: JustifyContent.spaceBetween,
            backgroundColor: AppColors.primaryColor)
      ]),
      css('.footer_header', [
        css('&').styles(
          flexDirection: FlexDirection.column,
          gap: Gap.all(20.px),
          textAlign: TextAlign.center,
        ),
      ]),
      css('.footer_body', [
        css('&').styles(
          width: 100.percent,
          flexDirection: FlexDirection.column,
          justifyContent: JustifyContent.spaceBetween,
        ),
      ]),
      css('.footer_content_us', [
        css('&').styles(
          width: 100.percent,
          alignItems: AlignItems.center,
          textAlign: TextAlign.center,
        )
      ]),
      css('.footer_input_email', [
        css('&').styles(
          width: 100.percent,
          padding:
              Padding.symmetric(horizontal: 2.percent, vertical: 5.percent),
          margin: Spacing.symmetric(vertical: 20.px),
        )
      ]),
      css('.input_email').styles(
        width: 0.percent,
      ),
      css.media(MediaQuery.screen(maxWidth: 600.px), [
        css('.footer_input_email', [
          css('&').styles(
            display: Display.flex,
            width: 100.percent,
            flexDirection: FlexDirection.column,
            gap: Gap.all(10.px),
          ),
          css('.input_email').styles(
            width: 80.percent,
          ),
        ]),
      ]),
    ]),
  ];
}
