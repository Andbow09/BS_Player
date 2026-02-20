import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'bottom_menu_model.dart';
export 'bottom_menu_model.dart';

class BottomMenuWidget extends StatefulWidget {
  const BottomMenuWidget({
    super.key,
    String? page,
  }) : this.page = page ?? 'Canciones';

  final String page;

  @override
  State<BottomMenuWidget> createState() => _BottomMenuWidgetState();
}

class _BottomMenuWidgetState extends State<BottomMenuWidget> {
  late BottomMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomMenuModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      decoration: BoxDecoration(
        color: Color(0xFFEEDDE9),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 45.0,
            height: 45.0,
            decoration: BoxDecoration(
              color:
                  widget.page == 'songs' ? Colors.white : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (widget.page != 'songs') {
                  context.pushNamed(SongsWidget.routeName);
                }
              },
              child: Icon(
                Icons.music_note,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
            ),
          ),
          Container(
            width: 45.0,
            height: 45.0,
            decoration: BoxDecoration(
              color:
                  widget.page == 'discs' ? Colors.white : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (widget.page != 'discs') {
                  context.pushNamed(DiscsWidget.routeName);
                }
              },
              child: Icon(
                Icons.album,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
            ),
          ),
          Container(
            width: 45.0,
            height: 45.0,
            decoration: BoxDecoration(
              color:
                  widget.page == 'search' ? Colors.white : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (widget.page != 'search') {
                  context.pushNamed(SearchWidget.routeName);
                }
              },
              child: Icon(
                Icons.search,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
            ),
          ),
          Container(
            width: 45.0,
            height: 45.0,
            decoration: BoxDecoration(
              color:
                  widget.page == 'lists' ? Colors.white : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (widget.page != 'lists') {
                    context.pushNamed(ListsWidget.routeName);
                  }
                },
                child: Icon(
                  Icons.playlist_play_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 35.0,
                ),
              ),
            ),
          ),
          Container(
            width: 45.0,
            height: 45.0,
            decoration: BoxDecoration(
              color:
                  widget.page == 'artists' ? Colors.white : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (widget.page != 'artists') {
                  context.pushNamed(ArtistsWidget.routeName);
                }
              },
              child: Icon(
                Icons.person_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
