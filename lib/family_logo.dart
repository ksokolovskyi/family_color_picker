import 'dart:ui';

import 'package:flutter/widgets.dart';

class FamilyLogo extends StatefulWidget {
  const FamilyLogo({
    this.size = 32,
    super.key,
  });

  final double size;

  @override
  State<FamilyLogo> createState() => _FamilyLogoState();
}

class _FamilyLogoState extends State<FamilyLogo> {
  final _painter = _LogoPainter(color: const Color(0xFFFFFFFF));

  @override
  void dispose() {
    _painter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: widget.size,
        maxHeight: widget.size,
      ),
      child: CustomPaint(
        size: const Size.square(200),
        painter: _painter,
        child: const AspectRatio(aspectRatio: 1),
      ),
    );
  }
}

class _LogoPainter extends CustomPainter {
  _LogoPainter({
    required this.color,
  });

  final Color color;

  /// Size for which [_picture] was recorded.
  Size? _cachedSize;

  /// Recorded picture of the logo.
  Picture? _picture;

  void dispose() {
    _picture?.dispose();
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (_cachedSize == null || _cachedSize != size) {
      _picture?.dispose();
      _cachedSize = size;

      // Creating the recorder and canvas to record on.
      final recorder = PictureRecorder();
      final canvas = Canvas(recorder);

      // The following code was generated from SVG by:
      // https://fluttershapemaker.com.
      final path = Path()
        ..moveTo(size.width, size.height * 0.1680455)
        ..arcToPoint(
          Offset(size.width * 0.8327727, size.height * 0.0008181818),
          radius: Radius.elliptical(
            size.width * 0.1672727,
            size.height * 0.1672727,
          ),
          clockwise: false,
        )
        ..cubicTo(
          size.width * 0.7516364,
          0,
          size.width * 0.6845909,
          size.height * 0.05795455,
          size.width * 0.6680455,
          size.height * 0.1340909,
        )
        ..lineTo(size.width * 0.6639091, size.height * 0.1340909)
        ..arcToPoint(
          Offset(size.width * 0.5000000, 0),
          radius: Radius.elliptical(
            size.width * 0.1668182,
            size.height * 0.1668182,
          ),
          clockwise: false,
        )
        ..arcToPoint(
          Offset(size.width * 0.3360909, size.height * 0.1332727),
          radius: Radius.elliptical(
            size.width * 0.1670455,
            size.height * 0.1670455,
          ),
          clockwise: false,
        )
        ..lineTo(size.width * 0.3319545, size.height * 0.1332727)
        ..arcToPoint(
          Offset(0, size.height * 0.1672727),
          radius: Radius.elliptical(
            size.width * 0.1678182,
            size.height * 0.1678182,
          ),
          clockwise: false,
        )
        ..arcToPoint(
          Offset(size.width * 0.1357727, size.height * 0.3320000),
          radius: Radius.elliptical(
            size.width * 0.1679545,
            size.height * 0.1679545,
          ),
          clockwise: false,
        )
        ..lineTo(size.width * 0.1357727, size.height * 0.3353182)
        ..arcToPoint(
          Offset(0, size.height * 0.5000000),
          radius: Radius.elliptical(
            size.width * 0.1679545,
            size.height * 0.1679545,
          ),
          clockwise: false,
        )
        ..arcToPoint(
          Offset(size.width * 0.1357727, size.height * 0.6647273),
          radius: Radius.elliptical(
            size.width * 0.1679545,
            size.height * 0.1679545,
          ),
          clockwise: false,
        )
        ..lineTo(size.width * 0.1357727, size.height * 0.6680455)
        ..arcToPoint(
          Offset(0, size.height * 0.8327727),
          radius: Radius.elliptical(
            size.width * 0.1680000,
            size.height * 0.1680000,
          ),
          clockwise: false,
        )
        ..arcToPoint(
          Offset(size.width * 0.1672273, size.height),
          radius: Radius.elliptical(
            size.width * 0.1672727,
            size.height * 0.1672727,
          ),
          clockwise: false,
        )
        ..arcToPoint(
          Offset(size.width * 0.3311364, size.height * 0.8659091),
          radius: Radius.elliptical(
            size.width * 0.1663636,
            size.height * 0.1663636,
          ),
          clockwise: false,
        )
        ..lineTo(size.width * 0.3352273, size.height * 0.8659091)
        ..cubicTo(
          size.width * 0.3510000,
          size.height * 0.9420455,
          size.width * 0.4188636,
          size.height,
          size.width * 0.4991818,
          size.height,
        )
        ..arcToPoint(
          Offset(size.width * 0.6630909, size.height * 0.8659091),
          radius: Radius.elliptical(
            size.width * 0.1663636,
            size.height * 0.1663636,
          ),
          clockwise: false,
        )
        ..lineTo(size.width * 0.6671818, size.height * 0.8659091)
        ..cubicTo(
          size.width * 0.6829545,
          size.height * 0.9420455,
          size.width * 0.7508182,
          size.height,
          size.width * 0.8311364,
          size.height,
        )
        ..arcToPoint(
          Offset(size.width * 0.9600000, size.height * 0.7260455),
          radius: Radius.elliptical(
            size.width * 0.1672727,
            size.height * 0.1672727,
          ),
          clockwise: false,
        )
        ..arcToPoint(
          Offset(size.width * 0.8625909, size.height * 0.6680455),
          radius: Radius.elliptical(
            size.width * 0.1681818,
            size.height * 0.1681818,
          ),
          clockwise: false,
        )
        ..lineTo(size.width * 0.8625909, size.height * 0.6647273)
        ..arcToPoint(
          Offset(size.width * 0.9983636, size.height * 0.5000000),
          radius: Radius.elliptical(
            size.width * 0.1679545,
            size.height * 0.1679545,
          ),
          clockwise: false,
        )
        ..arcToPoint(
          Offset(size.width * 0.8625909, size.height * 0.3352727),
          radius: Radius.elliptical(
            size.width * 0.1679545,
            size.height * 0.1679545,
          ),
          clockwise: false,
        )
        ..lineTo(size.width * 0.8625909, size.height * 0.3319545)
        ..arcToPoint(
          Offset(size.width, size.height * 0.1680455),
          radius: Radius.elliptical(
            size.width * 0.1661364,
            size.height * 0.1661364,
          ),
          clockwise: false,
        )
        ..moveTo(size.width * 0.7690455, size.height * 0.7301364)
        ..arcToPoint(
          Offset(size.width * 0.7301364, size.height * 0.7690455),
          radius: Radius.elliptical(
            size.width * 0.03886364,
            size.height * 0.03886364,
          ),
        )
        ..lineTo(size.width * 0.2706818, size.height * 0.7690455)
        ..arcToPoint(
          Offset(size.width * 0.2317727, size.height * 0.7301364),
          radius: Radius.elliptical(
            size.width * 0.03886364,
            size.height * 0.03886364,
          ),
        )
        ..lineTo(size.width * 0.2317727, size.height * 0.2706818)
        ..cubicTo(
          size.width * 0.2317727,
          size.height * 0.2491818,
          size.width * 0.2491818,
          size.height * 0.2317727,
          size.width * 0.2706818,
          size.height * 0.2317727,
        )
        ..lineTo(size.width * 0.7301364, size.height * 0.2317727)
        ..cubicTo(
          size.width * 0.7516364,
          size.height * 0.2317727,
          size.width * 0.7690455,
          size.height * 0.2491818,
          size.width * 0.7690455,
          size.height * 0.2706818,
        )
        ..close();

      canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.fill
          ..color = color,
      );

      _picture = recorder.endRecording();
    }

    assert(_picture != null, 'On this step picture has to be initialized.');

    // Drawing the cached picture.
    canvas.drawPicture(_picture!);
  }

  @override
  bool shouldRepaint(_LogoPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
