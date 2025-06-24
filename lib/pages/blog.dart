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
          width: 100.vw,
          minHeight: 100.vh,
          flexDirection: FlexDirection.row,
          backgroundColor: Color.rgb(255, 255, 255),
        ),
        [
          // Sidebar
          div(
              styles: Styles(
                width: 220.px,
                padding: Padding.symmetric(vertical: 40.px, horizontal: 10.px),
                border: Border.only(
                    right: BorderSide(
                        color: Color.rgb(240, 240, 240), width: 2.px)),
                backgroundColor: Color.rgb(255, 255, 255),
              ),
              [
                button(
                  styles: Styles(
                    width: 120.percent,
                    padding: Spacing.symmetric(vertical: 10.px),
                    margin: Spacing.only(bottom: 12.px),
                    radius: BorderRadius.circular(8.px),
                    color: Color.rgb(255, 255, 255),
                    fontSize: 20.px,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Color.rgb(18, 32, 63),
                  ),
                  [text('All tags')],
                ),
                ...tags.map((tag) => button(
                      styles: Styles(
                        width: 120.percent,
                        padding: Spacing.symmetric(vertical: 8.px),
                        margin: Spacing.only(bottom: 10.px),
                        radius: BorderRadius.circular(8.px),
                        color: Color.rgb(255, 255, 255),
                        fontSize: 18.px,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Color.rgb(51, 102, 255),
                      ),
                      [text(tag)],
                    )),
              ]),
          // Main content
          div(
              styles: Styles(
                display: Display.flex,
                padding: Spacing.all(40.px),
                flexDirection: FlexDirection.row,
                flexWrap: FlexWrap.wrap,
                justifyContent: JustifyContent.start,
                alignItems: AlignItems.start,
                gap: Gap.all(40.px),
                flex: Flex(grow: 1),
              ),
              [
                ...posts.map((post) => div(
                        styles: Styles(
                          width: 420.px,
                          margin: Margin.only(bottom: 40.px),
                          radius: BorderRadius.circular(16.px),
                          backgroundColor: Color.rgb(255, 255, 255),
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
                          div(styles: Styles(padding: Spacing.all(24.px)), [
                            a(
                              styles: Styles(
                                margin: Spacing.only(bottom: 16.px),
                                color: Color.rgb(51, 102, 255),
                                fontSize: 32.px,
                                fontWeight: FontWeight.bold,
                                textDecoration: TextDecoration.none,
                                lineHeight: 1.2.em,
                              ),
                              href: '#',
                              [text(post['title']!)],
                            ),
                            div(
                              styles: Styles(margin: Spacing.only(top: 12.px)),
                              [
                                span(
                                  styles: Styles(
                                      color: Color.rgb(100, 100, 100),
                                      fontSize: 16.px),
                                  [
                                    text('👤  ${post['author']}'),
                                  ],
                                ),
                                span(
                                  styles: Styles(
                                      color: Color.rgb(180, 180, 180),
                                      fontSize: 16.px),
                                  [
                                    text('  •  ${post['date']}'),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                        ])),
              ]),
        ]);
  }
}
