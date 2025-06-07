import 'dart:math' as math;

import 'package:family_color_picker/family_color.dart';
import 'package:family_color_picker/family_logo.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/widgets.dart';

const _minSplashRadius = 6;

const _maxSplashRadius = 13;

class FamilyColorPreview extends StatefulWidget {
  const FamilyColorPreview({
    required this.color,
    super.key,
  });

  final FamilyColor color;

  @override
  State<FamilyColorPreview> createState() => _FamilyColorPreviewState();
}

class _FamilyColorPreviewState extends State<FamilyColorPreview>
    with SingleTickerProviderStateMixin {
  final _random = math.Random();

  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );

  late final _colorProgress = Tween<double>(begin: 0, end: 1)
      .chain(CurveTween(curve: const ElasticOutCurve(0.7))) //
      .animate(_controller);

  late final _colorOpacity = Tween<double>(begin: 0, end: 1)
      .chain(CurveTween(curve: const Interval(0, 0.2, curve: Curves.ease))) //
      .animate(_controller);

  late final _splashesDistance = Tween<double>(begin: 0, end: 1)
      .chain(
        CurveTween(curve: const Interval(0.28, 0.76, curve: Curves.easeOut)),
      )
      .animate(_controller);

  late final _splashesSize = Tween<double>(begin: 1, end: 0)
      .chain(CurveTween(curve: const Interval(0.28, 1))) //
      .animate(_controller);

  final _config = List<_SplashConfig>.filled(6, _SplashConfig.zero);

  FamilyColor get _color => widget.color;

  FamilyColor? _previousColor;

  @override
  void didUpdateWidget(FamilyColorPreview oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.color != widget.color) {
      _previousColor = oldWidget.color;
      _generateConfig();
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics.fromProperties(
      container: true,
      properties: SemanticsProperties(
        label: 'Color preview',
        value: widget.color.name,
        readOnly: true,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 122,
          maxWidth: 122,
        ),
        child: CustomPaint(
          painter: _ColorPreviewPainter(
            color: _color.color,
            previousColor: _previousColor?.color,
            config: _config,
            progress: _controller,
            colorProgress: _colorProgress,
            colorOpacity: _colorOpacity,
            splashesDistance: _splashesDistance,
            splashesSize: _splashesSize,
          ),
          child: const Center(
            child: FamilyLogo(size: 58),
          ),
        ),
      ),
    );
  }

  void _generateConfig() {
    for (var i = 0; i < _config.length; i++) {
      _config[i] = _SplashConfig(
        radius:
            (_maxSplashRadius - _minSplashRadius) * _random.nextDouble() +
            _minSplashRadius,
        angle: _random.nextDouble() * 2 * math.pi,
      );
    }
  }
}

class _ColorPreviewPainter extends CustomPainter {
  _ColorPreviewPainter({
    required this.color,
    required this.previousColor,
    required this.config,
    required this.progress,
    required this.colorProgress,
    required this.colorOpacity,
    required this.splashesDistance,
    required this.splashesSize,
  }) : super(repaint: progress);

  final Color color;

  final Color? previousColor;

  final List<_SplashConfig> config;

  final Animation<double> progress;

  final Animation<double> colorProgress;

  final Animation<double> colorOpacity;

  final Animation<double> splashesDistance;

  final Animation<double> splashesSize;

  late final _colorPaint = Paint()
    ..color = color
    ..style = PaintingStyle.fill;

  late final _previousColorPaint = Paint()
    ..color = previousColor ?? color
    ..style = PaintingStyle.fill;

  bool _hidePreviousColor = false;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final center = rect.center;
    final radius = size.shortestSide / 2;

    if (progress.value == 0 || progress.value == 1) {
      canvas.drawCircle(
        center,
        radius,
        progress.value == 1 ? _colorPaint : _previousColorPaint,
      );
      return;
    }

    _hidePreviousColor = _hidePreviousColor || colorProgress.value >= 1;

    if (!_hidePreviousColor) {
      canvas.drawCircle(center, radius, _previousColorPaint);
    }

    canvas.drawCircle(
      center,
      radius * colorProgress.value,
      Paint()
        ..color = _colorPaint.color.withValues(alpha: colorOpacity.value)
        ..style = PaintingStyle.fill,
    );

    if (splashesDistance.value <= 0) {
      return;
    }

    final startPoint = radius * 1.1 - _maxSplashRadius;
    final endPoint = radius * 1.3;
    final distance =
        (endPoint - startPoint) * splashesDistance.value + startPoint;

    for (var i = 0; i < config.length; i++) {
      canvas.drawCircle(
        _getSplashOffset(center, distance, config[i].angle),
        config[i].radius * splashesSize.value,
        _colorPaint,
      );
    }
  }

  Offset _getSplashOffset(Offset center, double distance, double angle) {
    final dx = center.dx + distance * math.cos(angle);
    final dy = center.dy + distance * math.sin(angle);
    return Offset(dx, dy);
  }

  @override
  bool shouldRepaint(_ColorPreviewPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.previousColor != previousColor ||
        oldDelegate.config != config ||
        oldDelegate.progress != progress;
  }
}

class _SplashConfig {
  static const zero = _SplashConfig(radius: 0, angle: 0);

  const _SplashConfig({
    required this.radius,
    required this.angle,
  });

  final double radius;

  final double angle;
}
