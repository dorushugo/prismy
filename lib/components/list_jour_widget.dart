import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'list_jour_model.dart';
export 'list_jour_model.dart';

class ListJourWidget extends StatefulWidget {
  const ListJourWidget({
    super.key,
    required this.parameter1,
  });

  final List<DateTime>? parameter1;

  @override
  State<ListJourWidget> createState() => _ListJourWidgetState();
}

class _ListJourWidgetState extends State<ListJourWidget> {
  late ListJourModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListJourModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 84.0,
      child: Builder(
        builder: (context) {
          final lastSevenDaysList = widget.parameter1!.toList();

          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: lastSevenDaysList.length,
            separatorBuilder: (_, __) => const SizedBox(width: 24.0),
            itemBuilder: (context, lastSevenDaysListIndex) {
              final lastSevenDaysListItem =
                  lastSevenDaysList[lastSevenDaysListIndex];
              return StreamBuilder<List<DailyCheckupRecord>>(
                stream: queryDailyCheckupRecord(
                  parent: currentUserReference,
                  queryBuilder: (dailyCheckupRecord) => dailyCheckupRecord
                      .where(
                        'date_checkup',
                        isGreaterThanOrEqualTo:
                            functions.getStartofDay(lastSevenDaysListItem),
                      )
                      .where(
                        'date_checkup',
                        isLessThanOrEqualTo:
                            functions.getEndOfDay(lastSevenDaysListItem),
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
                            "d/M",
                            lastSevenDaysListItem,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Montserrat',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            containerDailyCheckupRecord?.humeurNumber
                                .toString(),
                            'NA',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Montserrat',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
            },
          );
        },
      ),
    );
  }
}
