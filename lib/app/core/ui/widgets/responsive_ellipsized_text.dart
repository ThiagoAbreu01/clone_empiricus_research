import 'package:flutter/material.dart';

/// A Text widget that calculates how many lines fit in the available height
/// and applies [TextOverflow.ellipsis] when the content overflows.
///
/// If [maxHeight] is omitted, the widget will use the incoming layout
/// constraints' maxHeight. If that is infinite, a sensible fallback is used.
class ResponsiveEllipsizedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? maxHeight;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final int minLinesFallback;

  const ResponsiveEllipsizedText({
    super.key,
    required this.text,
    this.style,
    this.maxHeight,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.minLinesFallback = 1,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = style ?? DefaultTextStyle.of(context).style;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double availableWidth = constraints.maxWidth;
        // Decide available height: prefer explicit maxHeight, else constraints
        double availableHeight = maxHeight ?? constraints.maxHeight;

        // If height is infinite (e.g., unconstrained by parent), use a fallback.
        if (availableHeight.isInfinite) {
          // fallback to 3 lines worth of height
          availableHeight = effectiveStyle.fontSize != null
              ? (effectiveStyle.fontSize! * 3.6)
              : 48;
        }

        final textPainter = TextPainter(
          text: TextSpan(text: text, style: effectiveStyle),
          textDirection: textDirection ?? Directionality.of(context),
        );

        textPainter.layout(maxWidth: availableWidth);

        final double lineHeight = textPainter.preferredLineHeight;
        final int maxLinesThatFit =
            lineHeight <= 0 ? minLinesFallback : (availableHeight / lineHeight).floor();
        final int maxLines = maxLinesThatFit > 0 ? maxLinesThatFit : minLinesFallback;

        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: availableHeight),
          child: Text(
            text,
            style: effectiveStyle,
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        );
      },
    );
  }
}
