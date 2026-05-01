import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/theme/app_motion.dart';
import 'package:portfolio/theme/app_typography.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(int) onItemSelected;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NavBar({
    super.key,
    required this.onItemSelected,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 700;

    return Container(
      height: kToolbarHeight,
      padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 20 : 48),
      decoration: const BoxDecoration(
        color: AppColors.ink,
        border: Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: Row(
        children: [
          Text(
            'PORTFOLIO · 2026',
            style: AppType.mono(letterSpacing: 1.6, color: AppColors.mute),
          ),
          const Spacer(),
          if (!isSmallScreen) ...[
            _NavLink(label: 'Home', onTap: () => onItemSelected(0)),
            const SizedBox(width: 28),
            _NavLink(label: 'About', onTap: () => onItemSelected(1)),
            const SizedBox(width: 28),
            _NavLink(label: 'Projects', onTap: () => onItemSelected(2)),
            const SizedBox(width: 28),
            _NavLink(label: 'Contact', onTap: () => onItemSelected(3)),
          ] else
            IconButton(
              icon: const Icon(Icons.menu, color: AppColors.bone),
              onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavLink({required this.label, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedDefaultTextStyle(
          duration: AppMotion.hover,
          curve: AppMotion.easeOut,
          style: GoogleFonts.jetBrainsMono(
            fontSize: 13,
            letterSpacing: 1.2,
            color: _hovered ? AppColors.bone : AppColors.mute,
            fontWeight: FontWeight.w500,
          ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}
