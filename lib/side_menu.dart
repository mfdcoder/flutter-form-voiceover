import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
            child: Text(
              'Side Menu',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 50,
            child: InkWell(
              child: const Text('Home Screen'),
              onTap: () {},
            ),
          ),
          SizedBox(
            height: 50,
            child: InkWell(
              child: const Text('Products'),
              onTap: () {},
            ),
          ),
          SizedBox(
            height: 50,
            child: InkWell(
              child: const Text('Home Screen'),
              onTap: () {},
            ),
          ),
          SizedBox(
            height: 50,
            child: InkWell(
              child: const Text('Categories'),
              onTap: () {},
            ),
          ),
          SizedBox(
            height: 50,
            child: InkWell(
              child: const Text('Cart'),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
