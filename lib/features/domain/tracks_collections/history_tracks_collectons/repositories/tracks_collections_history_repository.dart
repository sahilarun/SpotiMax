import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/tracks_collections/history_tracks_collectons/entities/history_tracks_collection.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/tracks_collection.dart';

abstract class TracksCollectionsHistoryRepository {

  Future<Result<Failure,List<HistoryTracksCollection>?>> getTracksCollectionsHistory(); 
  Future<Result<Failure, void>> addTracksCollectionToHistory(TracksCollection tracksCollection);
  Future<Result<Failure, void>> deleteTracksCollectionFromHistory(HistoryTracksCollection historyTracksCollection);
  
}