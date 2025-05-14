import 'package:jaspr/jaspr.dart';

class Blog extends StatelessComponent {
  const Blog({super.key});

  final List<String> tags = const [
    'Business Value',
    'Full Stack',
    'Dart',
    'Webinar',
    'Partnership',
    'Best Practices',
    'Enterprise',
    'VGV',
    'Flutter',
    'Architecture',
    'Testing',
    'Games',
  ];

  final List<Map<String, String>> posts = const [
    {
      'title':
          'Why Write Everything Twice? Lessons from Leaders on Successful Flutter Transformations',
      'author': 'David DeRemer',
      'date': 'April 22, 2025',
      'image': '/images/sample1.png',
    },
    {
      'title': 'My Journey From Barista To Google Developer Expert',
      'author': 'Marcus Twichel',
      'date': 'April 14, 2025',
      'image': '/images/sample2.png',
    },
  ];

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
        styles: Styles(
          display: Display.flex,
          flexDirection: FlexDirection.row,
          width: 100.vw,
          minHeight: 100.vh,
          backgroundColor: Color.rgb(255, 255, 255),
        ),
        [
          // Sidebar
          div(
              styles: Styles(
                width: 220.px,
                padding:
                    EdgeInsets.symmetric(vertical: 40.px, horizontal: 10.px),
                backgroundColor: Color.rgb(255, 255, 255),
                border: Border.only(
                    right: BorderSide(
                        color: Color.rgb(240, 240, 240), width: 2.px)),
              ),
              [
                button([text('All tags')],
                    styles: Styles(
                      width: 120.percent,
                      backgroundColor: Color.rgb(18, 32, 63),
                      color: Color.rgb(255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.px,
                      radius: BorderRadius.circular(8.px),
                      margin: EdgeInsets.only(bottom: 12.px),
                      padding: EdgeInsets.symmetric(vertical: 10.px),
                    )),
                ...tags.map((tag) => button([text(tag)],
                    styles: Styles(
                      width: 120.percent,
                      backgroundColor: Color.rgb(51, 102, 255),
                      color: Color.rgb(255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.px,
                      radius: BorderRadius.circular(8.px),
                      margin: EdgeInsets.only(bottom: 10.px),
                      padding: EdgeInsets.symmetric(vertical: 8.px),
                    ))),
              ]),
          // Main content
          div(
              styles: Styles(
                flex: Flex(grow: 1),
                display: Display.flex,
                flexDirection: FlexDirection.row,
                flexWrap: FlexWrap.wrap,
                justifyContent: JustifyContent.start,
                alignItems: AlignItems.start,
                padding: EdgeInsets.all(40.px),
                gap: Gap.all(40.px),
              ),
              [
                ...posts.map((post) => div(
                        styles: Styles(
                          width: 420.px,
                          backgroundColor: Color.rgb(255, 255, 255),
                          radius: BorderRadius.circular(16.px),
                          margin: Margin.only(bottom: 40.px),
                        ),
                        [
                          img(
                              src: post['image']!,
                              styles: Styles(
                                width: 100.percent,
                                height: 180.px,
                                radius: BorderRadius.only(
                                  topLeft: Radius.circular(16.px),
                                  topRight: Radius.circular(16.px),
                                ),
                              )),
                          div(styles: Styles(padding: EdgeInsets.all(24.px)), [
                            a([text(post['title']!)],
                                href: '#',
                                styles: Styles(
                                  color: Color.rgb(51, 102, 255),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32.px,
                                  lineHeight: 1.2.em,
                                  textDecoration: TextDecoration.none,
                                  margin: EdgeInsets.only(bottom: 16.px),
                                )),
                            div([
                              span([
                                text('👤  ${post['author']}'),
                              ],
                                  styles: Styles(
                                      color: Color.rgb(100, 100, 100),
                                      fontSize: 16.px)),
                              span([
                                text('  •  ${post['date']}'),
                              ],
                                  styles: Styles(
                                      color: Color.rgb(180, 180, 180),
                                      fontSize: 16.px)),
                            ],
                                styles: Styles(
                                    margin: EdgeInsets.only(top: 12.px))),
                          ]),
                        ])),
              ]),
        ]);
  }
}
