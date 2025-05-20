import 'package:cross_website/components/home_page/footer_block.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:cross_website/constants/image_constant.dart';
import 'package:jaspr/jaspr.dart';

@client
class About extends StatelessComponent {
  const About({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
        styles: Styles(
            width: 100.vw,
            height: 100.percent,
            alignItems: AlignItems.center,
            color: AppColors.backgroundTheme),
        [
          div(
              styles: Styles(
                  display: Display.flex,
                  flexDirection: FlexDirection.column,
                  alignItems: AlignItems.start),
              [
                h1(
                    styles: Styles(color: AppColors.textBlack),
                    [text('Chúng tôi là ai?')]),
                p(styles: Styles(width: 95.vw, color: AppColors.textBlack), [
                  text(
                      'GMO-Z.com RUNSYSTEM, tiền thân là Công ty RUNSYSTEM, hoạt động trong ngành phát triển phần mềm, cung cấp các giải pháp và dịch vụ CNTT cho thị trường Việt Nam và Nhật Bản. Với phương châm “Chúng tôi làm việc vì nụ cười của bạn”, chúng tôi luôn cố gắng hết mình để cải thiện môi trường làm việc, công nghệ và quy trình nhằm tối đa hóa năng suất, cung cấp các sản phẩm chất lượng cao đạt tiêu chuẩn toàn cầu, mang lại giá trị lớn cho khách hàng và các thành viên của GMO-Z.com RUNSYSTEM.')
                ]),
              ]),
          img(
              styles: Styles(width: 100.vw, height: 80.percent),
              src: Images.crossTeambuilding),
          GoalComponent(
              icon: '🏆',
              title: 'Ước mơ',
              description: 'Trở thành số 1 trong ngành công nghiệp Internet'),
          GoalComponent(
              icon: '💡',
              title: 'Sứ mệnh',
              description:
                  'Cung cấp các giải pháp và dịch vụ CNTT chất lượng cao, đáp ứng nhu cầu của khách hàng và thị trường.'),
          GoalComponent(
              icon: '🤝',
              title: 'Triết lý',
              description:
                  'Mang đến trải nghiệm Internet phong phú, kiến tạo ra các nền văn hóa, ngành công nghệ số mới và cống hiến cho xã hội.'),
          h2([text('Giá trị cốt lõi')]),
          KeyValueComponent(
              title: 'Honest',
              description:
                  'Luôn đối xử chân thành với đồng nghiệp và khách hàng'),
          KeyValueComponent(
              title: 'Accountable',
              description:
                  'Luôn làm việc với tinh thần trách nhiệm cao, thực hiện đúng cam kết với khách hàng'),
          KeyValueComponent(
              title: 'Passionate',
              description:
                  'Nhiệt huyết với ước mơ đạt mục tiêu trở thành No.1 trong lĩnh vực của mình'),
          KeyValueComponent(
              title: 'Professional',
              description:
                  'Học hỏi và cải tiến liên tục, hướng tới một doanh nghiệp toàn cầu, được khách hàng đánh giá cao'),
          FooterBlock(),
        ]);
  }

  // @css
  // static final styles = [];
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
        styles: Styles(
            display: Display.flex,
            margin: Spacing.only(top: 1.rem),
            flexDirection: FlexDirection.column,
            alignItems: AlignItems.start),
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
              styles: Styles(width: 95.vw, color: AppColors.textBlack),
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
            margin: Spacing.only(top: 1.rem),
            flexDirection: FlexDirection.column,
            alignItems: AlignItems.start),
        [
          h2(
              classes: 'title',
              styles: Styles(color: AppColors.textBlack),
              [text(title)]),
          p(
              classes: 'description',
              styles: Styles(width: 95.vw, color: AppColors.textBlack),
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
