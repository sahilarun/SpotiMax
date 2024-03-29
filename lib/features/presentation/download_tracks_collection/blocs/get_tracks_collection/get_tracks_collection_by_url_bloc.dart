import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/tracks_collection.dart';
import 'package:spotimax/features/domain/tracks_collections/network_tracks_collections/use_cases/get_tracks_collection_by_url.dart';
import 'package:spotimax/features/presentation/download_tracks_collection/blocs/get_tracks_collection/base/get_tracks_collection_bloc.dart';

class GetTracksCollectionByUrlBloc extends GetTracksCollectionBloc {
  final GetTracksCollectionByUrl _getTracksCollection;
  final String _url;

  GetTracksCollectionByUrlBloc(
      {required super.addTracksCollectionToHistory,
      required GetTracksCollectionByUrl getTracksCollection,
      required String url})
      : _getTracksCollection = getTracksCollection,
        _url = url;

  @override
  Future<Result<Failure, TracksCollection>> loadTracksCollection() => _getTracksCollection.call(_url);
}
