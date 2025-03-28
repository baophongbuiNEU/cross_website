import 'package:cross_website/components/common/size_box_component.dart';
import 'package:cross_website/components/common/title_icon_home.dart';
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

@client
class Home extends StatefulComponent {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      print("Hello client");
    } else {
      print("Hello server");
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield ValueListenableBuilder<String>(
      listenable: LanguageManager.selectedLanguage,
      builder: (context, lang) sync* {
        yield div([
          HeaderHomePage(),
          ListLogo(),
          div(id: 'services', [
            TitleIconHome(
              title: LanguageManager.translate('home_service_title'),
              content: LanguageManager.translate('home_service_content'),
            ),
            OurService(),
          ]),
          CtaBlock(),
          div(id: 'case-studies', [
            TitleIconHome(
              title: LanguageManager.translate('home_case_studies_title'),
              content: LanguageManager.translate('home_case_studies_content'),
            ),
            CaseStudiesBlock(),
          ]),
          div(id: 'process', [
            TitleIconHome(
              title: LanguageManager.translate('home_process_title'),
              content: LanguageManager.translate('home_process_content'),
            ),
            ProcessBlock(),
          ]),
          div(id: 'careers', [
            TitleIconHome(
              title: LanguageManager.translate('home_team_title'),
              content: LanguageManager.translate('home_team_content'),
            ),
            GroupOfCard(),
          ]),
          div(id: 'contact', [
            TitleIconHome(
              title: LanguageManager.translate('home_contact_us_title'),
              content: LanguageManager.translate('home_contact_us_content'),
            ),
            ContactUsBlock(),
          ]),
          SizeBoxComponent(height: 140),
          FooterBlock(),
        ]);
      },
    );
  }
}
