import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final Function(int) onItemSelected;

  const NavBar({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: Color(0xFF1A1A2E),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Hisham\'s Portfolio',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
          Row(
            children: [
              _navButton('Home', 0),
              _navButton('About', 1),
              _navButton('Projects', 2),
              _navButton('Contact', 3),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navButton(String title, int index) {
    return TextButton(
      onPressed: () {
        onItemSelected(index);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}