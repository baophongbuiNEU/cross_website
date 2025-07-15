import 'dart:convert';
import 'dart:developer';

import 'package:cross_website/components/common/size_box_component.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:cross_website/constants/image_constant.dart';
import 'package:cross_website/language/language_manager.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:http/http.dart' as http;

// @client
class ContactUsBlock extends StatefulComponent {
  const ContactUsBlock({super.key});

  @override
  State<ContactUsBlock> createState() => ContactUsBlockState();
}

class ContactUsBlockState extends State<ContactUsBlock> {
  late String emailValue;
  late String messageValue;
  bool isSubmitting = false;
  String? successMessage;

  @override
  void initState() {
    super.initState();
    emailValue = '';
    messageValue = '';
  }

  Future<void> _sendEmail(String lang) async {
    setState(() {
      isSubmitting = true;
      successMessage = null;
    });

    final serviceID = 'service_mne3r5y';
    final templateID = 'template_pit433e';
    final userID = '62KVCj5RnTx0gL3xO';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    try {
      final response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode(
            {
              'service_id': serviceID,
              'template_id': templateID,
              'user_id': userID,
              'template_params': {
                'from_email': emailValue,
                'message': messageValue,
              },
            },
          ));

      if (response.statusCode == 200) {
        // Handle success
        log('Email sent successfully');
        setState(() {
          // Reset form
          emailValue = '';
          messageValue = '';
          isSubmitting = false;
          successMessage =
              LanguageManager.translate('contact_us_success', lang);
        });

        // Auto hide success message after 5 seconds
        Future.delayed(Duration(seconds: 5), () {
          if (mounted) {
            setState(() {
              successMessage = null;
            });
          }
        });
      } else {
        // Handle error
        log('Failed to send email: \\${response.body}');
        setState(() {
          isSubmitting = false;
          successMessage =
              LanguageManager.translate('contact_us_failure', lang);
        });
      }
    } catch (error) {
      log('Error sending email: \\$error');
      setState(() {
        isSubmitting = false;
        successMessage = 'Có lỗi xảy ra. Vui lòng thử lại!';
      });
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final selectedLang =
        context.watch(LanguageManager.selectedLanguageProvider);

    yield div(
      id: 'contact',
      styles: Styles(
        maxWidth: 100.percent,
      ),
      [
        div(
          styles: Styles(
            display: Display.flex,
            padding: Padding.symmetric(horizontal: 5.percent),
            margin: Margin.symmetric(horizontal: 5.percent),
            radius: BorderRadius.circular(45.px),
            flexDirection: FlexDirection.row,
            justifyContent: JustifyContent.spaceAround,
            alignItems: AlignItems.center,
            backgroundColor: Color('#F3F3F3'),
          ),
          [
            _detailComponent(selectedLang),
            div(styles: Styles(), [
              img(
                classes: 'contact_image',
                src: Images.shakeHandsImage,
                height: 300,
              ),
            ]),
          ],
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
        span([
          text(LanguageManager.translate('contact_us_email_label', lang)),
          span(styles: Styles(color: Colors.red), [text(' *')])
        ]),
        input(
          type: InputType.text,
          value: emailValue,
          onInput: (value) {
            log('Email input changed: $value');
            setState(() => emailValue = value);
            log('Email value after setState: $emailValue');
          },
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
      ),
      [
        span([
          text(LanguageManager.translate('contact_us_message_label', lang)),
          span(styles: Styles(color: Colors.red), [text(' *')])
        ]),
        SizeBoxComponent(height: 16),
        textarea(attributes: {
          'value': messageValue,
        }, onInput: (value) {
          log('Message input changed: $value');
          setState(() {
            messageValue = value;
            value = '';
          });
          log('Message value after setState: $messageValue');
        },
            styles: Styles(
              height: 170.px,
              padding: Padding.symmetric(horizontal: 30.px, vertical: 18.px),
              border: Border(color: AppColors.primaryColor, width: 2.px),
              radius: BorderRadius.circular(14.px),
              color: AppColors.primaryColor,
              fontSize: 18.px,
              fontWeight: FontWeight.w400,
              backgroundColor: Colors.white,
              raw: {
                'resize': 'none',
                'white-space': 'pre-wrap',
                'word-wrap': 'break-word',
                'overflow-y': 'auto',
                'vertical-align': 'top',
              },
            ),
            []),
      ],
    );
  }

  Component _detailComponent(String lang) {
    return div(classes: 'detail_text_field', [
      _emailInput(lang),
      SizeBoxComponent(height: 25),
      _messageInput(lang),
      SizeBoxComponent(height: 20),
      // Success/Error message
      if (successMessage != null)
        div(
          styles: Styles(
            padding: Padding.all(15.px),
            margin: Margin.only(bottom: 20.px),
            radius: BorderRadius.circular(8.px),
            backgroundColor: successMessage ==
                    LanguageManager.translate('contact_us_success', lang)
                ? AppColors.greenPrimary
                : Color('#ff6b6b'),
          ),
          [
            div(
              styles: Styles(
                color: successMessage ==
                        LanguageManager.translate('contact_us_success', lang)
                    ? AppColors.primaryColor
                    : Colors.white,
                textAlign: TextAlign.center,
                fontSize: 16.px,
                fontWeight: FontWeight.w500,
              ),
              [text(successMessage!)],
            ),
          ],
        ),
      SizeBoxComponent(height: 20),
      button(
        styles: Styles(
          width: 100.percent,
          height: 58.px,
          radius: BorderRadius.circular(14.px),
          cursor: isSubmitting ? Cursor.notAllowed : Cursor.pointer,
          color: Colors.white,
          fontSize: 18.px,
          fontWeight: FontWeight.w500,
          backgroundColor:
              isSubmitting ? Color('#cccccc') : AppColors.greenPrimary,
        ),
        onClick: isSubmitting
            ? null
            : () {
                log('Submit clicked!');
                log('Email: $emailValue');
                log('Message: $messageValue');

                if (emailValue.isNotEmpty && messageValue.isNotEmpty) {
                  log('All fields filled, sending email...');
                  _sendEmail(lang);
                  setState(() => messageValue = '');
                } else {
                  log('Some fields are empty!');
                  setState(() {
                    successMessage = LanguageManager.translate(
                        'contact_us_uncomplete', lang);
                  });
                  // Auto hide error message after 3 seconds
                  Future.delayed(Duration(seconds: 3), () {
                    if (mounted) {
                      setState(() {
                        successMessage = null;
                      });
                    }
                  });
                }
              },
        [
          text(LanguageManager.translate('contact_us_issubmit', lang)),
        ],
      ),
    ]);
  }

  @css
  static List<StyleRule> get style => [
        css('.detail_text_field', [
          css('&').styles(
            width: 45.percent,
            padding: Padding.only(top: 60.px, bottom: 60.px),
          ),
        ]),
        css.media(MediaQuery.screen(maxWidth: 900.px), [
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
