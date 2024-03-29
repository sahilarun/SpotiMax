import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotimax/core/app/colors/colors.dart';
import 'package:spotimax/core/app/router/router.dart';
import 'package:spotimax/core/app/themes/theme_consts.dart';
import 'package:spotimax/core/di/injector.dart';
import 'package:spotimax/features/presentation/history/bloc/history_bloc.dart';
import 'package:spotimax/generated/l10n.dart';

@RoutePage()
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> with AutoRouteAwareStateMixin<HistoryScreen> {
  final HistoryBloc _historyBloc = injector.get<HistoryBloc>();

  @override
  void didInitTabRoute(TabPageRoute? previousRoute) {
    _historyBloc.add(HistoryBlocLoadHistory());
  }

  @override
  void didChangeTabRoute(TabPageRoute previousRoute) {
    _historyBloc.add(HistoryBlocLoadHistory());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top + 20),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(S.of(context).searchHistory, style: theme.textTheme.titleLarge)],
            ),
          ),
          Expanded(
            child: BlocBuilder<HistoryBloc, HistoryState>(
              bloc: _historyBloc,
              builder: (context, state) {
                if (state is HistoryBlocLoaded) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomScrollView(
                      slivers: [
                        SliverList.builder(
                            itemCount: state.historyTracksCollections.length,
                            itemBuilder: (context, index) {
                              final historyTracksCollection = state.historyTracksCollections[index];
                              return InkWell(
                                splashColor: onSurfaceSplashColor,
                                highlightColor: onSurfaceHighlightColor,
                                onTap: () async {
                                  AutoRouter.of(context)
                                      .push(DownloadTracksCollectionRouteWithHistoryTracksCollection(
                                          historyTracksCollection: historyTracksCollection))
                                      .then((value) => _historyBloc.add(HistoryBlocLoadHistory()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                  child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                                    CachedNetworkImage(
                                      width: 70,
                                      height: 70,
                                      imageUrl: historyTracksCollection.imageUrl ?? '',
                                      placeholder: (context, imageUrl) =>
                                          Image.asset('resources/images/another/loading_track_collection_image.png'),
                                      errorWidget: (context, imageUrl, _) =>
                                          Image.asset('resources/images/another/loading_track_collection_image.png'),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text(
                                          historyTracksCollection.name,
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      child: const Icon(Icons.arrow_forward_ios_rounded,
                                          color: onBackgroundSecondaryColor, size: 27),
                                    )
                                  ]),
                                ),
                              );
                            }),
                        SliverToBoxAdapter(
                          child: Container(height: bottomNavigationBarHeight),
                        )
                      ],
                    ),
                  );
                }

                if (state is HistoryBlocLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Container();
              },
            ),
          )
        ]),
      ),
    );
  }
}
