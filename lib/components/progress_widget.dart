import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressWidget extends StatefulWidget {
  const ProgressWidget({
    Key key,
    this.progress,
  }) : super(key: key);

  final double progress;

  @override
  _ProgressWidgetState createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 300,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: FlutterFlowTheme.of(context).background,
              width: 2,
            ),
          ),
        ),
        Container(
          width: widget.progress,
          height: 20,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: FlutterFlowTheme.of(context).background,
              width: 2,
            ),
          ),
        ),
      ],
    );
  }
}
