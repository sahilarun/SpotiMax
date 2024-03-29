import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:spotify/spotify.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/track.dart';
import 'package:spotimax/features/domain/tracks_collections/history_tracks_collectons/entities/history_tracks_collection.dart';
import 'package:spotimax/features/presentation/about_app/view/about_app_screen.dart';
import 'package:spotimax/features/presentation/change_source_video/view/change_source_video_screen.dart';
import 'package:spotimax/features/presentation/history/view/history_screen.dart';
import 'package:spotimax/features/presentation/home/view/home_screen.dart';
import 'package:spotimax/features/presentation/main/view/main_screen.dart';
import 'package:spotimax/features/presentation/download_tracks_collection/view/download_tracks_collection_screen.dart';
import 'package:spotimax/features/presentation/settings/view/settings_screen.dart';

import 'package:spotimax/features/presentation/home/view/search.dart';

part 'router.gr.dart';            
              
@AutoRouterConfig()      
class AppRouter extends _$AppRouter {      
    
  @override      
  List<AutoRoute> get routes => [
    AutoRoute(page: MainRoute.page, path: '/', children: [
      AutoRoute(page: HomeRoute.page, path: 'home'),
      AutoRoute(page: SearchRoute.page, path: 'search'),
      AutoRoute(page: HistoryRoute.page, path: 'history'),
    ]),
    AutoRoute(page: DownloadTracksCollectionRouteWithHistoryTracksCollection.page),
    AutoRoute(page: DownloadTracksCollectionRouteWithUrl.page),
    AutoRoute(page: ChangeSourceVideoRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: AboutAppRoute.page),
  ];
 }     