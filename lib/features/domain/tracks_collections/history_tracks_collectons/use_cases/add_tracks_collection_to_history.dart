import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/core/util/use_case/use_case.dart';
import 'package:spotimax/features/domain/tracks_collections/history_tracks_collectons/repositories/tracks_collections_history_repository.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/tracks_collection.dart';

class AddTracksCollectionToHistory implements UseCase<Failure, void, TracksCollection> {
  AddTracksCollectionToHistory({required TracksCollectionsHistoryRepository historyPlaylistsRepository})
      : _historyPlaylistsRepository = historyPlaylistsRepository;

  final TracksCollectionsHistoryRepository _historyPlaylistsRepository;

  @override
  Future<Result<Failure, void>> call(TracksCollection tracksCollection) async {
    return await _historyPlaylistsRepository.addTracksCollectionToHistory(tracksCollection);
  }
}
