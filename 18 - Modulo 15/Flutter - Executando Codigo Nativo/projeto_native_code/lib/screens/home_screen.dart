import 'package:flutter/material.dart';
import 'package:projeto_native_code/components/adaptative_field.dart';
import 'package:projeto_native_code/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _a = 0;
  int _b = 0;
  int _sum = 0;

  void _calculateSum() {
    try {
      FocusScope.of(context).unfocus();

      setState(() {
        _sum = _a + _b;
      });

      logs.sucess('Sum of $_a and $_b is $_sum');
    } catch (e) {
      logs.error('Error while summing numbers! Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Native Code'),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          'Sum of two numbers',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AdaptativeTextField(
                          label: 'First number',
                          onChanged: (value) {
                            setState(() {
                              _a = int.tryParse(value) ?? 0;
                            });
                          },
                          backgroundColor: Colors.grey[100],
                          borderRadius: 10,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 20),
                        AdaptativeTextField(
                          label: 'Second number',
                          onChanged: (value) {
                            setState(() {
                              _b = int.tryParse(value) ?? 0;
                            });
                          },
                          onSubmitted: (_) => _calculateSum(),
                          backgroundColor: Colors.grey[100],
                          borderRadius: 10,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _calculateSum,
                          child: const Text('Sum'),
                        ),
                        const SizedBox(height: 50),
                        if (_sum > 0)
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Sum: $_sum',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
