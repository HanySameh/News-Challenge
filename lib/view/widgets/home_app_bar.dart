import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CustomIconButton(
            icon: Icons.menu,
            onTap: () {},
          ),
          const Spacer(),
          CustomIconButton(
            icon: CupertinoIcons.search,
            onTap: () {},
          ),
          const SizedBox(
            width: 10.0,
          ),
          CustomIconButton(
            icon: Icons.notifications,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: CircleAvatar(
        radius: 20.0,
        backgroundColor: Colors.grey[300],
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    );
  }
}
