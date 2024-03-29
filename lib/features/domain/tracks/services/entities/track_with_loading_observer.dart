import 'dart:async';

import 'package:spotimax/features/domain/tracks/download_tracks/entities/loading_track_observer.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/track.dart';

class TrackWithLoadingObserver {
  TrackWithLoadingObserver({required this.track, LoadingTrackObserver? loadingObserver})
      : _loadingObserver = loadingObserver,
        _onTrackObserverChangedStreamController = StreamController<LoadingTrackObserver?>() {
    onLoadingTrackObserverChangedStream = _onTrackObserverChangedStreamController.stream.asBroadcastStream();
  }

  final Track track;

  LoadingTrackObserver? _loadingObserver;
  LoadingTrackObserver? get loadingObserver => _loadingObserver;
  set loadingObserver(LoadingTrackObserver? value) {
    _loadingObserver = value;
    _onTrackObserverChangedStreamController.add(value);
  }

  final StreamController<LoadingTrackObserver?> _onTrackObserverChangedStreamController;
  late final Stream<LoadingTrackObserver?> onLoadingTrackObserverChangedStream;
}
