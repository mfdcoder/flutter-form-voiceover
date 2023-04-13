import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tab Bar - Tabs Swicthing',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
            '1. When browser zoom level is 100% and Voiceover is ON, Tab Bar functionality works as intended - Tabs switches upon click',
          ),
          const Text(
            '2. When browser zoom level is 90% or below and Voiceover is ON, then while "navigating/iterating the data-content" under TAB 2 - Tab switches automatically without even clicking on tab, when navigating via VO keyboard commands',
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    height: 40,
                    child: TabBar(
                      tabs: <Tab>[
                        Tab(text: 'Tab 1'.toUpperCase()),
                        Tab(text: 'Tab 2'.toUpperCase()),
                      ],
                      indicatorWeight: 0,
                      indicator: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16),
                      splashBorderRadius: BorderRadius.circular(6),
                      unselectedLabelColor: Colors.black,
                      unselectedLabelStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        /// Tab 1
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              ///
                              Text('One'),
                              Text('Value One'),
                              Divider(),

                              ///
                              Text('Two'),
                              Text('Value Two'),
                              Divider(),

                              ///
                              Text('Three'),
                              Text('Value Three'),
                              Divider(),
                            ],
                          ),
                        ),

                        /// Tab 2
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              ///
                              Text('Four'),
                              Text('Value Four'),
                              Divider(),

                              ///
                              Text('Five'),
                              Text('Value Five'),
                              Divider(),

                              ///
                              Text('Six'),
                              Text('Value Six'),
                              Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
