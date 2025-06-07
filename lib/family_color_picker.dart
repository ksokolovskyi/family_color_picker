import 'package:collection/collection.dart';
import 'package:family_color_picker/family_color.dart';
import 'package:family_color_picker/family_color_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class FamilyColorPicker extends StatelessWidget {
  const FamilyColorPicker({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final FamilyColor value;

  final ValueChanged<FamilyColor> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 18,
      runSpacing: 18,
      runAlignment: WrapAlignment.center,
      children: [
        RepaintBoundary(
          child: FamilyColorPreview(color: value),
        ),
        RepaintBoundary(
          child: _ColorPicker(
            value: value,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

class _ColorPicker extends StatelessWidget {
  const _ColorPicker({
    required this.value,
    required this.onChanged,
  });

  final FamilyColor value;

  final ValueChanged<FamilyColor> onChanged;

  void _onColorTap(FamilyColor newValue) {
    if (newValue == value) {
      return;
    }
    onChanged(newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics.fromProperties(
      container: true,
      properties: const SemanticsProperties(
        role: SemanticsRole.radioGroup,
        label: 'Choose a color',
      ),
      explicitChildNodes: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          for (final slice in FamilyColor.values.slices(5))
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 8,
                children: [
                  for (final color in slice)
                    Flexible(
                      child: _ColorCircle(
                        color: color,
                        isSelected: value == color,
                        onTap: _onColorTap,
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _ColorCircle extends StatefulWidget {
  const _ColorCircle({
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  final FamilyColor color;

  final bool isSelected;

  final ValueChanged<FamilyColor> onTap;

  @override
  State<_ColorCircle> createState() => _ColorCircleState();
}

class _ColorCircleState extends State<_ColorCircle>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 100),
  );

  late final _progress = CurvedAnimation(
    curve: Curves.ease,
    reverseCurve: Curves.ease.flipped,
    parent: _controller,
  );

  @override
  void initState() {
    super.initState();
    _controller.value = widget.isSelected ? 1 : 0;
  }

  @override
  void didUpdateWidget(_ColorCircle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected) {
      if (widget.isSelected) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _progress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics.fromProperties(
      properties: SemanticsProperties(
        inMutuallyExclusiveGroup: true,
        button: true,
        enabled: true,
        focusable: true,
        checked: widget.isSelected,
        value: '${widget.color.name} color',
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => widget.onTap(widget.color),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 26, maxWidth: 26),
            child: CustomPaint(
              foregroundPainter: _CircleSelectionPainter(
                color: widget.color.color,
                progress: _progress,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.color.color,
                ),
                child: const AspectRatio(aspectRatio: 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CircleSelectionPainter extends CustomPainter {
  _CircleSelectionPainter({
    required this.color,
    required this.progress,
  }) : super(repaint: progress);

  final Color color;

  final Animation<double> progress;

  final _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    if (progress.value == 0) {
      return;
    }

    final rect = Offset.zero & size;
    final center = rect.center;
    final radius = rect.shortestSide / 2;

    final outerRadius = radius * (0.692 + 0.208 * (1 - progress.value));
    final innerRadius = outerRadius * 0.666;

    canvas
      ..drawCircle(
        center,
        outerRadius,
        _paint..color = Colors.white.withValues(alpha: progress.value),
      )
      ..drawCircle(center, innerRadius, _paint..color = color);
  }

  @override
  bool shouldRepaint(_CircleSelectionPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.progress != progress;
  }
}
