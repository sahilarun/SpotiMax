import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotimax/core/app/router/router.dart';
import 'package:spotimax/core/app/themes/themes.dart';
import 'package:spotimax/features/presentation/shared/widgets/search_text_field.dart';
import 'package:spotimax/generated/l10n.dart';

const searchPageHorizontalPadding = 15.0;

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchTextFieldController = TextEditingController();

  @override
  void dispose() {
    searchTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top + 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: searchPageHorizontalPadding),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(S.of(context).downloadFromLink, style: theme.textTheme.titleMedium),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: SearchTextField(
                            theme: theme,
                            height: 45,
                            iconPadding: const EdgeInsets.all(10),
                            hintText: S.of(context).downloadFromLinkTextFieldHintText,
                            controller: searchTextFieldController,
                            onSubmitted: (value) async {
                              if (isSearchRequestValid(value)) {
                                await AutoRouter.of(context).push(DownloadTracksCollectionRouteWithUrl(url: value));
                                searchTextFieldController.clear();
                              } else if (value != '') {
                                searchTextFieldController.clear();
                                showBigTextSnackBar(S.of(context).incorrectLink, context);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  bool isSearchRequestValid(String request) {
    return request.contains('https://open.spotify.com');
  }
}
