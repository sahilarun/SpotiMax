import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/failures/failures.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/tracks_collection.dart';
import 'package:spotimax/features/domain/tracks_collections/history_tracks_collectons/use_cases/add_tracks_collection_to_history.dart';

part 'get_tracks_collection_event.dart';
part 'get_tracks_collection_state.dart';

abstract class GetTracksCollectionBloc extends Bloc<GetTracksCollectionEvent, GetTracksCollectionState> {
  final AddTracksCollectionToHistory _addTracksCollectionToHistory;

  TracksCollection? _loadedTracksCollection;
  bool _isTracksCollectionLoading = false;

  GetTracksCollectionBloc({required AddTracksCollectionToHistory addTracksCollectionToHistory})
      : _addTracksCollectionToHistory = addTracksCollectionToHistory,
        super(GetTracksCollectionLoading()) {
    on<GetTracksCollectionLoad>(_onLoad);
  }

  Future<void> _onLoad(GetTracksCollectionLoad event, Emitter<GetTracksCollectionState> emit) async {
    if (_isTracksCollectionLoading) {
      return;
    }

    emit(GetTracksCollectionLoading());

    _isTracksCollectionLoading = true;
    final loadTracksCollectionResult = await loadTracksCollection();

    if (loadTracksCollectionResult.isSuccessful) {
      _loadedTracksCollection = loadTracksCollectionResult.result!;
      _addTracksCollectionToHistory.call(_loadedTracksCollection!);

      emit(GetTracksCollectionLoaded(tracksCollection: _loadedTracksCollection!));
    } else {
      if (loadTracksCollectionResult.failure is NetworkFailure) {
        emit(GetTracksCollectionNetworkFailure());
      } else {
        emit(GetTracksCollectionFailure(failure: loadTracksCollectionResult.failure));
      }
    }
    _isTracksCollectionLoading = false;
  }

  Future<Result<Failure, TracksCollection>> loadTracksCollection();
}
