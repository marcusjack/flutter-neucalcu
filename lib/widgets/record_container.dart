import 'package:flutter/material.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/dimensions.dart';
import 'package:neucalcu/themes/shadows.dart';

class RecordContainer extends StatefulWidget {
  final Record record;

  RecordContainer({this.record});

  @override
  _RecordContainerState createState() => _RecordContainerState();
}

class _RecordContainerState extends State<RecordContainer> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112.0,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Listener(
        onPointerDown: (event) {
          setState(() => _isPressed = true);
        },
        onPointerUp: (event) {
          setState(() => _isPressed = false);
        },
        child: Stack(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 100),
              decoration: _isPressed
                  ? getInnerShadow(radius: 16.0)
                  : getOuterShadow(radius: 16.0),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        widget.record.date,
                        style: TextStyle(
                          color: AppColors.accent,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      widget.record.answer,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: sizeHeadline2,
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      widget.record.equation,
                      style: TextStyle(
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}