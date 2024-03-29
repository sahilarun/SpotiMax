import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/tracks_collection.dart';
import 'package:spotimax/features/domain/tracks_collections/history_tracks_collectons/entities/history_tracks_collection.dart';
import 'package:spotimax/features/domain/tracks_collections/network_tracks_collections/use_cases/get_tracks_collection_by_type_and_spotify_id.dart';
import 'package:spotimax/features/presentation/download_tracks_collection/blocs/get_tracks_collection/base/get_tracks_collection_bloc.dart';

class GetTracksCollectionByHistoryBloc extends GetTracksCollectionBloc {
  final GetTracksCollectionByTypeAndSpotifyId _getTracksCollection;
  final HistoryTracksCollection _historyTracksCollection;

  GetTracksCollectionByHistoryBloc(
      {required super.addTracksCollectionToHistory,
      required GetTracksCollectionByTypeAndSpotifyId getTracksCollection,
      required HistoryTracksCollection historyTracksCollection})
      : _getTracksCollection = getTracksCollection,
        _historyTracksCollection = historyTracksCollection;

  @override
  Future<Result<Failure, TracksCollection>> loadTracksCollection() =>
      _getTracksCollection.call((_historyTracksCollection.type, _historyTracksCollection.spotifyId));
}
