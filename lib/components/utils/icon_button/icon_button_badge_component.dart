import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:badges/badges.dart' as badges;

class IconButtonBadgeComponent extends StatefulWidget {
  final favoriteUsers;
  const IconButtonBadgeComponent({super.key, required this.favoriteUsers});

  @override
  State<IconButtonBadgeComponent> createState() =>
      _IconButtonBadgeComponentState();
}

class _IconButtonBadgeComponentState extends State<IconButtonBadgeComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: badges.Badge(
          badgeAnimation: badges.BadgeAnimation.fade(
              // colorChangeAnimationDuration: Duration(seconds: 1),
              animationDuration: Duration(seconds: 1)),
          badgeContent: Text(
            widget.favoriteUsers.length.toString(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          badgeStyle: badges.BadgeStyle(
            badgeColor: Color.fromARGB(255, 48, 61, 95),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            borderRadius: BorderRadius.circular(30),
            elevation: 2,
          ),
          position: badges.BadgePosition.topEnd(end: 0, top: 0),
          child: const Icon(
            Icons.favorite,
            size: 35,
            color: Color.fromARGB(255, 236, 30, 30),
          ),
        ));
  }
}
