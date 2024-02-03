import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/shared/spotify_repository_request.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/tracks_collection_type.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/tracks_collection.dart';

abstract class NetworkTracksCollectionsRepository {
  Future<Result<Failure, TracksCollection>> getTracksCollectionByTypeAndSpotifyId(
      SpotifyRepositoryRequest spotifyRepositoryRequest, TracksCollectionType type, String spotifyId);
  Future<Result<Failure, TracksCollection>> getTracksCollectionByUrl(SpotifyRepositoryRequest spotifyRepositoryRequest, String url);
}
