import 'package:spotimax/features/domain/tracks/local_tracks/entities/local_tracks_collection_group.dart';
import 'package:spotimax/features/domain/tracks/local_tracks/entities/local_tracks_collection_type.dart';

class LocalTracksCollection {
  LocalTracksCollection({required this.group, required this.spotifyId, required this.type});

  final String spotifyId;
  final LocalTracksCollectionType type;
  final LocalTracksCollectionsGroup group;

  static LocalTracksCollection getAllTracksCollection(String directoryPath) {
    return LocalTracksCollection(
      group: LocalTracksCollectionsGroup(directoryPath: directoryPath), 
      spotifyId: 'allTracksCollection', 
      type: LocalTracksCollectionType.allTracks);
  }
}
