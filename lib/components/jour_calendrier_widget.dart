import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'jour_calendrier_model.dart';
export 'jour_calendrier_model.dart';

class JourCalendrierWidget extends StatefulWidget {
  const JourCalendrierWidget({
    super.key,
    required this.dateCheckup,
  });

  final DateTime? dateCheckup;

  @override
  State<JourCalendrierWidget> createState() => _JourCalendrierWidgetState();
}

class _JourCalendrierWidgetState extends State<JourCalendrierWidget> {
  late JourCalendrierModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JourCalendrierModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DailyCheckupRecord>>(
      stream: queryDailyCheckupRecord(
        parent: currentUserReference,
        queryBuilder: (dailyCheckupRecord) => dailyCheckupRecord
            .where(
              'date_checkup',
              isGreaterThanOrEqualTo:
                  functions.getStartofDay(widget.dateCheckup!),
            )
            .where(
              'date_checkup',
              isLessThanOrEqualTo: functions.getEndOfDay(widget.dateCheckup!),
            ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40.0,
              height: 40.0,
              child: SpinKitThreeBounce(
                color: FlutterFlowTheme.of(context).primary,
                size: 40.0,
              ),
            ),
          );
        }
        List<DailyCheckupRecord> containerDailyCheckupRecordList =
            snapshot.data!;
        final containerDailyCheckupRecord =
            containerDailyCheckupRecordList.isNotEmpty
                ? containerDailyCheckupRecordList.first
                : null;

        return Container(
          width: 52.0,
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                dateTimeFormat(
                  "Md",
                  widget.dateCheckup,
                  locale: FFLocalizations.of(context).languageCode,
                ),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  containerDailyCheckupRecord?.humeurNumber.toString(),
                  'NA',
                ),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                    ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: SvgPicture.asset(
                  'assets/images/Goute_deau_5.svg',
                  width: 24.0,
                  height: 24.0,
                  fit: BoxFit.contain,
                ),
              ),
            ].divide(const SizedBox(height: 8.0)),
          ),
        );
      },
    );
  }
}
