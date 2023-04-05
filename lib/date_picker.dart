import 'package:flutter/material.dart';

class MyDatePicker extends StatelessWidget {
  const MyDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Date Picker',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
            'When screen reader in enabled on web, if the first 3 rows of dates are disabled, user cannot select any valid date \nIn this example, user cannot select dates 23rd to 31st',
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              showDatePicker(
                context: context,
                initialDatePickerMode: DatePickerMode.day,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                initialDate: DateTime(2023, 3, 23),
                firstDate: DateTime(2023, 3, 23),
                lastDate: DateTime(2023, 3, 31),
                helpText: 'Open date picker',
                // selectableDayPredicate: (DateTime date) {
                //   return meetingDates.contains(date);
                // },
                builder: (context, _) {
                  return _!;
                },
              );
            },
            child: const Text('Open Calendar'),
          ),
        ],
      ),
    );
  }
}
