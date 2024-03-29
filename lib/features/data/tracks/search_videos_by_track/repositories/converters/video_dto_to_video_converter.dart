// ignore_for_file: invalid_use_of_internal_member

import 'package:spotimax/core/util/converters/simple_converters/value_converter.dart';
import 'package:spotimax/features/domain/tracks/search_videos_by_track/entities/video.dart' as entity;
import 'package:youtube_explode_dart/youtube_explode_dart.dart' as model;

class VideoDtoToVideoConverter implements ValueConverter<entity.Video, model.Video> {
  @override
  entity.Video convert(model.Video videoDto) {
    return entity.Video(
        duration: videoDto.duration,
        url: videoDto.url,
        title: videoDto.title,
        thumbnailUrl: videoDto.thumbnails.highResUrl,
        viewsCount: videoDto.engagement.viewCount,
        author: videoDto.author);
  }

  @override
  model.Video convertBack(entity.Video value) {
    throw UnimplementedError();
  }
}
