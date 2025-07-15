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
          imagePath: Images.quyenAnh,
          alt: 'Nguyễn Quyền Anh',
          content: LanguageManager.translate('team_member1_content', lang),
          navigateLink: 'https://boxingnguyen.github.io/'),
      MemberCard(
        name: LanguageManager.translate('team_member2_name', lang),
        position: LanguageManager.translate('team_member2_position', lang),
        imagePath: Images.vietTran,
        alt: 'Trần Việt',
        content: LanguageManager.translate('team_member2_content', lang),
      ),
      MemberCard(
        name: LanguageManager.translate('team_member3_name', lang),
        position: LanguageManager.translate('team_member3_position', lang),
        imagePath: Images.quangHuy,
        alt: 'Phùng Quang Huy',
        content: LanguageManager.translate('team_member3_content', lang),
      ),
      MemberCard(
        name: LanguageManager.translate('team_member4_name', lang),
        position: LanguageManager.translate('team_member4_position', lang),
        imagePath: Images.baoPhong,
        alt: 'Bùi Bảo Phong',
        content: LanguageManager.translate('team_member4_content', lang),
      ),
      MemberCard(
        name: LanguageManager.translate('team_member5_name', lang),
        position: LanguageManager.translate('team_member5_position', lang),
        imagePath: Images.dangTung,
        alt: 'Nguyễn Đăng Tùng',
        content: LanguageManager.translate('team_member5_content', lang),
      ),
      MemberCard(
        name: LanguageManager.translate('team_member6_name', lang),
        position: LanguageManager.translate('team_member6_position', lang),
        imagePath: Images.vietHung,
        alt: 'Lê Việt Hùng',
        content: LanguageManager.translate('team_member6_content', lang),
      ),
    ];
  }

  @css
  static List<StyleRule> get styles => [
        css('.member_cards_padding').styles(
          display: Display.flex,
          margin: Margin.symmetric(horizontal: 13.percent),
          flexDirection: FlexDirection.column,
        ),
        css.media(MediaQuery.screen(maxWidth: 1400.px), [
          css('.member_cards_padding').styles(
            margin: Margin.symmetric(horizontal: 5.percent),
          ),
        ]),
      ];

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final selectedLang =
        context.watch(LanguageManager.selectedLanguageProvider);

    final members = getListMemberCard(selectedLang);

    yield div(
      styles: Styles(
        maxWidth: 100.percent,
      ),
      [
        div(
          classes: 'member_cards_padding',
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
