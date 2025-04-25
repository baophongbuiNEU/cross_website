import 'package:cross_website/components/common/button_primary_black.dart';
import 'package:cross_website/components/common/custom_grid.dart';
import 'package:cross_website/components/home_page/member_card.dart';
import 'package:cross_website/constants/image_constant.dart';
import 'package:cross_website/language/language_manager.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';

class GroupOfCard extends StatelessComponent {
  const GroupOfCard({super.key});

  List<MemberCard> getListMemberCard(String lang) {
    return [
      MemberCard(
        name: LanguageManager.translate('team_member1_name', lang),
        position: LanguageManager.translate('team_member1_position', lang),
        imagePath: Images.memberTeam,
        content: LanguageManager.translate('team_member1_content', lang),
      ),
      MemberCard(
        name: LanguageManager.translate('team_member2_name', lang),
        position: LanguageManager.translate('team_member2_position', lang),
        imagePath: Images.memberTeam,
        content: LanguageManager.translate('team_member2_content', lang),
      ),
      MemberCard(
        name: LanguageManager.translate('team_member3_name', lang),
        position: LanguageManager.translate('team_member3_position', lang),
        imagePath: Images.memberTeam,
        content: LanguageManager.translate('team_member3_content', lang),
      ),
      MemberCard(
        name: LanguageManager.translate('team_member4_name', lang),
        position: LanguageManager.translate('team_member4_position', lang),
        imagePath: Images.memberTeam,
        content: LanguageManager.translate('team_member4_content', lang),
      ),
      MemberCard(
        name: LanguageManager.translate('team_member5_name', lang),
        position: LanguageManager.translate('team_member5_position', lang),
        imagePath: Images.memberTeam,
        content: LanguageManager.translate('team_member5_content', lang),
      ),
      MemberCard(
        name: LanguageManager.translate('team_member6_name', lang),
        position: LanguageManager.translate('team_member6_position', lang),
        imagePath: Images.memberTeam,
        content: LanguageManager.translate('team_member6_content', lang),
      ),
    ];
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final selectedLang = context.watch(selectedLanguageProvider);

    final members = getListMemberCard(selectedLang);

    yield div(
      styles: Styles(
        width: 100.vw,
      ),
      [
        div(
          styles: Styles(
            display: Display.flex,
            margin: Margin.symmetric(horizontal: 5.percent),
            flexDirection: FlexDirection.column,
          ),
          [
            for (var i = 0; i < members.length / 3; i++)
              CustomGrid(children: [
                members[i * 3],
                members[i * 3 + 1],
                members[i * 3 + 2],
              ]),
            _seeAll(selectedLang),
          ],
        ),
      ],
    );
  }

  Component _seeAll(String lang) {
    return div(
      styles: Styles(
        display: Display.flex,
        width: 100.percent,
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.end,
      ),
      [
        ButtonPrimaryBlack(
          text: LanguageManager.translate('team_see_all_team', lang),
        ),
      ],
    );
  }
}
