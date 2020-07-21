import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'lazy_future_builder.dart';

class ForwardNavigationText extends StatelessWidget {
  final String label;
  final Future Function() onTap;
  final Color color;
  final TextStyle style;
  final EdgeInsets padding;

  const ForwardNavigationText({
    @required this.label,
    this.onTap,
    this.color,
    this.style,
    this.padding = const EdgeInsets.fromLTRB(4, 8, 0, 8),
  });

  @override
  Widget build(BuildContext context) {
    final _style = style ?? Theme.of(context).textTheme.bodyText2;

    return Align(
      alignment: Alignment.centerRight,
      child: Material(
        type: MaterialType.transparency,
        child: LazyFutureBuilder(
          futureBuilder: onTap,
          builder: (context, futureBuilder, isFutureBuilding) => InkWell(
            onTap: futureBuilder,
            child: Padding(
              padding: padding,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: AutoSizeText(
                      label,
                      maxLines: 1,
                      minFontSize: 4,
                      textAlign: TextAlign.right,
                      style: _style.apply(
                        decoration: TextDecoration.underline,
                        color: color,
                      ),
                      strutStyle: const StrutStyle(
                        forceStrutHeight: true,
                        height: 1,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: color,
                    size: _style.fontSize,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
