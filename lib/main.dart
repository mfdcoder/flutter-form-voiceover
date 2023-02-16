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


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Form(
            key: _formKey1,
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  Semantics(
                    focusable: true,
                    focused: _addressLine1.hasFocus,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _addressLine1Controller,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text in line 1';
                        }
                        return null;
                      },
                      inputFormatters: [LengthLimitingTextInputFormatter(255)],
                      decoration: const InputDecoration(
                          hintText: 'Address Line 1',
                          labelText: 'Address Line 1',
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _addressLine2Controller,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text in line 2';
                        }
                        return null;
                      },
                      inputFormatters: [LengthLimitingTextInputFormatter(255)],
                      decoration: const InputDecoration(
                          // enabledBorder: true,
                          hintText: 'Address Line 2',
                          labelText: 'Address Line 2',
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey1.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: const Text('Submit')),
                ],
              ),
            ))
      ],
    ));
  }
}
