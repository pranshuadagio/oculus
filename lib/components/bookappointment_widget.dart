import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class BookappointmentWidget extends StatefulWidget {
  const BookappointmentWidget({Key key}) : super(key: key);

  @override
  _BookappointmentWidgetState createState() => _BookappointmentWidgetState();
}

class _BookappointmentWidgetState extends State<BookappointmentWidget>
    with TickerProviderStateMixin {
  DateTime datePicked;
  String dropDownValue;
  TextEditingController personsNameController;
  TextEditingController problemDescriptionController;
  final animationsMap = {
    'textFieldOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 9),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'dropDownOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 40,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 20),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'textFieldOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 60,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 30),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 90),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'buttonOnPageLoadAnimation1': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 150,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 20),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 150,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 20),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    problemDescriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).background,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        child: StreamBuilder<UsersRecord>(
          stream: UsersRecord.getDocument(currentUserReference),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                ),
              );
            }
            final columnUsersRecord = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    thickness: 3,
                    indent: 150,
                    endIndent: 150,
                    color: Color(0xFF465056),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: Text(
                      'Book Appointment',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Text(
                            'Fill out the information below in order to book your appointment with our office.',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Text(
                      'Emails will be sent to:',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
                    child: Text(
                      currentUserEmail,
                      style: FlutterFlowTheme.of(context).subtitle1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: TextFormField(
                      controller: personsNameController ??=
                          TextEditingController(
                        text: columnUsersRecord.displayName,
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Booking For',
                        labelStyle: FlutterFlowTheme.of(context).bodyText1,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).background,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).background,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).background,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ).animated(
                        [animationsMap['textFieldOnPageLoadAnimation1']]),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: FlutterFlowDropDown(
                      options: [
                        'Initial session',
                        'I don\'t feel well',
                        'Routine Check-in'
                      ].toList(),
                      onChanged: (val) => setState(() => dropDownValue = val),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).dark600,
                              ),
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).primaryDark,
                        size: 15,
                      ),
                      fillColor: FlutterFlowTheme.of(context).tertiaryColor,
                      elevation: 3,
                      borderColor: Color(0xFF787A7B),
                      borderWidth: 2,
                      borderRadius: 8,
                      margin: EdgeInsetsDirectional.fromSTEB(20, 4, 16, 4),
                      hidesUnderline: true,
                    ).animated([animationsMap['dropDownOnPageLoadAnimation']]),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: TextFormField(
                      controller: problemDescriptionController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Tell us more about the issue',
                        labelStyle: FlutterFlowTheme.of(context).bodyText1,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF646769),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF646769),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).background,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).grayIcon,
                            fontSize: 11,
                          ),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      keyboardType: TextInputType.multiline,
                    ).animated(
                        [animationsMap['textFieldOnPageLoadAnimation2']]),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        await DatePicker.showDatePicker(
                          context,
                          showTitleActions: true,
                          onConfirm: (date) {
                            setState(() => datePicked = date);
                          },
                          currentTime: getCurrentTimestamp,
                          minTime: DateTime(0, 0, 0),
                        );
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 60,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).background,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).background,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: Text(
                                        'Choose Date',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              fontSize: 12,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 4, 0, 0),
                                      child: Text(
                                        dateTimeFormat('MMMMEEEEd', datePicked),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      buttonSize: 46,
                                      icon: Icon(
                                        Icons.date_range_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .dark600,
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ).animated([animationsMap['containerOnPageLoadAnimation']]),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Cancel',
                          options: FFButtonOptions(
                            width: 100,
                            height: 50,
                            color: FlutterFlowTheme.of(context).background,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0x95262D34),
                                      fontWeight: FontWeight.w500,
                                    ),
                            elevation: 0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                        ).animated(
                            [animationsMap['buttonOnPageLoadAnimation1']]),
                        FFButtonWidget(
                          onPressed: () async {
                            final createrecordCreateData =
                                createCreaterecordRecordData(
                              appointmentTime: datePicked,
                              appointmentName:
                                  personsNameController?.text ?? '',
                              appointmentDescription: double.parse(
                                  problemDescriptionController.text),
                              appointmentEmail: currentUserEmail,
                              appointmentType: '',
                            );
                            await CreaterecordRecord.collection
                                .doc()
                                .set(createrecordCreateData);
                            Navigator.pop(context);
                          },
                          text: 'Book Now',
                          options: FFButtonOptions(
                            width: 150,
                            height: 50,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                        ).animated(
                            [animationsMap['buttonOnPageLoadAnimation2']]),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
