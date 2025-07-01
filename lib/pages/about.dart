import 'package:jaspr/jaspr.dart';

@client
class About extends StatelessComponent {
  const About({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'runsystem-page', [
      // Main content container
      div(classes: 'main-container', [
        // Company introduction with banner
        _buildCompanyIntro(),

        // Three icon sections (Vision, Mission, Philosophy)
        _buildVisionMissionPhilosophy(),

        // Core Values section
        _buildCoreValues(),

        // Culture section
        _buildCultureSection(),
      ])
    ]);
  }

  Component _buildCompanyIntro() {
    return section(classes: 'company-intro-section', [
      div(classes: 'container', [
        div(classes: 'company-content', [
          h1(classes: 'page-title', [text('Chúng Tôi Là Ai?')]),
          div(classes: 'company-text', [
            p(classes: 'company-description', [
              text(
                  'GMO-Z.com RUNSYSTEM, tiền thân là Công ty RUNSYSTEM, hoạt động trong ngành phát triển phần mềm, cung cấp các giải pháp và dịch vụ CNTT cho thị trường Việt Nam và Nhật Bản. Với phương châm "Chúng tôi làm việc vì nụ cười của bạn", chúng tôi luôn cố gắng hết mình để cải thiện môi trường làm việc, công nghệ và quy trình nhằm tối đa hóa năng suất, cung cấp các sản phẩm chất lượng cao đạt tiêu chuẩn toàn cầu, mang lại giá trị lớn cho khách hàng và các thành viên của GMO-Z.com RUNSYSTEM.')
            ]),
            div(classes: 'company-profile-btn', [
              button(classes: 'profile-button', [text('Hồ sơ công ty')])
            ])
          ]),
          // div(classes: 'company-banner', [
          //   img(
          //       src:
          //           'https://runsystem.net/themes/custom/runsystem/images/banner.png',
          //       alt: 'Company Banner',
          //       classes: 'banner-image')
          // ])
        ])
      ])
    ]);
  }

  Component _buildVisionMissionPhilosophy() {
    return section(classes: 'vision-mission-section', [
      div(classes: 'container', [
        div(classes: 'vision-grid', [
          _buildVisionCard(
              'https://runsystem.net/themes/custom/runsystem/images/service_icon1.svg',
              'Ước mơ',
              'Trở thành số 1 trong ngành công nghiệp Internet'),
          _buildVisionCard(
              'https://runsystem.net/themes/custom/runsystem/images/service_icon2.svg',
              'Sứ mệnh',
              'Tập trung nguồn lực phát triển công nghệ và cơ sở hạ tầng Internet để nâng cao chất lượng sản phẩm, dịch vụ và mang lại nụ cười, sự cảm kích cho khách hàng'),
          _buildVisionCard(
              'https://runsystem.net/themes/custom/runsystem/images/service_icon3.svg',
              'Triết lý',
              'Mang đến trải nghiệm Internet phong phú, kiến tạo ra các nền văn hóa, ngành công nghệ số mới và cống hiến cho xã hội'),
        ])
      ])
    ]);
  }

  Component _buildVisionCard(String iconUrl, String title, String description) {
    return div(classes: 'vision-card', [
      div(
          classes: 'vision-icon',
          [img(src: iconUrl, alt: title, classes: 'icon-image')]),
      h3(classes: 'vision-title', [text(title)]),
      p(classes: 'vision-description', [text(description)])
    ]);
  }

  Component _buildCoreValues() {
    return section(classes: 'core-values-section', [
      div(classes: 'container', [
        h2(classes: 'section-title', [text('Giá trị cốt lõi')]),
        div(classes: 'values-grid', [
          _buildValueItem(
              'Honest', 'Luôn đối xử chân thành với đồng nghiệp và khách hàng'),
          _buildValueItem('Accountable',
              'Luôn làm việc với tinh thần trách nhiệm cao, thực hiện đúng cam kết với khách hàng'),
          _buildValueItem('Passionate',
              'Nhiệt huyết với ước mơ đạt mục tiêu trở thành No.1 trong lĩnh vực của mình'),
          _buildValueItem('Professional',
              'Học hỏi và cải tiến liên tục, hướng tới một doanh nghiệp toàn cầu, được khách hàng đánh giá cao'),
          _buildValueItem('Work for your smile',
              '"Bạn" bao gồm đồng nghiệp, khách hàng và các bên liên quan. Mục đích hoạt động của công ty là mang lại nụ cười cho khách hàng, nhận được sự đánh giá cao của họ và mang lại hạnh phúc cho nhân viên. Đây là một trong những giá trị tinh thần cốt lõi mà công ty luôn muốn tạo dựng, bởi chúng tôi hiểu rằng chỉ có tinh thần vui vẻ, lạc quan và nhiệt huyết thì chúng ta mới có thể sống và làm việc hiệu quả.'),
        ])
      ])
    ]);
  }

  Component _buildValueItem(String title, String description) {
    return div(classes: 'value-item', [
      h4(classes: 'value-title', [text(title)]),
      p(classes: 'value-description', [text(description)])
    ]);
  }

  Component _buildCultureSection() {
    return section(classes: 'culture-section', [
      div(classes: 'container', [
        h2(classes: 'section-title', [text('Văn hóa')]),
        div(classes: 'culture-content', [
          p(classes: 'culture-text', [
            text(
                'GMO-Z.com RUNSYSTEM luôn nỗ lực kiến tạo môi trường làm việc Nhật – Việt, trẻ trung, thân thiện, năng động, giàu văn hóa căn cước. GMO-Z.com RUNSYSTEM tôn trọng giá trị của con người và coi con người là tài sản quý giá nhất, vì vậy công ty luôn cố gắng tạo ra và mang lại những chính sách thuận lợi nhất cho hội viên.')
          ])
        ])
      ])
    ]);
  }

  @css
  static List<StyleRule> get styles => [
        // Global reset
        css('*').styles(
          margin: Spacing.zero,
          padding: Spacing.zero,
          raw: {
            'box-sizing': 'border-box',
          },
        ), // Main page wrapper
        css('.runsystem-page').styles(
          fontFamily: const FontFamily.list(
              [FontFamily('Space Grotesk'), FontFamilies.andaleMono]),
          fontSize: 14.px,
          //
          color: Color('#333333'),
          backgroundColor: Color('#ffffff'),
        ),

        // Container
        css('.container').styles(
          maxWidth: 100.percent,
          margin: Spacing.symmetric(horizontal: Unit.auto),
          padding: Spacing.symmetric(horizontal: 15.px),
        ),

        // Page title
        css('.page-title-section').styles(
          padding: Spacing.symmetric(vertical: 30.px),
          textAlign: TextAlign.center,
        ),

        css('.page-title').styles(
          fontSize: 60.px,
          fontWeight: FontWeight.bold,
          color: Color('#333333'),
          margin: Spacing.zero,
        ),

        // Company intro section
        css('.company-intro-section').styles(
          padding: Spacing.symmetric(vertical: 40.px, horizontal: 100.px),
          backgroundColor: Color('#ffffff'),
        ),

        css('.company-content').styles(
          display: Display.flex,
          flexDirection: FlexDirection.row,
          alignItems: AlignItems.center,
          justifyContent: JustifyContent.spaceEvenly,
          gap: Gap.all(40.px),
        ),

        css('.company-text').styles(
          maxWidth: 60.percent,
          flex: Flex(grow: 1),
        ),

        css('.company-description').styles(
          fontSize: 18.px,
          color: Color('#555555'),
          margin: Spacing.only(bottom: 25.px),
        ),

        css('.company-profile-btn').styles(
          margin: Spacing.only(top: 20.px),
        ),
        css('.profile-button').styles(
          backgroundColor: Color('#007bff'),
          color: Colors.white,
          border: Border.none,
          padding: Spacing.symmetric(horizontal: 20.px, vertical: 10.px),
          radius: BorderRadius.circular(4.px),
          fontSize: 14.px,
          cursor: Cursor.pointer,
          raw: {
            'transition': 'background-color 0.3s ease',
          },
        ),

        css('.profile-button:hover').styles(
          backgroundColor: Color('#0056b3'),
        ),

        css('.company-banner').styles(
          flex: Flex(shrink: 0),
          width: 400.px,
        ),

        css('.banner-image').styles(
          width: 100.percent,
          height: Unit.auto,
          radius: BorderRadius.circular(8.px),
        ),

        // Vision Mission Philosophy section
        css('.vision-mission-section').styles(
          padding: Spacing.symmetric(vertical: 50.px),
          backgroundColor: Color('#f8f9fa'),
        ),

        css('.vision-grid').styles(
          display: Display.grid,
          gap: Gap.all(30.px),
          raw: {
            'grid-template-columns': 'repeat(auto-fit, minmax(300px, 1fr))',
          },
        ),

        css('.vision-card').styles(
          backgroundColor: Colors.white,
          padding: Spacing.all(30.px),
          radius: BorderRadius.circular(8.px),
          textAlign: TextAlign.center,
          raw: {
            'box-shadow': '0 2px 10px rgba(0,0,0,0.1)',
          },
        ),

        css('.vision-icon').styles(
          margin: Spacing.only(bottom: 20.px),
        ),

        css('.icon-image').styles(
          width: 60.px,
          height: 60.px,
        ),

        css('.vision-title').styles(
          fontSize: 20.px,
          fontWeight: FontWeight.bold,
          color: Color('#333333'),
          margin: Spacing.only(bottom: 15.px),
        ),

        css('.vision-description').styles(
          fontSize: 15.px,
          color: Color('#666666'),
        ),

        // Core Values section
        css('.core-values-section').styles(
          padding: Spacing.symmetric(vertical: 50.px),
          backgroundColor: Colors.white,
        ),

        css('.section-title').styles(
          fontSize: 28.px,
          fontWeight: FontWeight.bold,
          color: Color('#333333'),
          textAlign: TextAlign.center,
          margin: Spacing.only(bottom: 40.px),
        ),

        css('.values-grid').styles(
          display: Display.flex,
          flexDirection: FlexDirection.column,
          gap: Gap.all(25.px),
        ),
        css('.value-item').styles(
          padding: Spacing.only(bottom: 20.px),
          raw: {
            'border-bottom': '1px solid #e9ecef',
          },
        ),

        css('.value-title').styles(
          fontSize: 18.px,
          fontWeight: FontWeight.bold,
          color: Color('#007bff'),
          margin: Spacing.only(bottom: 10.px),
        ),

        css('.value-description').styles(
          fontSize: 15.px,
          //
          color: Color('#555555'),
        ),

        // Culture section
        css('.culture-section').styles(
          padding: Spacing.symmetric(vertical: 50.px),
          backgroundColor: Color('#f8f9fa'),
        ),

        css('.culture-text').styles(
          fontSize: 16.px,
          //
          color: Color('#555555'),
          textAlign: TextAlign.center,
          maxWidth: 800.px,
          margin: Spacing.symmetric(horizontal: Unit.auto),
        ),

        // Responsive design
        css.media(MediaQuery.screen(maxWidth: 768.px), [
          css('.company-content').styles(
            flexDirection: FlexDirection.column,
          ),
          // Company intro section
          css('.company-intro-section').styles(
            padding: Spacing.symmetric(horizontal: 10.px),
          ),
          css('.company-text').styles(
            maxWidth: 100.percent,
          ),
          css('.company-banner').styles(
            width: 100.percent,
          ),
          css('.vision-grid').styles(
            raw: {
              'grid-template-columns': '1fr',
            },
          ),
          css('.office-grid').styles(
            raw: {
              'grid-template-columns': '1fr',
            },
          ),
          css('.page-title').styles(
            fontSize: 28.px,
          ),
          css('.section-title').styles(
            fontSize: 24.px,
          ),
        ]),

        css.media(MediaQuery.screen(maxWidth: 480.px), [
          css('.container').styles(
            padding: Spacing.symmetric(horizontal: 10.px),
          ),
          css('.vision-card').styles(
            padding: Spacing.all(20.px),
          ),
          css('.office-info').styles(
            padding: Spacing.all(15.px),
          ),
        ]),
      ];
}
