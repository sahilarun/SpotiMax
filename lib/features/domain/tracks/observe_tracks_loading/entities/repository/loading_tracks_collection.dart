import 'package:spotimax/features/domain/tracks/observe_tracks_loading/entities/loading_tracks_collection/loading_tracks_collection_controller.dart';
import 'package:spotimax/features/domain/tracks/observe_tracks_loading/entities/repository/loading_tracks_collection_id.dart';

class LoadingTracksCollection {
  LoadingTracksCollection({required this.id, required this.controller});

  final LoadingTracksCollectionId id;
  final LoadingTracksCollectionController controller;
}
