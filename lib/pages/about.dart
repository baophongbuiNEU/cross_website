import 'package:cross_website/components/common/divider.dart';
import 'package:cross_website/components/common/size_box_component.dart';
import 'package:cross_website/components/home_page/footer_block.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:cross_website/constants/image_constant.dart';
import 'package:cross_website/language/language_manager.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';

@client
class About extends StatelessComponent {
  const About({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final selectedLang =
        context.watch(LanguageManager.selectedLanguageProvider);

    yield section(
        styles: Styles(
            width: 100.vw,
            height: 100.percent,
            alignItems: AlignItems.center,
            color: AppColors.backgroundTheme),
        [
          div(classes: 'about_title_div', [
            h1(
                classes: 'about_title',
                styles: Styles(color: AppColors.textBlack),
                [
                  text(LanguageManager.translate('about_title', selectedLang)),
                ]),
            SizeBoxComponent(width: 50, height: 200),
            p(
                classes: 'about_description',
                styles: Styles(width: 95.vw, color: AppColors.textBlack),
                [
                  text(LanguageManager.translate(
                      'about_description', selectedLang)),
                ]),
          ]),
          img(
              styles: Styles(width: 90.percent, height: 80.percent),
              src: Images.crossTeambuilding),
          SizeBoxComponent(height: 30),
          div(classes: 'goal_div', [
            GoalComponent(
                icon: '🏆',
                title: LanguageManager.translate(
                    'about_goal_vision_title', selectedLang),
                description: LanguageManager.translate(
                    'about_goal_vision_description', selectedLang)),
            GoalComponent(
                icon: '💡',
                title: LanguageManager.translate(
                    'about_goal_mission_title', selectedLang),
                description: LanguageManager.translate(
                    'about_goal_mission_description', selectedLang)),
            GoalComponent(
                icon: '🤝',
                title: LanguageManager.translate(
                    'about_goal_philosophy_title', selectedLang),
                description: LanguageManager.translate(
                    'about_goal_philosophy_description', selectedLang)),
          ]),
          SizeBoxComponent(height: 40),
          Divider(),
          SizeBoxComponent(height: 20),
          div(classes: 'key_value_overall', [
            div(classes: 'key_value_title', [
              h1(
                  styles: Styles(
                    display: Display.flex,
                    flexWrap: FlexWrap.wrap,
                    color: AppColors.textBlack,
                  ),
                  [
                    text(LanguageManager.translate(
                        'about_key_value_title', selectedLang)),
                  ]),
            ]),
            div(classes: 'key_value_div', [
              KeyValueComponent(
                  title: LanguageManager.translate(
                      'about_key_value_honesty_title', selectedLang),
                  description: LanguageManager.translate(
                      'about_key_value_honesty_description', selectedLang)),
              KeyValueComponent(
                  title: LanguageManager.translate(
                      'about_key_value_responsibility_title', selectedLang),
                  description: LanguageManager.translate(
                      'about_key_value_responsibility_description',
                      selectedLang)),
              KeyValueComponent(
                  title: LanguageManager.translate(
                      'about_key_value_passion_title', selectedLang),
                  description: LanguageManager.translate(
                      'about_key_value_passion_description', selectedLang)),
              KeyValueComponent(
                  title: LanguageManager.translate(
                      'about_key_value_professionalism_title', selectedLang),
                  description: LanguageManager.translate(
                      'about_key_value_professionalism_description',
                      selectedLang)),
              KeyValueComponent(
                  title: LanguageManager.translate(
                      'about_key_value_smile_title', selectedLang),
                  description: LanguageManager.translate(
                      'about_key_value_smile_description', selectedLang)),
            ]),
          ]),
          Divider(),
          div(
            classes: 'culture-section',
            styles: Styles(
              display: Display.flex,
              width: 95.percent,
              flexDirection: FlexDirection.row,
              justifyContent: JustifyContent.start,
              alignItems: AlignItems.stretch,
              gap: Gap(column: 1.rem),
            ),
            [
              div(classes: 'culture_title', [
                h1(
                  styles: Styles(
                    display: Display.flex,
                    width: 150.percent,
                    justifyContent: JustifyContent.start,
                    alignItems: AlignItems.start,
                    alignSelf: AlignSelf.start,
                    color: AppColors.textBlack,
                  ),
                  [
                    text(LanguageManager.translate(
                        'about_culture_title', selectedLang)),
                  ],
                ),
              ]),
              div(classes: 'culture_content', [
                p(
                  styles: Styles(
                    display: Display.flex,
                    justifyContent: JustifyContent.center,
                    alignItems: AlignItems.center,
                    color: AppColors.textBlack,
                  ),
                  [
                    text(LanguageManager.translate(
                        'about_culture_description', selectedLang)),
                  ],
                ),
              ]),
            ],
          ),
          FooterBlock(),
        ]);
  }

  @css
  static final styles = [
    css('.about_title_div', [
      css('&').styles(
        display: Display.flex,
        width: 90.percent,
        flexDirection: FlexDirection.row,
        justifyContent: JustifyContent.center,
        alignItems: AlignItems.center,
      ),
    ]),
    css('.goal_div', [
      css('&').styles(
        display: Display.flex,
        width: 95.percent,
        flexWrap: FlexWrap.wrap,
        justifyContent: JustifyContent.center,
        alignItems: AlignItems.stretch,
        gap: Gap(column: 1.rem),
      ),
    ]),
    css('.key_value_overall', [
      css('&').styles(
          display: Display.flex,
          width: 95.percent,
          flexDirection: FlexDirection.row,
          justifyContent: JustifyContent.start,
          alignItems: AlignItems.stretch,
          gap: Gap(column: 1.rem)),
      css('.key_value_title', [
        css('&').styles(
          display: Display.flex,
          width: 150.percent,
          justifyContent: JustifyContent.start,
          alignItems: AlignItems.start,
          alignSelf: AlignSelf.start,
        ),
      ]),
    ]),
    css('.key_value_div', [
      css('&').styles(
        // width: 70.percent,
        justifyContent: JustifyContent.center,
        alignItems: AlignItems.center,
      ),
    ]),
    css('.culture-section', [
      css('&').styles(
        display: Display.flex,
        width: 95.percent,
        flexDirection: FlexDirection.row,
        justifyContent: JustifyContent.start,
        alignItems: AlignItems.stretch,
        gap: Gap(column: 1.rem),
      ),
      css('.culture_title', [
        css('&').styles(
          display: Display.flex,
          width: 265.percent,
          justifyContent: JustifyContent.start,
          alignItems: AlignItems.start,
          alignSelf: AlignSelf.start,
        ),
      ]),
      css('.culture_content', [
        css('&').styles(
          justifyContent: JustifyContent.center,
          alignItems: AlignItems.center,
        ),
      ]),
    ]),
  ];
}

class GoalComponent extends StatelessComponent {
  final String icon;
  final String title;
  final String description;
  const GoalComponent(
      {required this.icon,
      required this.title,
      required this.description,
      super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
        classes: 'goal-component',
        styles: Styles(
          display: Display.flex,
          flexDirection: FlexDirection.column,
          flexWrap: FlexWrap.wrap,
          alignItems: AlignItems.start,
          flex: Flex(grow: 1, basis: FlexBasis(300.px)),
        ),
        [
          h2(classes: 'icon', [
            text(icon),
          ]),
          h2(
              classes: 'title',
              styles: Styles(color: AppColors.textBlack),
              [text(title)]),
          p(
              classes: 'description',
              styles: Styles(color: AppColors.textBlack),
              [text(description)]),
        ]);
  }

  @css
  static final styles = [
    css('.icon', [
      css('&').styles(
        padding: Spacing.all(0.px),
        margin: Spacing.all(0.px),
        fontSize: 30.px,
      ),
    ]),
    css('.title', [
      css('&').styles(
        padding: Spacing.all(0.px),
        margin: Spacing.only(bottom: 0.px),
      ),
    ]),
    css('.description', [
      css('&').styles(
        padding: Spacing.all(0.px),
        margin: Spacing.only(bottom: 0.px),
      ),
    ]),
  ];
}

class KeyValueComponent extends StatelessComponent {
  final String title;
  final String description;
  const KeyValueComponent(
      {required this.title, required this.description, super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
        styles: Styles(
            display: Display.flex,
            margin: Spacing.only(bottom: 1.rem),
            flexDirection: FlexDirection.column,
            alignItems: AlignItems.start),
        [
          h2(
              classes: 'title',
              styles: Styles(color: AppColors.textBlack),
              [text(title)]),
          p(
              classes: 'description',
              styles: Styles(color: AppColors.textBlack),
              [text(description)]),
        ]);
  }

  @css
  static final styles = [
    css('.icon', [
      css('&').styles(
        padding: Spacing.all(0.px),
        margin: Spacing.all(0.px),
        fontSize: 30.px,
      ),
    ]),
    css('.title', [
      css('&').styles(
        padding: Spacing.all(0.px),
        margin: Spacing.only(bottom: 0.px),
      ),
    ]),
    css('.description', [
      css('&').styles(
        padding: Spacing.all(0.px),
        margin: Spacing.only(bottom: 0.px),
      ),
    ]),
  ];
}
