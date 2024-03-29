import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/core/util/use_case/use_case.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/tracks_collection.dart';
import 'package:spotimax/features/domain/tracks_collections/network_tracks_collections/service/network_tracks_collections_service.dart';
class GetTracksCollectionByUrl implements UseCase<Failure, TracksCollection, String> {
  GetTracksCollectionByUrl({required NetworkTracksCollectionsService service}) : _service = service;

  final NetworkTracksCollectionsService _service;

  @override
  Future<Result<Failure, TracksCollection>> call(String url) async {
    return _service.getTracksCollectionByUrl(url);
  }
}
