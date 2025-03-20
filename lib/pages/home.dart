import 'package:jaspr/jaspr.dart';
import 'package:my_website/components/common/size_box_component.dart';
import 'package:my_website/components/common/title_icon_home.dart';
import 'package:my_website/components/home_page/case_studies_block.dart';
import 'package:my_website/components/home_page/contact_us_block.dart';
import 'package:my_website/components/home_page/cta_block.dart';
import 'package:my_website/components/home_page/footer_block.dart';
import 'package:my_website/components/home_page/group_of_card.dart';
import 'package:my_website/components/home_page/header_home_page.dart';
import 'package:my_website/components/home_page/list_logo.dart';
import 'package:my_website/components/home_page/our_service.dart';
import 'package:my_website/components/home_page/process_block.dart';
import 'package:my_website/language/language_manager.dart';

// By using the @client annotation this component will be automatically compiled to javascript and mounted
// on the client. Therefore:
// - this file and any imported file must be compilable for both server and client environments.
// - this component and any child components will be built once on the server during pre-rendering and then
//   again on the client during normal rendering.
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
    // No need to add listener here since ValueListenableBuilder will handle it
  }

  @override
  void dispose() {
    // No need to remove listener here since ValueListenableBuilder manages it
    super.dispose();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield ValueListenableBuilder<String>(
      listenable: LanguageManager.selectedLanguage,
      builder: (context, lang) sync* {
        yield div(
          [
            HeaderHomePage(),
            ListLogo(),
            TitleIconHome(
              title:
                  LanguageManager.getTranslation('home_page', 'service_title'),
              content: LanguageManager.getTranslation(
                  'home_page', 'service_content'),
            ),
            OurService(),
            CtaBlock(),
            TitleIconHome(
              title: LanguageManager.getTranslation(
                  'home_page', 'case_studies_title'),
              content: LanguageManager.getTranslation(
                  'home_page', 'case_studies_content'),
            ),
            CaseStudiesBlock(),
            TitleIconHome(
              title:
                  LanguageManager.getTranslation('home_page', 'process_title'),
              content: LanguageManager.getTranslation(
                  'home_page', 'process_content'),
            ),
            ProcessBlock(),
            TitleIconHome(
              title: LanguageManager.getTranslation('home_page', 'team_title'),
              content:
                  LanguageManager.getTranslation('home_page', 'team_content'),
            ),
            GroupOfCard(),
            TitleIconHome(
              title: LanguageManager.getTranslation(
                  'home_page', 'contact_us_title'),
              content: LanguageManager.getTranslation(
                  'home_page', 'contact_us_content'),
            ),
            ContactUsBlock(),
            SizeBoxComponent(height: 140),
            FooterBlock(),
          ],
        );
      },
    );
  }
}
