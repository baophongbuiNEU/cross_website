import 'package:cross_website/components/common/size_box_component.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:cross_website/constants/image_constant.dart';
import 'package:cross_website/language/language_manager.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';

class ContactUsBlock extends StatefulComponent {
  const ContactUsBlock({super.key});

  @override
  State<ContactUsBlock> createState() => ContactUsBlockState();
}

class ContactUsBlockState extends State<ContactUsBlock> {
  int numSelected = 1;
  String textValue = '';
  String emailValue = '';
  String messageValue = '';

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final selectedLang = context.watch(selectedLanguageProvider);

    yield div(
      styles: Styles(
        width: 100.vw,
      ),
      [
        div(
          styles: Styles(
            display: Display.flex,
            margin: Margin.symmetric(horizontal: 5.percent),
            radius: BorderRadius.circular(45.px),
            flexDirection: FlexDirection.row,
            justifyContent: JustifyContent.spaceBetween,
            alignItems: AlignItems.center,
            backgroundColor: Color.hex('#F3F3F3'),
          ),
          [
            _detailComponent(selectedLang),
            div([
              img(
                classes: 'contact_image',
                src: Images.imageContactUsCard,
                height: 550,
              ),
            ]),
          ],
        ),
      ],
    );
  }

  Component _nameInput(String lang) {
    return div(
      styles: Styles(
        display: Display.flex,
        height: 92.px,
        flexDirection: FlexDirection.column,
        justifyContent: JustifyContent.spaceBetween,
      ),
      [
        text(LanguageManager.translate('contact_us_name_label', lang)),
        input(
          type: InputType.text,
          value: textValue,
          onInput: (e) => setState(() => textValue = e.value ?? ''),
          styles: Styles(
            height: 58.px,
            padding: Padding.symmetric(horizontal: 30.px),
            radius: BorderRadius.circular(14.px),
            color: AppColors.primaryColor,
            fontSize: 18.px,
            fontWeight: FontWeight.w400,
            backgroundColor: Colors.white,
          ),
          [],
        ),
      ],
    );
  }

  Component _emailInput(String lang) {
    return div(
      styles: Styles(
        display: Display.flex,
        height: 92.px,
        flexDirection: FlexDirection.column,
        justifyContent: JustifyContent.spaceBetween,
      ),
      [
        text(LanguageManager.translate('contact_us_email_label', lang)),
        input(
          type: InputType.text,
          value: emailValue,
          onInput: (e) => setState(() => emailValue = e.value ?? ''),
          styles: Styles(
            height: 58.px,
            padding: Padding.symmetric(horizontal: 30.px),
            radius: BorderRadius.circular(14.px),
            color: AppColors.primaryColor,
            fontSize: 18.px,
            fontWeight: FontWeight.w400,
            backgroundColor: Colors.white,
          ),
          [],
        ),
      ],
    );
  }

  Component _messageInput(String lang) {
    return div(
      styles: Styles(
        display: Display.flex,
        height: 223.px,
        flexDirection: FlexDirection.column,
        justifyContent: JustifyContent.spaceBetween,
      ),
      [
        text(LanguageManager.translate('contact_us_message_label', lang)),
        SizeBoxComponent(height: 6),
        textarea(
          onInput: (e) => setState(() => messageValue = e),
          styles: Styles(
            height: 170.px,
            padding: Padding.symmetric(horizontal: 30.px, vertical: 18.px),
            border: Border(color: AppColors.primaryColor, width: 2.px),
            radius: BorderRadius.circular(14.px),
            color: AppColors.primaryColor,
            fontSize: 18.px,
            fontWeight: FontWeight.w400,
            backgroundColor: Colors.white,
            raw: {'resize': 'none'},
          ),
          readonly: false,
          required: true,
          [],
        ),
      ],
    );
  }

  Component _detailComponent(String lang) {
    return div(classes: 'detail_text_field', [
      div(
        styles: Styles(
          display: Display.flex,
          height: 28.px,
          flexDirection: FlexDirection.row,
        ),
        [
          _radioComponent(
            value: LanguageManager.translate('contact_us_say_hi', lang),
            intValue: 1,
          ),
          SizeBoxComponent(width: 35),
          _radioComponent(
            value: LanguageManager.translate('contact_us_get_a_quote', lang),
            intValue: 2,
          ),
        ],
      ),
      SizeBoxComponent(height: 40),
      _nameInput(lang),
      SizeBoxComponent(height: 25),
      _emailInput(lang),
      SizeBoxComponent(height: 25),
      _messageInput(lang),
    ]);
  }

  Component _radioComponent({
    required String value,
    required int intValue,
  }) {
    return div(
      styles: Styles(
        display: Display.flex,
        flexDirection: FlexDirection.row,
      ),
      [
        button(
          styles: Styles(height: 28.px, border: Border.none),
          onClick: () => setState(() => numSelected = intValue),
          [
            div(
              styles: Styles(
                display: Display.flex,
                width: 20.px,
                height: 20.px,
                border: Border(color: AppColors.primaryColor, width: 1.px),
                radius: BorderRadius.circular(20.px),
                justifyContent: JustifyContent.center,
                alignItems: AlignItems.center,
              ),
              [
                div(
                  styles: Styles(
                    width: 14.px,
                    height: 14.px,
                    radius: BorderRadius.circular(12.px),
                    backgroundColor: intValue == numSelected
                        ? AppColors.greenPrimary
                        : Colors.white,
                  ),
                  [],
                ),
              ],
            ),
          ],
        ),
        SizeBoxComponent(width: 14),
        div(styles: Styles(fontSize: 18.px, fontWeight: FontWeight.w400), [
          Text(value),
        ]),
      ],
    );
  }

  @css
  static final style = [
    css('.detail_text_field', [
      css('&').styles(
        width: 45.percent,
        padding: Padding.only(top: 60.px, bottom: 60.px, left: 5.percent),
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: 700.px), [
      css('.contact_image', [
        css('&').styles(
          display: Display.none,
          width: 0.px,
          height: 0.px,
        ),
      ]),
      css('.detail_text_field', [
        css('&').styles(
          width: 100.percent,
          padding: Spacing.symmetric(horizontal: 5.percent),
        ),
      ]),
    ]),
  ];
}
