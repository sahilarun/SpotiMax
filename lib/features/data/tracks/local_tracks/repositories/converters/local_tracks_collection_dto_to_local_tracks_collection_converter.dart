import 'package:spotimax/core/util/converters/simple_converters/value_converter.dart';
import 'package:spotimax/features/data/tracks/local_tracks/models/local_tracks_collection_dto.dart';
import 'package:spotimax/features/data/tracks/local_tracks/repositories/converters/local_tracks_collection_dto_type_to_local_tracks_collection_type_converter.dart';
import 'package:spotimax/features/domain/tracks/local_tracks/entities/local_tracks_collection.dart';

import 'local_tracks_collections_group_dto_to_local_tracks_collections_group_converter.dart';

class LocalTracksCollectionDtoToLocalTracksCollectionConverter
    implements ValueConverter<LocalTracksCollection, LocalTracksCollectionDto> {
  final LocalTracksCollectionDtoTypeToLocalTracksCollectionTypeConverter _collectionTypeConverter =
      LocalTracksCollectionDtoTypeToLocalTracksCollectionTypeConverter();
  final LocalTracksCollectionsGroupDtoToLocalTracksCollectionsGroupConverter _groupsConverter =
      LocalTracksCollectionsGroupDtoToLocalTracksCollectionsGroupConverter();

  @override
  LocalTracksCollection convert(LocalTracksCollectionDto dto) {
    return LocalTracksCollection(
        spotifyId: dto.spotifyId,
        type: _collectionTypeConverter.convert(dto.type),
        group: _groupsConverter.convert(dto.group));
  }

  @override
  LocalTracksCollectionDto convertBack(LocalTracksCollection entity) {
    return LocalTracksCollectionDto(
        spotifyId: entity.spotifyId,
        type: _collectionTypeConverter.convertBack(entity.type),
        group: _groupsConverter.convertBack(entity.group));
  }
}
