import 'package:jaspr/jaspr.dart';
import 'package:my_website/constants/app_colors.dart';
import 'package:my_website/constants/image_constant.dart';

import '../common/size_box_component.dart';

class FooterBlock extends StatelessComponent {
  const FooterBlock({
    super.key,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(styles: Styles(width: 100.vw), [
      div(classes: 'footer_block', [
        _header(),
        SizeBoxComponent(height: 20),
        _body(),
        SizeBoxComponent(height: 20),
        _footer(),
      ]),
    ]);
  }

  Component _header() {
    return div(classes: 'footer_header', [
      div(
          styles: Styles(
              display: Display.flex,
              flexDirection: FlexDirection.row,
              alignItems: AlignItems.center),
          [
            img(
                width: 30,
                height: 30,
                styles: Styles(raw: {"filter": "invert(1)"}),
                src: Images.imagePrimary),
            SizeBoxComponent(width: 6),
            div(
                styles: Styles(
                    color: Colors.white,
                    fontSize: 30.px,
                    fontWeight: FontWeight.w500),
                [Text("Positives")])
          ]),
      div(
          styles: Styles(
              display: Display.flex,
              flexDirection: FlexDirection.row,
              color: Colors.white,
              fontSize: 18.px,
              fontWeight: FontWeight.w400,
              textDecoration:
                  TextDecoration(line: TextDecorationLine.underline)),
          [
            Text("About us"),
            SizeBoxComponent(width: 40),
            Text("Services"),
            SizeBoxComponent(width: 40),
            Text("User Case"),
            SizeBoxComponent(width: 40),
            Text("Pricing"),
          ]),
      div(
          styles:
              Styles(display: Display.flex, flexDirection: FlexDirection.row),
          [
            img(src: Images.instagramIcon, height: 30, width: 30),
            SizeBoxComponent(width: 20),
            img(src: Images.facebookIcon, height: 30, width: 30),
            SizeBoxComponent(width: 20),
            img(src: Images.twitterIcon, height: 30, width: 30),
          ])
    ]);
  }

  Component _body() {
    return div(classes: 'footer_body', [
      _contentUs(),
      _inputEmail(),
    ]);
  }

  Component _contentUs() {
    return div(classes: 'footer_content_us', [
      div(
          styles: Styles(
              display: Display.flex,
              width: 120.px,
              padding: Padding.all(5.px),
              radius: BorderRadius.circular(14.px),
              flexWrap: FlexWrap.wrap,
              justifyContent: JustifyContent.center,
              color: Colors.black,
              backgroundColor: AppColors.greenPrimary),
          [Text("Contact us")]),
      SizeBoxComponent(height: 20),
      div([Text("Email: info@crosstech.com")]),
      SizeBoxComponent(height: 20),
      div([Text("Phone: 555-567-8901")]),
      SizeBoxComponent(height: 20),
      div([Text("Address: 1234 Main St Moonstone City, Stardust State 12345")]),
    ]);
  }

  Component _inputEmail() {
    return div(classes: 'footer_input_email', [
      textarea(
          placeholder: "Email",
          styles: Styles(
            width: 100.percent,
            height: 22.px,
            padding: Padding.symmetric(horizontal: 30.px, vertical: 22.px),
            border: Border(color: Colors.white, width: 2.px),
            radius: BorderRadius.circular(14.px),
            alignItems: AlignItems.center,
            color: Colors.white,
            fontSize: 18.px,
            fontWeight: FontWeight.w400,
            backgroundColor: Colors.transparent,
            raw: {
              'resize': 'none',
              "white-space": "nowrap",
              "overflow": "hidden"
            },
          ),
          []),
      SizeBoxComponent(width: 20),
      div(
          styles: Styles(
              width: 320.px,
              padding: Padding.symmetric(vertical: 20.px, horizontal: 35.px),
              radius: BorderRadius.circular(14.px),
              justifyContent: JustifyContent.center,
              alignItems: AlignItems.center,
              fontSize: 20.px,
              fontWeight: FontWeight.w400,
              backgroundColor: AppColors.greenPrimary),
          [Text("Subscribe to news")])
    ]);
  }

  Component _footer() {
    return div(
        styles: Styles(
            display: Display.flex,
            padding: Padding.only(top: 50.px),
            border:
                Border.only(top: BorderSide(width: 1.px, color: Colors.white)),
            color: Colors.white),
        [
          Text("© 2024 Crosstech. All Rights Reserved."),
          SizeBoxComponent(width: 40),
          Text("Privacy Policy")
        ]);
  }

  @css
  static final style = [
    css('.footer_block', [
      css('&').styles(
          display: Display.flex,
          padding: Padding.symmetric(horizontal: 60.px, vertical: 50.px),
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
        margin: Spacing.only(bottom: 20.px),
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
      )
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
    ]),
  ];
}
