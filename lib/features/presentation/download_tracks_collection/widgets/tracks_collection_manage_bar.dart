import 'package:flutter/material.dart';
import 'package:spotimax/core/app/colors/colors.dart';
import 'package:spotimax/features/presentation/shared/widgets/search_text_field.dart';
import 'package:spotimax/generated/l10n.dart';

class TracksCollectionManageBar extends StatelessWidget {
  final void Function(String newQuery) _onFilterQueryChanged;
  final void Function() _onAllDownloadButtonClicked;

  const TracksCollectionManageBar(
      {super.key,
      required void Function(String) onFilterQueryChanged,
      required void Function() onAllDownloadButtonClicked})
      : _onFilterQueryChanged = onFilterQueryChanged,
        _onAllDownloadButtonClicked = onAllDownloadButtonClicked;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: SearchTextField(
            theme: theme,
            onChanged: _onFilterQueryChanged,
            height: 35,
            cornerRadius: 10,
            hintText: S.of(context).searchByName,
            textStyle: theme.textTheme.bodySmall?.copyWith(color: onPrimaryColor),
            hintStyle: theme.textTheme.bodySmall?.copyWith(color: onSearchFieldColor),
          ),
        ),
        Container(
          height: 35,
          width: 150,
          padding: const EdgeInsets.only(left: 10),
          child: ElevatedButton(
            onPressed: _onAllDownloadButtonClicked,
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
            child: Text(S.of(context).downloadAll, style: theme.textTheme.bodySmall!.copyWith(color: onPrimaryColor)),
          ),
        )
      ],
    );
  }
}
