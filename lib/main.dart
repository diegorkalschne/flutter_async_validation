import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  String? _errorMessage;

  Future<void> validate() async {
    await Future.delayed(const Duration(seconds: 1)); // Async validation

    String text = _controller.text;

    if (text.contains('1')) {
      _errorMessage = 'Input is wrong';
    } else {
      _errorMessage = null;
    }

    setState(() {});
  }

  OutlineInputBorder _border() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Async Validation'), centerTitle: true),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (_) {
                // Call the validation function
                validate();
              },
              autofocus: true,
              controller: _controller,
              decoration: InputDecoration(
                border: _border(),
                enabledBorder: _border(),
                focusedBorder: _border(),
                labelStyle: const TextStyle(color: Colors.white),
                labelText: 'Async Validation',
                hintText: 'Type \'1\' to test',
                // Use errorText from TextFormField to set the error message
                // Set null when validation is correct
                errorText: _errorMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
