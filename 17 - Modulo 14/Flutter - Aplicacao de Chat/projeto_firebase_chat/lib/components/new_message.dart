import 'package:flutter/cupertino.dart';

class NewMessage extends StatelessWidget {
  const NewMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('New Message'),
        ],
      ),
    );
  }
}
