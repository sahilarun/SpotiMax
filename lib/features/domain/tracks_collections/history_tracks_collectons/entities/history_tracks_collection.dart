import 'package:equatable/equatable.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/tracks_collection_type.dart';

class HistoryTracksCollection extends Equatable {
  const HistoryTracksCollection({
    required this.spotifyId,
    required this.type,
    required this.name,
    this.openDate,
    this.imageUrl,
  });

  final String spotifyId;
  final TracksCollectionType type;
  final DateTime? openDate;
  final String name;
  final String? imageUrl;

  @override
  List<Object?> get props => [spotifyId, name, type, imageUrl, openDate];

  static HistoryTracksCollection get likedTracks => const HistoryTracksCollection(
      spotifyId: 'liked_tracks', type: TracksCollectionType.likedTracks, name: 'Liked Tracks');
}
