import 'package:cross_website/components/common/button_primary_black.dart';
import 'package:cross_website/components/common/size_box_component.dart';
import 'package:cross_website/components/home_page/member_card.dart';
import 'package:cross_website/constants/image_constant.dart';
import 'package:cross_website/language/language_manager.dart';
import 'package:jaspr/jaspr.dart';

class GroupOfCard extends StatelessComponent {
  const GroupOfCard({super.key});

  List<MemberCard> getListMemberCard() {
    return [
      MemberCard(
        name: LanguageManager.translate('team_member1_name'),
        position: LanguageManager.translate('team_member1_position'),
        imagePath: Images.memberTeam,
        content: LanguageManager.translate('team_member1_content'),
      ),
      MemberCard(
        name: LanguageManager.translate('team_member2_name'),
        position: LanguageManager.translate('team_member2_position'),
        imagePath: Images.memberTeam,
        content: LanguageManager.translate('team_member2_content'),
      ),
      MemberCard(
        name: LanguageManager.translate('team_member3_name'),
        position: LanguageManager.translate('team_member3_position'),
        imagePath: Images.memberTeam,
        content: LanguageManager.translate('team_member3_content'),
      ),
      MemberCard(
        name: LanguageManager.translate('team_member4_name'),
        position: LanguageManager.translate('team_member4_position'),
        imagePath: Images.memberTeam,
        content: LanguageManager.translate('team_member4_content'),
      ),
      MemberCard(
        name: LanguageManager.translate('team_member5_name'),
        position: LanguageManager.translate('team_member5_position'),
        imagePath: Images.memberTeam,
        content: LanguageManager.translate('team_member5_content'),
      ),
      MemberCard(
        name: LanguageManager.translate('team_member6_name'),
        position: LanguageManager.translate('team_member6_position'),
        imagePath: Images.memberTeam,
        content: LanguageManager.translate('team_member6_content'),
      ),
    ];
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield ValueListenableBuilder<String>(
      listenable: LanguageManager.selectedLanguage,
      builder: (context, lang) sync* {
        final members = getListMemberCard();

        yield div(
          styles: Styles(margin: Margin.symmetric(horizontal: 100.px)),
          [
            div(
              styles: Styles(
                display: Display.flex,
                flexDirection: FlexDirection.column,
              ),
              [
                for (var i = 0; i < members.length / 3; i++)
                  div([
                    div(
                      styles: Styles(
                        display: Display.flex,
                        flexDirection: FlexDirection.row,
                        justifyContent: JustifyContent.spaceAround,
                      ),
                      [
                        members[i * 3],
                        SizeBoxComponent(width: 20),
                        members[i * 3 + 1],
                        SizeBoxComponent(width: 20),
                        members[i * 3 + 2],
                      ],
                    ),
                    SizeBoxComponent(height: 40),
                  ]),
                _seeAll(),
              ],
            ),
          ],
        );
      },
    );
  }

  Component _seeAll() {
    return div(
      styles: Styles(
        display: Display.flex,
        width: 100.percent,
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.end,
      ),
      [
        ButtonPrimaryBlack(
          text: LanguageManager.translate('team_see_all_team'),
        ),
      ],
    );
  }
}
