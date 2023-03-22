// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final void Function(int) onTabChange;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onTabChange,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GNav(
        color: widget.selectedIndex == 0
            ? Theme.of(context).colorScheme.tertiary
            : Theme.of(context).colorScheme.surfaceTint,
        selectedIndex: widget.selectedIndex,
        activeColor: Theme.of(context).primaryColor,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 12,
        onTabChange: (value) => widget.onTabChange(value),
        tabBackgroundGradient: LinearGradient(
          tileMode: TileMode.clamp,
          colors: [
            widget.selectedIndex == 0
                ? Theme.of(context).colorScheme.tertiary
                : Theme.of(context).colorScheme.secondaryContainer,
            widget.selectedIndex == 0
                ? Theme.of(context).colorScheme.onSurface
                : Theme.of(context).colorScheme.surfaceTint,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        padding: const EdgeInsets.all(25),
        tabMargin: const EdgeInsets.symmetric(horizontal: 5),
        tabs: [
          GButton(
            icon: Icons.list_rounded,
            borderRadius: BorderRadius.circular(50),
          ),
          GButton(
            icon: Icons.note_add_rounded,
            borderRadius: BorderRadius.circular(50),
          ),
        ],
      ),
    );
  }
}
