import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Container(
              height: 110.0,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 40.0,
                    color: Color(0x08000000),
                    offset: Offset(
                      0.0,
                      8.0,
                    ),
                    spreadRadius: 0.0,
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: SvgPicture.asset(
                  'assets/images/NavBarShadow.svg',
                  width: double.infinity,
                  height: 100.0,
                  fit: BoxFit.cover,
                  alignment: const Alignment(0.0, 1.0),
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 24.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('Home');
                          },
                          child: Container(
                            width: 44.0,
                            height: 44.0,
                            decoration: const BoxDecoration(),
                            child: Icon(
                              FFIcons.khome05,
                              color: valueOrDefault<Color>(
                                ('prismy://prismy.com${GoRouterState.of(context).uri.toString()}' ==
                                            'prismy://prismy.com/') ||
                                        ('prismy://prismy.com${GoRouterState.of(context).uri.toString()}' ==
                                            'prismy://prismy.com/home')
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .secondaryGrey,
                                FlutterFlowTheme.of(context).secondaryGrey,
                              ),
                              size: 24.0,
                            ),
                          ),
                        ),
                        Container(
                          width: 44.0,
                          height: 44.0,
                          decoration: const BoxDecoration(),
                          child: Icon(
                            FFIcons.kmessageChatCircle,
                            color: valueOrDefault<Color>(
                              'prismy://prismy.com${GoRouterState.of(context).uri.toString()}' ==
                                      'home'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondaryGrey,
                              FlutterFlowTheme.of(context).secondaryGrey,
                            ),
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 44.0,
                          height: 44.0,
                          decoration: const BoxDecoration(),
                          child: Icon(
                            FFIcons.kbarChart10,
                            color: valueOrDefault<Color>(
                              'prismy://prismy.com${GoRouterState.of(context).uri.toString()}' ==
                                      'home'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondaryGrey,
                              FlutterFlowTheme.of(context).secondaryGrey,
                            ),
                            size: 24.0,
                          ),
                        ),
                        Container(
                          width: 44.0,
                          height: 44.0,
                          decoration: const BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('Profil');
                            },
                            child: Icon(
                              FFIcons.kuser03,
                              color: valueOrDefault<Color>(
                                'prismy://prismy.com${GoRouterState.of(context).uri.toString()}' ==
                                        'prismy://prismy.com/profil'
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .secondaryGrey,
                                FlutterFlowTheme.of(context).secondaryGrey,
                              ),
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].divide(const SizedBox(width: 100.0)),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 79.0),
              child: Container(
                height: 52.0,
                decoration: const BoxDecoration(),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.checkupOfDay = await queryDailyCheckupRecordOnce(
                      parent: currentUserReference,
                      queryBuilder: (dailyCheckupRecord) => dailyCheckupRecord
                          .where(
                            'date_checkup',
                            isGreaterThanOrEqualTo:
                                functions.getStartofDay(getCurrentTimestamp),
                          )
                          .where(
                            'date_checkup',
                            isLessThanOrEqualTo:
                                functions.getEndOfDay(getCurrentTimestamp),
                          ),
                      singleRecord: true,
                    ).then((s) => s.firstOrNull);
                    if (!(_model.checkupOfDay?.reference != null)) {
                      context.pushNamed('RegisterChekup');
                    }

                    safeSetState(() {});
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SvgPicture.asset(
                      'assets/images/Goute_deau_5.svg',
                      width: 39.0,
                      height: 52.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
