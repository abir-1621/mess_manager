import 'package:flutter/material.dart';

import '../../utils/globalcolors.dart';


class DrawerHeaderSection extends StatefulWidget {
  const DrawerHeaderSection({Key? key}) : super(key: key);

  @override
  State<DrawerHeaderSection> createState() => _DrawerHeaderSectionState();
}

class _DrawerHeaderSectionState extends State<DrawerHeaderSection> {
  @override
  Widget build(BuildContext context) {
    return const DrawerHeader(
      decoration: BoxDecoration(
        color: appPrimaryCol,
      ),
      child: CircleAvatar(
        backgroundImage: NetworkImage(
            "https://images.unsplash.com/photo-1671726203454-5d7a5370a9f4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
      ),
    );
  }
}
