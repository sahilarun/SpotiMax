import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotimax/core/app/colors/colors.dart';
import 'package:spotimax/core/app/router/router.dart';
import 'package:spotimax/features/presentation/home/view/home_screen.dart';
import 'package:spotimax/features/presentation/settings/widgets/auth_settings/view/auth_settings.dart';
import 'package:spotimax/features/presentation/settings/widgets/download_tracks_settings/view/download_tracks_settings_editor.dart';
import 'package:spotimax/features/presentation/settings/widgets/language_setting/view/language_setting.dart';
import 'package:spotimax/features/presentation/settings/widgets/settings_group.dart';
import 'package:spotimax/generated/l10n.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 55 + MediaQuery.of(context).viewPadding.top,
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top,
            ),
            child: Row(
              children: [
                IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      AutoRouter.of(context).pop();
                    },
                    icon: SvgPicture.asset(
                      'resources/images/svg/back_icon.svg',
                      height: 35,
                      width: 35,
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      S.of(context).settings,
                      style: theme.textTheme.titleSmall,
                    )),
              ],
            ),
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: homePageHorizontalPadding, right: homePageHorizontalPadding, top: 10),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              //const AuthSettings(),
              const DownloadTracksSettingsEditor(),
              SettingsGroup(header: S.of(context).other, settings: [
                const LanguageSetting(),
                SizedBox(
                  height: 40,
                  child: InkWell(
                    splashFactory: NoSplash.splashFactory,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      AutoRouter.of(context).push(const AboutAppRoute());
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(S.of(context).aboutApp),
                        ),
                        const Icon(
                          Icons.info_outline_rounded,
                          color: onBackgroundSecondaryColor,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ])
            ]),
          ),
        )),
      ]),
    );
  }
}
