import 'package:cross_website/components/common/size_box_component.dart';
import 'package:cross_website/components/common/title_icon_home.dart';
import 'package:cross_website/components/header.dart';
import 'package:cross_website/components/home_page/case_studies_block.dart';
import 'package:cross_website/components/home_page/contact_us_block.dart';
import 'package:cross_website/components/home_page/cta_block.dart';
import 'package:cross_website/components/home_page/footer_block.dart';
import 'package:cross_website/components/home_page/group_of_card.dart';
import 'package:cross_website/components/home_page/header_home_page.dart';
import 'package:cross_website/components/home_page/list_logo.dart';
import 'package:cross_website/components/home_page/our_service.dart';
import 'package:cross_website/components/home_page/process_block.dart';
import 'package:cross_website/language/language_manager.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:logger/logger.dart';

@client
class Home extends StatefulComponent {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  final logger = Logger();

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      logger.i("Hello client");
    } else {
      logger.i("Hello server");
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final selectedLang =
        context.watch(LanguageManager.selectedLanguageProvider);

    yield div(
        styles: Styles(
          raw: {
            'background': 'var(--gradientBackground)',
          },
        ),
        [
          Header(),
          HeaderHomePage(),
          ListLogo(),
          div(id: 'services', [
            TitleIconHome(
              title:
                  LanguageManager.translate('home_service_title', selectedLang),
              content: LanguageManager.translate(
                  'home_service_content', selectedLang),
            ),
            OurService(),
          ]),
          CtaBlock(),
          div(id: 'case-studies', [
            TitleIconHome(
              title: LanguageManager.translate(
                  'home_case_studies_title', selectedLang),
              content: LanguageManager.translate(
                  'home_case_studies_content', selectedLang),
            ),
            CaseStudiesBlock(),
          ]),
          div(id: 'process', [
            TitleIconHome(
              title:
                  LanguageManager.translate('home_process_title', selectedLang),
              content: LanguageManager.translate(
                  'home_process_content', selectedLang),
            ),
            ProcessBlock(),
          ]),
          div(id: 'careers', [
            TitleIconHome(
              title: LanguageManager.translate('home_team_title', selectedLang),
              content:
                  LanguageManager.translate('home_team_content', selectedLang),
            ),
            GroupOfCard(),
          ]),
          div(id: 'contact', [
            TitleIconHome(
              title: LanguageManager.translate(
                  'home_contact_us_title', selectedLang),
              content: LanguageManager.translate(
                  'home_contact_us_content', selectedLang),
            ),
            ContactUsBlock(),
          ]),
          SizeBoxComponent(height: 140),
          FooterBlock(),
        ]);
  }
}
