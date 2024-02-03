import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/tracks/local_tracks/entities/local_track.dart';
import 'package:spotimax/features/domain/tracks/local_tracks/entities/local_tracks_collection.dart';

abstract class LocalTracksRepository {
  Future<Result<Failure, LocalTrack?>> getLocalTrack(LocalTracksCollection localTracksCollection, String spotifyId);
  Future<Result<Failure, void>> saveLocalTrack(LocalTrack localTrack);
  Future<Result<Failure, void>> removeLocalTrack(LocalTrack localTrack);
}