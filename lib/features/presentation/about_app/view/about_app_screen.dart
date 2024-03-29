import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotimax/features/presentation/home/view/home_screen.dart';
import 'package:spotimax/generated/l10n.dart';

@RoutePage()
class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

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
                      S.of(context).aboutApp,
                      style: theme.textTheme.titleSmall,
                    )),
              ],
            ),
          ),
        ),

        Expanded(
            child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: homePageHorizontalPadding, right: homePageHorizontalPadding, top: 10),
                child: Column(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            S.of(context).developed,
                            style: theme.textTheme.bodyLarge,
                          )),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(top: 10),
                        child: const Text('Sahil Arun'),
                      ),
                    ],
                  ),
                  Container(
                      padding: const EdgeInsets.only(top: 20),
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              S.of(context).specialThanks,
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Xenin',
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(top: 10),
                            child: Text('Harshit', style: theme.textTheme.bodyMedium),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(top: 10),
                            child: Text('Tamish', style: theme.textTheme.bodyMedium),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(top: 10),
                            child: Text('Vishal', style: theme.textTheme.bodyMedium),
                          ),
                        ],
                      ))
                ]),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              alignment: Alignment.bottomCenter,
              child: const Text('Made with ❤️ by Sahil'),
            ),
          ],
        ))
      ]),
    );
  }
}
