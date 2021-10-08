import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../chat_main/chat_main_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../main.dart';
import '../notifs_page/notifs_page_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPageWidget extends StatefulWidget {
  SearchPageWidget({Key key}) : super(key: key);

  @override
  _SearchPageWidgetState createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Image.asset(
                      'assets/images/LogoFull@3x.png',
                      width: 250,
                      height: 38,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(115, 0, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NavBarPage(initialPage: 'AddPostPage'),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotifsPageWidget(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatMainWidget(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.message_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.white,
                      indicatorColor: Colors.white,
                      tabs: [
                        Tab(
                          text: 'Tutti i Post',
                        ),
                        Tab(
                          text: 'Post di chi segui',
                        )
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 14.5, 0, 14.5),
                                  child: Container(
                                    width: double.infinity,
                                    height: 1,
                                    decoration: BoxDecoration(
                                      color: Color(0x55EEEEEE),
                                    ),
                                  ),
                                ),
                                StreamBuilder<List<PostsRecord>>(
                                  stream: queryPostsRecord(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    List<PostsRecord> listViewPostsRecordList =
                                        snapshot.data;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listViewPostsRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewPostsRecord =
                                            listViewPostsRecordList[
                                                listViewIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 12),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(15, 0,
                                                                    0, 0),
                                                        child: Container(
                                                          width: 48,
                                                          height: 48,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            listViewPostsRecord
                                                                .userProfilePic,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child: Text(
                                                          listViewPostsRecord
                                                              .username,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Text(
                                                    dateTimeFormat(
                                                        'relative',
                                                        listViewPostsRecord
                                                            .createdAt),
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Lexend Deca',
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 15, 0),
                                                    child: Icon(
                                                      Icons.keyboard_control,
                                                      color: Colors.white,
                                                      size: 30,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            FlutterFlowVideoPlayer(
                                              path:
                                                  listViewPostsRecord.videoPost,
                                              videoType: VideoType.network,
                                              height: 500,
                                              autoPlay: true,
                                              looping: false,
                                              showControls: true,
                                              allowFullScreen: true,
                                              allowPlaybackSpeedMenu: false,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 20),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    listViewPostsRecord
                                                        .postDescription,
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Lexend Deca',
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 9, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    functions
                                                        .likes(
                                                            listViewPostsRecord)
                                                        .toString(),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Lexend Deca',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                140, 0, 0, 0),
                                                    child: Text(
                                                      listViewPostsRecord
                                                          .numCommentsPost
                                                          .toString(),
                                                      textAlign: TextAlign.end,
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 10),
                                              child: Container(
                                                width: double.infinity,
                                                height: 1,
                                                decoration: BoxDecoration(
                                                  color: Color(0x45EEEEEE),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(15, 0,
                                                                    17, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            final postsUpdateData =
                                                                {
                                                              'num_likes':
                                                                  FieldValue
                                                                      .increment(
                                                                          1),
                                                            };
                                                            await listViewPostsRecord
                                                                .reference
                                                                .update(
                                                                    postsUpdateData);
                                                          },
                                                          child: Icon(
                                                            Icons.thumb_up,
                                                            color: Colors.white,
                                                            size: 30,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    17, 0),
                                                        child: Icon(
                                                          Icons
                                                              .chat_bubble_outline,
                                                          color: Colors.white,
                                                          size: 30,
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.sms,
                                                        color: Colors.white,
                                                        size: 30,
                                                      )
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 15, 0),
                                                    child: Icon(
                                                      Icons
                                                          .bookmark_border_outlined,
                                                      color: Colors.white,
                                                      size: 30,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ListView(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 14.5, 0, 14.5),
                                        child: Container(
                                          width: double.infinity,
                                          height: 1,
                                          decoration: BoxDecoration(
                                            color: Color(0x55EEEEEE),
                                          ),
                                        ),
                                      ),
                                      StreamBuilder<List<PostsRecord>>(
                                        stream: queryPostsRecord(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          List<PostsRecord>
                                              listViewPostsRecordList =
                                              snapshot.data;
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewPostsRecordList.length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewPostsRecord =
                                                  listViewPostsRecordList[
                                                      listViewIndex];
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 12),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Container(
                                                                width: 48,
                                                                height: 48,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  listViewPostsRecord
                                                                      .userProfilePic,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                listViewPostsRecord
                                                                    .username,
                                                                style: FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Text(
                                                          dateTimeFormat(
                                                              'relative',
                                                              listViewPostsRecord
                                                                  .createdAt),
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 15, 0),
                                                          child: Icon(
                                                            Icons
                                                                .keyboard_control,
                                                            color: Colors.white,
                                                            size: 30,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  FlutterFlowVideoPlayer(
                                                    path: listViewPostsRecord
                                                        .videoPost,
                                                    videoType:
                                                        VideoType.network,
                                                    height: 500,
                                                    autoPlay: true,
                                                    looping: false,
                                                    showControls: true,
                                                    allowFullScreen: true,
                                                    allowPlaybackSpeedMenu:
                                                        false,
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        listViewPostsRecord
                                                            .postDescription,
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15, 9, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          functions
                                                              .likes(
                                                                  listViewPostsRecord)
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(140,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            listViewPostsRecord
                                                                .numCommentsPost
                                                                .toString(),
                                                            textAlign:
                                                                TextAlign.end,
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                              fontFamily:
                                                                  'Lexend Deca',
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 10),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 1,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x45EEEEEE),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15,
                                                                          0,
                                                                          17,
                                                                          0),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  final postsUpdateData =
                                                                      {
                                                                    'num_likes':
                                                                        FieldValue
                                                                            .increment(1),
                                                                  };
                                                                  await listViewPostsRecord
                                                                      .reference
                                                                      .update(
                                                                          postsUpdateData);
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .thumb_up,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 30,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          17,
                                                                          0),
                                                              child: Icon(
                                                                Icons
                                                                    .chat_bubble_outline,
                                                                color: Colors
                                                                    .white,
                                                                size: 30,
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons.sms,
                                                              color:
                                                                  Colors.white,
                                                              size: 30,
                                                            )
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 15, 0),
                                                          child: Icon(
                                                            Icons
                                                                .bookmark_border_outlined,
                                                            color: Colors.white,
                                                            size: 30,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
