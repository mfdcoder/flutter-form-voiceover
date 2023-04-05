import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Text Form Fields
            const Text(
              'Text Form fields',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const Text('Text Form fields do not get a focus'),
            const Text(
              'See issue filed with flutter- https://github.com/flutter/flutter/issues/120894',
            ),
            const SizedBox(height: 10),
            const Text(
              'On windows using NVDA, user is not able set focus or remove focus. \nFocus on actionable widgets can be set using Tab button',
            ),
            const SizedBox(height: 10),
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
                  ),
                ),
                focusNode: _addressLine1,
                onSaved: (value) {
                  _addressLine2.requestFocus();
                },
              ),
            ),
            const SizedBox(height: 10),
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
                  ),
                ),
                focusNode: _addressLine2,
                onSaved: (value) {
                  _city.requestFocus();
                },
              ),
            ),
            const SizedBox(height: 10),
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
                inputFormatters: [LengthLimitingTextInputFormatter(100)],
                focusNode: _city,
                onSaved: (value) {
                  _state.requestFocus();
                },
                decoration: const InputDecoration(
                  hintText: 'City',
                  labelText: 'City',
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
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
                inputFormatters: [LengthLimitingTextInputFormatter(100)],
                focusNode: _state,
                onSaved: (value) {
                  _addressLine1.requestFocus();
                },
                decoration: const InputDecoration(
                  hintText: 'State',
                  labelText: 'State',
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),

            /// Validation Errors
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Validation Errors',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Validation error are only read the first time user clicks the submit button',
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Processing Data'),
                    ),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
