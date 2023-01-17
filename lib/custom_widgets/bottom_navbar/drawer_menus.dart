import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../custom_widgets/language_switcher.dart';
import '../../translations/locale_keys.g.dart';
import '../theme_switcher.dart';
import 'build_drawer_menu.dart';

class DrawerMenuSection extends StatefulWidget {
  const DrawerMenuSection({Key? key}) : super(key: key);

  @override
  State<DrawerMenuSection> createState() => _DrawerMenuSectionState();
}

class _DrawerMenuSectionState extends State<DrawerMenuSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildDrawerMenu(
          leading: const Icon(Icons.light_mode),
          title: LocaleKeys.theme_mode_txt.tr(),
          trailing: const ThemeSwitcher(),
        ),
        BuildDrawerMenu(
          leading: const Icon(Icons.language),
          title: LocaleKeys.language_txt.tr(),
          trailing: const LanguageSwitcher(),
        ),
        BuildDrawerMenu(
          leading: const Icon(Icons.call),
          title: LocaleKeys.support_txt.tr(),
          trailing: null,
        ),
      ],
    );
  }
}
