import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'horizontal_swipe_component_model.dart';
export 'horizontal_swipe_component_model.dart';

class HorizontalSwipeComponentWidget extends StatefulWidget {
  const HorizontalSwipeComponentWidget({super.key});

  @override
  State<HorizontalSwipeComponentWidget> createState() =>
      _HorizontalSwipeComponentWidgetState();
}

class _HorizontalSwipeComponentWidgetState
    extends State<HorizontalSwipeComponentWidget> {
  late HorizontalSwipeComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HorizontalSwipeComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onHorizontalDragUpdate: (details) async {
        _model.alignmentValue = await actions.convertToAlignmentX(
          context,
          details.localPosition.dx,
          112.0,
        );
        FFAppState().swipePosition = _model.alignmentValue!;
        safeSetState(() {});

        safeSetState(() {});
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(1000.0),
        ),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(
                  valueOrDefault<double>(
                    FFAppState().swipePosition,
                    0.0,
                  ),
                  0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: Container(
                  width: 64.0,
                  height: 64.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.circular(1000.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
