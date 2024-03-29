import 'package:spotimax/core/util/converters/simple_converters/value_converter.dart';
import 'package:spotimax/features/data/tracks_collections/history_tracks_collectons/models/history_tracks_collection_dto.dart';
import 'package:spotimax/features/data/tracks_collections/history_tracks_collectons/repositories/converters/tracks_collection_types_converter.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/tracks_collection.dart';

class TracksCollectionToHistoryTracksCollectionDtoConverter
    implements ValueConverter<HistoryTracksCollectionDTO, TracksCollection> {
  final TracksCollectionTypesConverter _tracksCollectionTypesConverter = TracksCollectionTypesConverter();

  @override
  HistoryTracksCollectionDTO convert(TracksCollection tracksCollection) {
    return HistoryTracksCollectionDTO(
        spotifyId: tracksCollection.spotifyId,
        name: tracksCollection.name,
        type: _tracksCollectionTypesConverter.convert(tracksCollection.type),
        imageUrl: tracksCollection.bigImageUrl,
        openDate: DateTime.now());
  }

  @override
  TracksCollection convertBack(HistoryTracksCollectionDTO value) {
    throw UnimplementedError();
  }
}
