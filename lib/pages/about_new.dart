import 'package:cross_website/components/common/custom_grid.dart';
import 'package:cross_website/components/home_page/footer_block.dart';
import 'package:cross_website/constants/app_colors.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:cross_website/language/language_manager.dart';

@client
class AboutNew extends StatefulComponent {
  const AboutNew({super.key});
  @css
  static List<StyleRule> get styles => [
        css(':root').styles(
          raw: {
            '--primary-cyan': '#35daff',
            '--primary-blue': '#3b82f6',
            '--primary-purple': '#a855f7',
            '--gray-50': '#f9fafb',
            '--gray-100': '#f3f4f6',
            '--gray-200': '#e5e7eb',
            '--gray-300': '#d1d5db',
            '--gray-400': '#9ca3af',
            '--gray-500': '#6b7280',
            '--gray-600': '#4b5563',
            '--gray-700': '#374151',
            '--gray-800': '#1f2937',
            '--gray-900': '#111827',
            '--white': '#ffffff',
          },
        ),

        css('*').styles(
          margin: Spacing.zero,
          padding: Spacing.zero,
          raw: {
            'box-sizing': 'border-box',
          },
        ),
        css('.about-new-page').styles(
          fontFamily: FontFamily.list([
            FontFamily('Space Grotesk'),
            FontFamilies.sansSerif,
          ]),
          // lineHeight: 1.6,
          color: AppColors.textBlack,
          backgroundColor: AppColors.backgroundTheme,
        ),

        css('.container').styles(
          maxWidth: 1200.px,
          margin: Spacing.symmetric(horizontal: Unit.auto),
          padding: Spacing.symmetric(horizontal: 16.px),
          alignItems: AlignItems.center,
          justifyContent: JustifyContent.center,
          alignSelf: AlignSelf.center,
        ),

        // Hero Section
        css('.hero').styles(
          padding: Spacing.symmetric(vertical: 80.px),
          alignItems: AlignItems.center,
          justifyContent: JustifyContent.center,
          textAlign: TextAlign.center,
          // raw: {
          //   'background': 'linear-gradient(135deg, #f0fdff, #eff6ff, #faf5ff)',
          // },
          raw: {
            'background': 'var(--gradientBackground)',
          },
        ),

        css('.hero-title').styles(
          fontWeight: FontWeight.w800,
          margin: Spacing.only(bottom: 24.px),
          // lineHeight: 1.2,
          raw: {
            'font-size': 'clamp(2.5rem, 5vw, 4rem)',
            'background':
                'linear-gradient(135deg, var(--primary-cyan), var(--primary-blue), var(--primary-purple))',
            '-webkit-background-clip': 'text',
            'background-clip': 'text',
            '-webkit-text-fill-color': 'transparent',
          },
        ),

        css('.hero-subtitle').styles(
          color: Color('var(--gray-700)'),
          maxWidth: 768.px,
          margin:
              Spacing.only(left: Unit.auto, right: Unit.auto, bottom: 16.px),
          raw: {
            'font-size': 'clamp(1.25rem, 3vw, 1.5rem)',
          },
        ),
        css('.hero-description').styles(
          fontSize: 18.px,
          color: Color('var(--gray-600)'),
          maxWidth: 512.px,
          margin:
              Spacing.only(left: Unit.auto, right: Unit.auto, bottom: 32.px),
        ),

        // Section Styles
        css('.section').styles(
          padding: Spacing.symmetric(vertical: 80.px),
        ),
        css('.section-alt').styles(
          raw: {
            'background': 'var(--sectionAltBackground)',
          },
        ),

        css('.section-header').styles(
          textAlign: TextAlign.center,
          margin: Spacing.only(bottom: 64.px),
        ),
        css('.section-title').styles(
          fontSize: 40.px,
          fontWeight: FontWeight.w800,
          margin: Spacing.only(bottom: 16.px),
          color: AppColors.textBlack,
        ),

        css('.section-subtitle').styles(
          fontSize: 20.px,
          color: Color('var(--gray-600)'),
        ),

        // Grid Layouts
        css('.grid').styles(
          display: Display.grid,
          gap: Gap.all(32.px),
        ),

        css('.grid-2').styles(
          raw: {
            'grid-template-columns': 'repeat(auto-fit, minmax(300px, 1fr))',
          },
        ),

        css('.grid-3').styles(
          raw: {
            'grid-template-columns': 'repeat(auto-fit, minmax(250px, 1fr))',
          },
        ),

        // Description Text
        css('.description-text').styles(
          fontSize: 18.px,
          // color: Color('var(--gray-600)'),
          color: AppColors.textBlack,
          // lineHeight: 1.8,
          margin: Spacing.only(bottom: 24.px),
        ),

        css('.space-y').styles(
          raw: {
            '> * + *': 'margin-top: 1.5rem',
          },
        ),

        // Image Styles
        css('.image-container').styles(
          position: Position.relative(),
        ),

        css('.team-image, .culture-image').styles(
          width: 100.percent,
          height: 400.px,
          radius: BorderRadius.circular(16.px),
          raw: {
            'object-fit': 'cover',
            'box-shadow': '0 20px 25px -5px rgba(0, 0, 0, 0.1)',
          },
        ),

        css('.image-overlay').styles(
          position: Position.absolute(
            top: 0.px,
            left: 0.px,
            right: 0.px,
            bottom: 0.px,
          ),
          radius: BorderRadius.circular(16.px),
          raw: {
            'background':
                'linear-gradient(135deg, rgba(53, 218, 255, 0.2), rgba(59, 130, 246, 0.2))',
          },
        ),

        css('.purple-overlay').styles(
          raw: {
            'background':
                'linear-gradient(135deg, rgba(53, 218, 255, 0.2), rgba(168, 85, 247, 0.2))',
          },
        ),

        // Stats Grid
        css('.stats-grid').styles(
          display: Display.grid,
          gap: Gap.all(32.px),
          margin: Spacing.only(top: 32.px),
          raw: {
            'grid-template-columns': 'repeat(auto-fit, minmax(200px, 1fr))',
          },
        ),

        css('.stat-card').styles(
          textAlign: TextAlign.center,
          padding: Spacing.all(24.px),
        ),

        css('.stat-icon').styles(
          fontSize: 48.px,
          margin: Spacing.only(bottom: 16.px),
        ),

        css('.stat-number').styles(
          fontSize: 40.px,
          fontWeight: FontWeight.w800,
          color: Color('var(--primary-cyan)'),
          margin: Spacing.only(bottom: 8.px),
        ),

        css('.stat-label').styles(
          color: Color('var(--gray-600)'),
          fontWeight: FontWeight.w600,
        ), // Cards
        css('.card').styles(
          // backgroundColor: Colors.white,
          padding: Spacing.all(32.px),
          radius: BorderRadius.circular(16.px),
          // border: Border(width: 1.px, color: Color('var(--gray-200)')),
          raw: {
            'background': 'var(--cardBackground)',
            'border': '1px solid var(--cardBorder)',
            'backdrop-filter': 'blur(10px)',
            'box-shadow': '0 10px 15px -3px rgba(0, 0, 0, 0.1)',
            'transition': 'all 0.3s ease',
          },
        ),

        css('.card:hover').styles(
          raw: {
            'transform': 'translateY(-5px)',
            'box-shadow': '0 20px 25px -5px rgba(53, 218, 255, 0.3)',
          },
        ),

        css('.card-center').styles(
          textAlign: TextAlign.center,
        ),

        css('.card-icon').styles(
          width: 64.px,
          height: 64.px,
          radius: BorderRadius.circular(50.px),
          display: Display.flex,
          alignItems: AlignItems.center,
          justifyContent: JustifyContent.center,
          margin:
              Spacing.only(bottom: 24.px, left: Unit.auto, right: Unit.auto),
          fontSize: 32.px,
        ),

        css('.card-icon-cyan').styles(
          raw: {
            'background': 'linear-gradient(135deg, #ccf7fe, #99effd)',
          },
        ),

        css('.card-icon-purple').styles(
          raw: {
            'background': 'linear-gradient(135deg, #f3e8ff, #e9d5ff)',
          },
        ),

        css('.card-icon-blue').styles(
          raw: {
            'background': 'linear-gradient(135deg, #dbeafe, #bfdbfe)',
          },
        ),
        css('.card-icon-green').styles(
          raw: {
            'background': 'linear-gradient(135deg, #dcfce7, #bbf7d0)',
          },
        ),

        css('.card-icon-pink').styles(
          raw: {
            'background': 'linear-gradient(135deg, #fce7f3, #fbcfe8)',
          },
        ),
        css('.card-title').styles(
          fontSize: 20.px,
          fontWeight: FontWeight.w700,
          margin: Spacing.only(bottom: 16.px),
          color: AppColors.textBlack,
        ),

        css('.cyan-text').styles(
          color: Color('var(--primary-cyan)'),
        ),

        css('.purple-text').styles(
          color: Color('var(--primary-purple)'),
        ),

        css('.blue-text').styles(
          color: Color('var(--primary-blue)'),
        ),
        css('.green-text').styles(
          color: Color('#059669'),
        ),

        css('.pink-text').styles(
          color: Color('#ec4899'),
        ),
        css('.card-description').styles(
          color: Color('var(--cardDescriptionColor)'),
        ), // Quote Cards
        css('.quote-card').styles(
          padding: Spacing.all(32.px),
          radius: BorderRadius.circular(16.px),
          textAlign: TextAlign.center,
          raw: {
            'background': 'var(--cardBackground)',
            'border': '1px solid var(--cardBorder)',
            'backdrop-filter': 'blur(10px)',
            'box-shadow': '0 10px 15px -3px rgba(0, 0, 0, 0.1)',
            'transition': 'all 0.3s ease',
          },
        ),

        css('.quote-card:hover').styles(
          raw: {
            'transform': 'translateY(-5px)',
            'box-shadow': '0 20px 25px -5px rgba(0, 0, 0, 0.15)',
          },
        ),

        css('.quote-icon').styles(
          fontSize: 64.px,
          margin: Spacing.only(bottom: 16.px),
        ),
        css('.quote-text').styles(
          fontSize: 20.px,
          fontStyle: FontStyle.italic,
          color: Color('var(--quoteTextColor)'),
          margin: Spacing.only(bottom: 16.px),
          // lineHeight: 1.6,
        ),

        css('.quote-author').styles(
          color: AppColors.textBlack,
          fontSize: 18.px,
          fontWeight: FontWeight.w600,
        ), // Vision/Mission Cards
        css('.vision-card').styles(
          // backgroundColor: Colors.white,
          padding: Spacing.all(48.px),
          radius: BorderRadius.circular(16.px),
          textAlign: TextAlign.center,
          maxWidth: 1024.px,
          margin: Spacing.symmetric(horizontal: Unit.auto),
          // raw: {
          //   'box-shadow': '0 20px 25px -5px rgba(0, 0, 0, 0.1)',
          // },
          raw: {
            'background': 'var(--cardBackground)',
            'border': '1px solid var(--cardBorder)',
            'backdrop-filter': 'blur(10px)',
            'box-shadow': '0 10px 15px -3px rgba(0, 0, 0, 0.1)',
            'transition': 'all 0.3s ease',
          },
        ),

        css('.vision-card:hover').styles(
          raw: {
            'transform': 'translateY(-5px)',
            'box-shadow': '0 20px 25px -5px rgba(0, 0, 0, 0.15)',
          },
        ),

        css('.vision-icon').styles(
          width: 80.px,
          height: 80.px,
          margin:
              Spacing.only(bottom: 24.px, left: Unit.auto, right: Unit.auto),
          color: Color('var(--primary-cyan)'),
        ),

        css('.purple-icon').styles(
          color: Color('var(--primary-purple)'),
        ),
        css('.vision-title').styles(
          fontSize: 40.px,
          fontWeight: FontWeight.w800,
          margin: Spacing.only(bottom: 24.px),
          color: AppColors.textBlack,
        ),
        css('.vision-text').styles(
          fontSize: 24.px,
          color: AppColors.textBlack,
          // lineHeight: 1.6,
        ),

        // Culture Section
        css('.culture-main').styles(
          alignItems: AlignItems.center,
          margin: Spacing.only(bottom: 48.px),
        ),
        css('.culture-subtitle').styles(
          fontSize: 32.px,
          fontWeight: FontWeight.w700,
          margin: Spacing.only(bottom: 24.px),
          color: Color('var(--cultureSubtitleColor)'),
        ),
        css('.culture-features').styles(
          display: Display.flex,
          flexDirection: FlexDirection.column,
          raw: {'gap': '24px'},
        ),
        css('.culture-feature').styles(
          display: Display.flex,
          alignItems: AlignItems.start,
          raw: {'gap': '16px'},
        ),

        css('.feature-icon-container').styles(
          width: 48.px,
          height: 48.px,
          radius: BorderRadius.circular(8.px),
          display: Display.flex,
          alignItems: AlignItems.center,
          justifyContent: JustifyContent.center,
          raw: {
            'flex-shrink': '0',
          },
        ),

        css('.feature-icon').styles(
          fontSize: 24.px,
        ),

        css('.feature-title').styles(
          fontWeight: FontWeight.w600,
          fontSize: 20.px,
        ),

        css('.feature-description').styles(
          color: Color('var(--gray-600)'),
        ),

        // Footer
        css('.footer').styles(
          backgroundColor: Color('var(--gray-900)'),
          color: Colors.white,
          padding: Spacing.only(top: 64.px, bottom: 32.px),
        ),

        css('.footer-content').styles(
          display: Display.grid,
          gap: Gap.all(32.px),
          margin: Spacing.only(bottom: 32.px),
          raw: {
            'grid-template-columns': 'repeat(auto-fit, minmax(250px, 1fr))',
          },
        ),

        css('.footer-logo').styles(
          margin: Spacing.only(bottom: 32.px),
        ),

        css('.footer-description').styles(
          margin: Spacing.only(bottom: 16.px),
          color: Color('var(--gray-400)'),
        ),

        css('.footer-title').styles(
          fontWeight: FontWeight.w600,
          margin: Spacing.only(bottom: 16.px),
        ),

        css('.footer-links').styles(
          listStyle: ListStyle.none,
        ),

        css('.footer-links li').styles(
          margin: Spacing.only(bottom: 8.px),
        ),

        css('.footer-links a').styles(
          color: Color('var(--gray-400)'),
          textDecoration: TextDecoration.none,
          raw: {
            'transition': 'color 0.3s ease',
          },
        ),

        css('.footer-links a:hover').styles(
          color: Color('var(--primary-cyan)'),
        ),

        css('.contact-info').styles(
          display: Display.flex,
          flexDirection: FlexDirection.column,
          gap: Gap.all(8.px),
          color: Color('var(--gray-400)'),
        ),

        css('.contact-item').styles(
          display: Display.flex,
          alignItems: AlignItems.center,
          gap: Gap.all(8.px),
        ),

        css('.footer-bottom').styles(
          border: Border.only(
              top: BorderSide(width: 1.px, color: Color('var(--gray-800)'))),
          padding: Spacing.only(top: 32.px),
          textAlign: TextAlign.center,
          color: Color('var(--gray-400)'),
        ),

        // Animations
        css('@keyframes fadeInUp', [
          css('from').styles(
            opacity: 0,
            raw: {
              'transform': 'translateY(30px)',
            },
          ),
          css('to').styles(
            opacity: 1,
            raw: {
              'transform': 'translateY(0)',
            },
          ),
        ]),

        // Responsive Design
        css.media(MediaQuery.screen(maxWidth: 768.px), [
          css('.nav').styles(
            display: Display.none,
          ),
          css('.hero-title').styles(
            fontSize: 40.px,
          ),
          css('.section-title').styles(
            fontSize: 32.px,
          ),
          css('.vision-title').styles(
            fontSize: 32.px,
          ),
          css('.vision-text').styles(
            fontSize: 20.px,
          ),
          css('.cta-title').styles(
            fontSize: 32.px,
          ),
          css('.cta-buttons').styles(
            flexDirection: FlexDirection.column,
            alignItems: AlignItems.center,
          ),
          css('.culture-main').styles(
            raw: {
              'grid-template-columns': '1fr',
            },
          ),
        ])
      ];
  @override
  State<AboutNew> createState() => _AboutNewState();
}

class _AboutNewState extends State<AboutNew> {
  String getLanguageText(String key, String selectedLang) {
    return LanguageManager.translate(key, selectedLang);
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final selectedLang =
        context.watch(LanguageManager.selectedLanguageProvider);

    yield div(classes: 'about-new-page', [
      // Hero Section
      _buildHeroSection(),

      // Who We Are Section
      _buildWhoWeAreSection(selectedLang),

      // Vision Section
      _buildVisionSection(selectedLang),

      // Mission Section
      _buildMissionSection(selectedLang),

      // Philosophy Section
      _buildPhilosophySection(selectedLang),

      // Core Values Section
      _buildCoreValuesSection(selectedLang),

      // Culture Section
      _buildCultureSection(selectedLang),
      FooterBlock(),
    ]);
  }

  Component _buildHeroSection() {
    return section(classes: 'hero', [
      div(classes: 'container', [
        h1(classes: 'hero-title', [text('Cross Technology and Education')]),
        // p(classes: 'hero-subtitle', [text('Sologan')]),
        // p(classes: 'hero-description', [
        //   text(
        //       'Từ một startup nhỏ đến đối tác tin cậy của hàng trăm doanh nghiệp, '
        //       'chúng tôi không ngừng đổi mới và phát triển để mang lại giá trị tốt nhất cho khách hàng.')
        // ]),
      ]),
    ]);
  }

  Component _buildWhoWeAreSection(String selectedLang) {
    return section(classes: 'section', [
      div(classes: 'container', [
        div(classes: 'grid grid-2', [
          div([
            h2(
                classes: 'section-title',
                [text(LanguageManager.translate('about_title', selectedLang))]),
            div(classes: 'space-y', [
              p(classes: 'description-text', [
                text(LanguageManager.translate(
                    'about_description', selectedLang))
              ]),
            ]),
          ]),
          div(classes: 'image-container', [
            img(
              src:
                  'https://images.unsplash.com/photo-1522071820081-009f0129c71c?w=600&h=400&fit=crop&crop=faces',
              alt: 'Đội ngũ Cross Tech',
              classes: 'team-image',
            ),
            div(classes: 'image-overlay', []),
          ]),
        ]),

        // // Stats Grid
        // div(classes: 'stats-grid', [
        //   _buildStatCard('📊', '500+', 'Dự án hoàn thành'),
        //   _buildStatCard('🤝', '200+', 'Khách hàng tin tưởng'),
        //   _buildStatCard('👥', '50+', 'Chuyên gia giàu kinh nghiệm'),
        //   _buildStatCard('🏆', '10+', 'Năm kinh nghiệm'),
        // ]),
      ]),
    ]);
  }

  // Component _buildStatCard(String icon, String number, String label) {
  //   return div(classes: 'stat-card', [
  //     div(classes: 'stat-icon', [text(icon)]),
  //     div(classes: 'stat-number', [text(number)]),
  //     div(classes: 'stat-label', [text(label)]),
  //   ]);
  // }

  Component _buildVisionSection(String selectedLang) {
    return section(classes: 'section section-alt', [
      div(classes: 'container', [
        div(classes: 'vision-card', [
          div(classes: 'vision-icon', [
            // SVG compass icon
            raw('<svg width="80" height="80" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">'
                '<circle cx="12" cy="12" r="10"/>'
                '<polygon points="16.24,7.76 14.12,14.12 7.76,16.24 9.88,9.88 16.24,7.76"/>'
                '</svg>'),
          ]),
          h2(
              classes: 'vision-title',
              [text(getLanguageText('about_goal_vision_title', selectedLang))]),
          blockquote(classes: 'vision-text', [
            text(getLanguageText('about_goal_vision_description', selectedLang))
          ]),
        ]),
      ]),
    ]);
  }

  Component _buildMissionSection(String selectedLang) {
    return section(classes: 'section', [
      div(classes: 'container', [
        div(classes: 'vision-card', [
          div(classes: 'vision-icon purple-icon', [
            // SVG heart icon
            raw('<svg width="80" height="80" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">'
                '<path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>'
                '</svg>'),
          ]),
          h2(classes: 'vision-title', [
            text(getLanguageText('about_goal_mission_title', selectedLang))
          ]),
          blockquote(classes: 'vision-text', [
            text(
                getLanguageText('about_goal_mission_description', selectedLang))
          ]),
        ]),
      ]),
    ]);
  }

  Component _buildPhilosophySection(String selectedLang) {
    return section(classes: 'section section-alt', [
      div(classes: 'container', [
        div(classes: 'section-header', [
          h2(classes: 'section-title', [
            text(getLanguageText('about_goal_philosophy_title', selectedLang))
          ]),
        ]),
        div(classes: 'grid grid-2', [
          _buildQuoteCard(
              '💡',
              getLanguageText(
                  'about_goal_philosophy_description', selectedLang),
              getLanguageText(
                  'about_goal_philosophy_description_part2', selectedLang)),
          // _buildQuoteCard(
          //     '🚀',
          //     'Đổi mới không phải là điểm đến, mà là hành trình không ngừng nghỉ.',
          //     'Trần Thị Hương, CTO'),
          // _buildQuoteCard(
          //     '🤝',
          //     'Thành công của khách hàng chính là thành công của chúng tôi.',
          //     'Lê Đức Anh, COO'),
          // _buildQuoteCard(
          //     '🌱',
          //     'Học hỏi mỗi ngày, phát triển mỗi giờ, đó là cách chúng tôi tiến bộ.',
          //     'Đội ngũ Cross Tech'),
        ]),
      ]),
    ]);
  }

  Component _buildQuoteCard(String icon, String quote, String author) {
    return div(classes: 'quote-card', [
      div(classes: 'quote-icon', [text(icon)]),
      blockquote(classes: 'quote-text', [text('"$quote"')]),
      p(classes: 'quote-author', [text('$author')]),
    ]);
  }

  Component _buildCoreValuesSection(String selectedLang) {
    return section(classes: 'section', [
      div(classes: 'container', [
        div(classes: 'section-header', [
          h2(
              classes: 'section-title',
              [text(getLanguageText('about_key_value_title', selectedLang))]),
          // p(classes: 'section-subtitle', [
          //   text('Những giá trị định hình văn hóa và hành động của chúng tôi')
          // ]),
        ]),
        CustomGrid(children: [
          _buildValueCard(
              '🎯',
              getLanguageText('about_key_value_honesty_title', selectedLang),
              getLanguageText(
                  'about_key_value_honesty_description', selectedLang),
              'cyan'),
          _buildValueCard(
              '⭐',
              getLanguageText(
                  'about_key_value_responsibility_title', selectedLang),
              getLanguageText(
                  'about_key_value_responsibility_description', selectedLang),
              'purple'),
          _buildValueCard(
              '🤝',
              getLanguageText('about_key_value_passion_title', selectedLang),
              getLanguageText(
                  'about_key_value_passion_description', selectedLang),
              'blue'),
          _buildValueCard(
              '🌱',
              getLanguageText(
                  'about_key_value_professionalism_title', selectedLang),
              getLanguageText(
                  'about_key_value_professionalism_description', selectedLang),
              'green'),
          _buildValueCard(
              '😊',
              getLanguageText('about_key_value_smile_title', selectedLang),
              getLanguageText(
                  'about_key_value_smile_description', selectedLang),
              'pink'),
        ])
      ]),
    ]);
  }

  Component _buildValueCard(
      String icon, String title, String description, String color) {
    return div(classes: 'card card-center', [
      div(classes: 'card-icon card-icon-$color', [text(icon)]),
      h3(classes: 'card-title $color-text', [text(title)]),
      p(classes: 'card-description', [text(description)]),
    ]);
  }

  Component _buildCultureSection(String selectedLang) {
    return section(classes: 'section section-alt', [
      div(classes: 'container', [
        div(classes: 'section-header', [
          h2(
              classes: 'section-title',
              [text(getLanguageText('about_culture_title', selectedLang))]),
          p(
              classes: 'section-subtitle',
              [text(getLanguageText('about_culture_sub_title', selectedLang))]),
        ]),
        div(classes: 'grid grid-2 culture-main', [
          div([
            div(classes: 'culture-features', [
              _buildCultureFeature(
                  getLanguageText('about_culture_description', selectedLang)),
              // _buildCultureFeature('⚖️', 'Cân bằng công việc - cuộc sống',
              //     'Chế độ làm việc linh hoạt, quan tâm đến sức khỏe và hạnh phúc của nhân viên.'),
              // _buildCultureFeature('🎓', 'Học hỏi và phát triển',
              //     'Cơ hội đào tạo, học hỏi công nghệ mới và phát triển kỹ năng chuyên môn liên tục.'),
            ]),
          ]),
          div(classes: 'image-container', [
            img(
              src:
                  'https://images.unsplash.com/photo-1556761175-b413da4baf72?w=500&h=400&fit=crop',
              alt: 'Văn hóa công ty',
              classes: 'culture-image',
            ),
            div(classes: 'image-overlay purple-overlay', []),
          ]),
        ]),
        div(classes: 'grid grid-3', [
          _buildCultureCard('🎉', 'Hoạt động vui chơi',
              'Team building, du lịch công ty, các hoạt động thể thao và giải trí định kỳ.'),
          _buildCultureCard('🏆', 'Ghi nhận thành tích',
              'Chương trình khen thưởng và ghi nhận đóng góp của nhân viên một cách công bằng và kịp thời.'),
          _buildCultureCard('💪', 'Sức khỏe & Phúc lợi',
              'Chế độ bảo hiểm toàn diện, khám sức khỏe định kỳ và các chương trình chăm sóc sức khỏe.'),
        ]),
      ]),
    ]);
  }

  Component _buildCultureFeature(String title) {
    return div(classes: 'culture-feature', [
      div([
        h4(classes: 'feature-title', [text(title)]),
      ]),
    ]);
  }

  Component _buildCultureCard(String icon, String title, String description) {
    return div(classes: 'quote-card', [
      div(classes: 'quote-icon', [text(icon)]),
      h3(classes: 'card-title', [text(title)]),
      p(classes: 'card-description', [text(description)]),
    ]);
  }
}
