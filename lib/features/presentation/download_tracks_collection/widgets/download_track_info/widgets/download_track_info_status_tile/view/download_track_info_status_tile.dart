import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotimax/core/app/colors/colors.dart';
import 'package:spotimax/core/di/injector.dart';
import 'package:spotimax/core/util/failures/failures.dart';
import 'package:spotimax/features/domain/tracks/services/entities/track_with_loading_observer.dart';
import 'package:spotimax/features/presentation/download_tracks_collection/widgets/download_track_info/widgets/download_track_info_status_tile/cubit/download_track_info_status_tile_cubit.dart';
import 'package:spotimax/features/presentation/download_tracks_collection/widgets/download_track_info/widgets/download_track_info_tile.dart';
import 'package:spotimax/generated/l10n.dart';

class DownloadTrackInfoStatusTile extends StatefulWidget {
  const DownloadTrackInfoStatusTile({super.key, required this.trackWithLoadingObserver});

  final TrackWithLoadingObserver trackWithLoadingObserver;

  @override
  State<DownloadTrackInfoStatusTile> createState() => _DownloadTrackInfoStatusTileState();
}

class _DownloadTrackInfoStatusTileState extends State<DownloadTrackInfoStatusTile> {
  late final DownloadTrackInfoStatusTileCubit _infoStatusTileCubit;

  @override
  void initState() {
    _infoStatusTileCubit = injector.get<DownloadTrackInfoStatusTileCubit>(param1: widget.trackWithLoadingObserver);
    super.initState();
  }

  @override
  void dispose() {
    _infoStatusTileCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DownloadTrackInfoStatusTileCubit, DownloadTrackInfoStatusTileState>(
      bloc: _infoStatusTileCubit,
      builder: (context, state) {
        switch (state) {
          case DownloadTrackInfoStatusTileDeffault():
            return DownloadTrackInfoTile(
                title: S.of(context).theTrackIsNotLoaded,
                iconWidget: SvgPicture.asset('resources/images/svg/track_tile/download_icon.svg',
                    height: 23,
                    width: 23,
                    colorFilter: const ColorFilter.mode(onSurfacePrimaryColor, BlendMode.srcIn)));
          case DownloadTrackInfoStatusTileLoading():
            return DownloadTrackInfoTile(
              title: S.of(context).theTrackIsLoading(state.percent != null ? formatDouble(state.percent!) : '...'),
              iconWidget: Container(
                padding: const EdgeInsets.all(0),
                height: 23,
                width: 23,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: primaryColor,
                  value: (() {
                    if (state.percent != null) {
                      return state.percent! / 100;
                    }

                    return null;
                  }).call(),
                ),
              ),
            );

          case DownloadTrackInfoStatusTileLoaded():
            return DownloadTrackInfoTile(
                title: S.of(context).theTrackIsLoaded,
                iconWidget: SvgPicture.asset('resources/images/svg/track_tile/downloaded_icon.svg',
                    height: 23, width: 23, colorFilter: const ColorFilter.mode(primaryColor, BlendMode.srcIn)));
          case DownloadTrackInfoStatusTileFailure():
            return DownloadTrackInfoTile(
                title:
                    S.of(context).downloadError(state.failure is NetworkFailure ? S.of(context).noConnection : state.failure?.message ?? '...'),
                    
                iconWidget: SvgPicture.asset('resources/images/svg/track_tile/error_icon.svg',
                    height: 23, width: 23, colorFilter: const ColorFilter.mode(errorPrimaryColor, BlendMode.srcIn)));
        }
      },
    );
  }

  String formatDouble(double value) {
    final splittedValue = value.toString().split('.');
    final intPart = value.truncate().toString();

    String? doublePart;
    if (splittedValue.length == 2) {
      doublePart = splittedValue[1];
    }

    if (doublePart != null && doublePart.isNotEmpty) {
      return '$intPart.${doublePart.substring(0, min(doublePart.length, 2))}';
    } else {
      return intPart;
    }
  }
}
