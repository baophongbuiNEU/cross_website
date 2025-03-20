import 'package:jaspr/jaspr.dart';
import 'package:my_website/components/common/custom_grid.dart';
import 'package:my_website/components/home_page/member_card.dart';
import 'package:my_website/constants/image_constant.dart';

import '../common/button_primary_black.dart';
import '../common/size_box_component.dart';

class GroupOfCard extends StatelessComponent {
  const GroupOfCard({
    super.key,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
        styles: Styles(
          width: 100.vw,
        ),
        [
          div(
              styles: Styles(
                  display: Display.flex,
                  margin: Margin.symmetric(horizontal: 5.percent),
                  flexDirection: FlexDirection.column),
              [
                for (var i = 0; i < listMemberCard.length / 3; i++)
                  // div([
                  //   div(
                  //       styles: Styles(
                  //           display: Display.flex,
                  //           flexDirection: FlexDirection.row,
                  //           justifyContent: JustifyContent.spaceAround),
                  //       [
                  //         listMemberCard[i * 3],
                  //         SizeBoxComponent(width: 20),
                  //         listMemberCard[i * 3 + 1],
                  //         SizeBoxComponent(width: 20),
                  //         listMemberCard[i * 3 + 2],
                  //       ]),
                  //   SizeBoxComponent(height: 40)
                  // ]),
                  CustomGrid(children: [
                    listMemberCard[i * 3],
                    // SizeBoxComponent(width: 20),
                    listMemberCard[i * 3 + 1],
                    // SizeBoxComponent(width: 20),
                    listMemberCard[i * 3 + 2],
                  ]),
                _seeAll()
              ])
        ]);
  }

  Component _seeAll() {
    return div(
        styles: Styles(
            display: Display.flex,
            width: 100.percent,
            flexDirection: FlexDirection.column,
            alignItems: AlignItems.end),
        [ButtonPrimaryBlack(text: "See all team")]);
  }
}

final listMemberCard = [
  MemberCard(
      name: "John Smith",
      position: "CEO and Founder",
      imagePath: Images.memberTeam,
      content:
          "10+ years of experience in digital marketing. Expertise in SEO, PPC, and content strategy"),
  MemberCard(
      name: "John Smith",
      position: "CEO and Founder",
      imagePath: Images.memberTeam,
      content:
          "10+ years of experience in digital marketing. Expertise in SEO, PPC, and content strategy"),
  MemberCard(
      name: "John Smith",
      position: "CEO and Founder",
      imagePath: Images.memberTeam,
      content:
          "10+ years of experience in digital marketing. Expertise in SEO, PPC, and content strategy"),
  MemberCard(
      name: "John Smith",
      position: "CEO and Founder",
      imagePath: Images.memberTeam,
      content:
          "10+ years of experience in digital marketing. Expertise in SEO, PPC, and content strategy"),
  MemberCard(
      name: "John Smith",
      position: "CEO and Founder",
      imagePath: Images.memberTeam,
      content:
          "10+ years of experience in digital marketing. Expertise in SEO, PPC, and content strategy"),
  MemberCard(
      name: "John Smith",
      position: "CEO and Founder",
      imagePath: Images.memberTeam,
      content:
          "10+ years of experience in digital marketing. Expertise in SEO, PPC, and content strategy"),
];
