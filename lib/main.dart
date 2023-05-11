import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Local imports
import 'tabbar.dart';
import 'snackbar.dart';
import 'side_menu.dart';
import 'date_picker.dart';
import 'alert_dialog.dart';
import 'radio_button.dart';
import 'detail_screen.dart';
import 'auto_scrolling.dart';
import 'text_form_field.dart';
import 'accessible_navigation.dart';

void main() {
  runApp(const MyApp());
  RendererBinding.instance.setSemanticsEnabled(true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Web Screen Reader Issues Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        // body: const MyCustomForm(),
        body: const MyHomePage(title: 'Semantics Demo'),
      ),
      routes: {
        '/detail-screen': (context) => const MyDetailScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Side Menu
            const Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: SideMenu(),
            ),

            /// Main Content
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Text Form Fields & Validation Errors
                  const MyForm(),

                  /// Alert Dialog
                  const MyAlertDialog(),

                  /// Date Picker
                  const MyDatePicker(),

                  // Snack Bar
                  const MySnackBar(),

                  // Detecting of screen reader is on
                  const MyAccessibileNavigation(),

                  /// Auto Scrolling
                  const AutoScrolling(),

                  /// Navigate to another (child) screen
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Navigate to detail screen',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          "When screen readers are activated and user tries to navigate to it's detail screen or it's child screen, the focus doesn't come on screen",
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              MyDetailScreen.routerName,
                            );
                          },
                          child: const Text('Go To detail screen'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  /// Tab Bar navigation
                  const MyTabBar(),

                  /// Radio Button Inside Dialog
                  const MyRadioDialog(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
