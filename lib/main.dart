import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
  RendererBinding.instance.setSemanticsEnabled(true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'TextFormField Semantics Voiceover Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        // body: const MyCustomForm(),
        body: const MyHomePage(title: 'Semantics Demo'),
      ),
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
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipcodeController = TextEditingController();

  late FocusNode _addressLine1, _addressLine2, _city, _state, _zipCode;

  @override
  void initState() {
    super.initState();

    _addressLine1 = FocusNode();
    _addressLine2 = FocusNode();
    _city = FocusNode();
    _state = FocusNode();
    _zipCode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the text input controllers when the widget is disposed
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipcodeController.dispose();

    _addressLine1.dispose();
    _addressLine2.dispose();
    _city.dispose();
    _state.dispose();
    _zipCode.dispose();
    super.dispose();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 50,
                    child: Text(
                      'Side Menu',
                      style: TextStyle(fontSize: 18),
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
            ),
          ),
          Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: Column(
              children: [
                Form(
                    key: _formKey1,
                    child: Padding(
                      padding: const EdgeInsets.all(50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Text Form fields',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700)),
                                Text('Text Form fields do not get a focus'),
                                Text(
                                    'See issue filed with flutter- https://github.com/flutter/flutter/issues/120894'),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          Semantics(
                            focusable: true,
                            focused: _addressLine1.hasFocus,
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _addressLine1Controller,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text in line 1';
                                }
                                return null;
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(255)
                              ],
                              decoration: const InputDecoration(
                                  hintText: 'Address Line 1',
                                  labelText: 'Address Line 1',
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                    borderSide: BorderSide(color: Colors.red),
                                  )),
                              focusNode: _addressLine1,
                              onSaved: (value) {
                                _addressLine2.requestFocus();
                              },
                            ),
                          ),
                          Semantics(
                            focusable: true,
                            focused: _addressLine2.hasFocus,
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _addressLine2Controller,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text in line 2';
                                }
                                return null;
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(255)
                              ],
                              decoration: const InputDecoration(
                                  // enabledBorder: true,
                                  hintText: 'Address Line 2',
                                  labelText: 'Address Line 2',
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                    borderSide: BorderSide(color: Colors.red),
                                  )),
                              focusNode: _addressLine2,
                              onSaved: (value) {
                                _city.requestFocus();
                              },
                            ),
                          ),
                          Semantics(
                            focusable: true,
                            focused: _city.hasFocus,
                            child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _cityController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text for city';
                                  }
                                  return null;
                                },
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(100)
                                ],
                                focusNode: _city,
                                onSaved: (value) {
                                  _state.requestFocus();
                                },
                                decoration: const InputDecoration(
                                    hintText: 'City',
                                    labelText: 'City',
                                    errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                      borderSide: BorderSide(color: Colors.red),
                                    ))
                                // ),
                                ),
                          ),
                          Semantics(
                            focusable: true,
                            focused: _state.hasFocus,
                            child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _stateController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text for state';
                                  }
                                  return null;
                                },
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(100)
                                ],
                                focusNode: _state,
                                onSaved: (value) {
                                  _addressLine1.requestFocus();
                                },
                                decoration: const InputDecoration(
                                    hintText: 'State',
                                    labelText: 'State',
                                    errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                      borderSide: BorderSide(color: Colors.red),
                                    ))
                                // ),
                                ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Validation Errors',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700)),
                                Text(
                                    'Validation error are only read the first time user clicks the submit button'),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (_formKey1.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                }
                              },
                              child: const Text('Submit')),
                        ],
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    children: [
                      const Text('Alert Dialog',
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      const Text(
                          'Focus of alert dialog is not automatically set to title'),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          _showMyDialog();
                        },
                        child: const Text('Show Alert Dialog'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    children: [
                      const Text('Date Picker',
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      const Text(
                          'When screen reader in enabled on web, if the first 3 rows of dates are disabled, user cannot select any valid date \nIn this example, user cannot select dates 23rd to 31st'),
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
                ),

                //Snack Bar
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    children: [
                      const Text('Snack Bar',
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      const Text(
                          'Snack bars are not read out by windows screen readers NVDA'),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Yay! A SnackBar!'),
                          ));
                        },
                        child: const Text('Show Snack bar'),
                      ),
                    ],
                  ),
                ),

                //Detecting of screen reader is on
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    children: [
                      const Text('Detecting if screen reader is enabled',
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      const Text(
                          'On web, we are unable to detect if screen readers are enabled using mediaQueryData.accessibleNavigation \nValue is always returned as enabled \nThe mediaQueryData.accessibleNavigation return correct value on mobile app '),
                      Text(
                          'mediaQueryData.accessibleNavigation = ${mediaQueryData.accessibleNavigation}'),
                    ],
                  ),
                ),

//Auto Scrolling
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    children: const [
                      Text('Auto Scrolling with Screen Readers On',
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      Text(
                          'When screen readers are activated, the pages do not always auto scroll even though the focus is on the element that is outside the currently visible area'),
                    ],
                  ),
                ),
                // SingleChildScrollView(
                  // child:
                   ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                      Container(
                        height: 50,
                        color: Colors.amber[600],
                        child: const Center(child: Text('Entry A')),
                      ),
                      Container(
                        height: 50,
                        color: Colors.amber[500],
                        child: const Center(child: Text('Entry B')),
                      ),
                      Container(
                        height: 50,
                        color: Colors.amber[100],
                        child: const Center(child: Text('Entry C')),
                      ),
                    ],
                  ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
