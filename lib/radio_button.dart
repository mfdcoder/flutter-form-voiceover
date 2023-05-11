import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyRadioDialog extends StatefulWidget {
  const MyRadioDialog({super.key});

  @override
  State<MyRadioDialog> createState() => _MyRadioDialogState();
}

class _MyRadioDialogState extends State<MyRadioDialog> {
  int myValue = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Radio Button',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const Text(
            'When NVDA screen reader in enabled on Windows, user is no longer able to move next element or previous element with NVDA commands via keyboard keys',
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (dialogContext) {
                  return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return AlertDialog(
                      insetPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 50,
                      ),
                      title: Semantics(
                        explicitChildNodes: true,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Hello there!',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.close),
                              ),
                            ),
                          ],
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Divider(),
                          RadioListTile(
                            dense: true,
                            value: 1,
                            groupValue: myValue,
                            onChanged: (int? i) {
                              myValue = 1;

                              setState(() {});
                            },
                            title: const Text('Yes'),
                            contentPadding: kIsWeb
                                ? const EdgeInsets.symmetric(vertical: 3)
                                : EdgeInsets.zero,
                            visualDensity: const VisualDensity(
                              horizontal: -4.0,
                              vertical: -3.0,
                            ),
                          ),
                          RadioListTile(
                            dense: true,
                            value: 2,
                            groupValue: myValue,
                            onChanged: (int? i) {
                              myValue = 2;
                              setState(() {});
                            },
                            title: const Text('No'),
                            contentPadding: kIsWeb
                                ? const EdgeInsets.symmetric(vertical: 3)
                                : EdgeInsets.zero,
                            visualDensity: const VisualDensity(
                              horizontal: -4.0,
                              vertical: -3.0,
                            ),
                          ),
                          RadioListTile(
                            dense: true,
                            value: 3,
                            groupValue: myValue,
                            onChanged: (int? i) {
                              myValue = 3;
                              setState(() {});
                            },
                            title: const Text('None of Above'),
                            contentPadding: kIsWeb
                                ? const EdgeInsets.symmetric(vertical: 3)
                                : EdgeInsets.zero,
                            visualDensity: const VisualDensity(
                              horizontal: -4.0,
                              vertical: -3.0,
                            ),
                          ),
                        ],
                      ),
                    );
                  });
                },
              );
            },
            child: const Text('Open Radio Button Dialog'),
          ),
        ],
      ),
    );
  }
}
