import 'package:jaspr/jaspr.dart';

class DotLottiePlayer extends StatelessComponent {
  final String src;
  final String? background;
  final double? speed;
  final bool loop;
  final bool autoplay;
  final double? width;
  final double? height;
  final String? className;

  const DotLottiePlayer({
    super.key,
    required this.src,
    this.background = 'transparent',
    this.speed = 1.0,
    this.loop = true,
    this.autoplay = true,
    this.width = 300,
    this.height = 300,
    this.className,
  });
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'dotlottie-player',
      attributes: {
        'src': src,
        'background': background ?? 'transparent',
        'speed': speed?.toString() ?? '1',
        if (loop) 'loop': '',
        if (autoplay) 'autoplay': '',
      },
      styles: Styles(
        width: width != null ? Unit.pixels(width!) : null,
        height: height != null ? Unit.pixels(height!) : null,
      ),
      child: div([]),
    );
  }
}
