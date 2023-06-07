import 'package:flutter/material.dart';
import 'gallery.dart';
import 'help.dart';
import 'package:wifiapp/wifiapp.dart' as backend;

void main() {
  backend.init();
  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: ConnectScreen(),
      ),
    );
  }
}

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Fuji WiFi Test App",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ConnButtons(),
          ],
        ),
      ),
    );
  }
}

class ConnButtons extends StatefulWidget {
  const ConnButtons({Key? key}) : super(key: key);

  @override
  _ConnButtonsState createState() => _ConnButtonsState();
}

class _ConnButtonsState extends State<ConnButtons> {
  String buttonText = 'Connect';
  String logText = 'Waiting for connection...';

  static const double buttonPadding = 20;
  static const double buttonWidth = 300;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: buttonWidth,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(buttonPadding),
            ),
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 16),
            ),
            onPressed: reconnect,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: buttonWidth,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(buttonPadding),
            ),
            child: Text(
              'Help',
              style: TextStyle(fontSize: 16),
            ),
            onPressed: help,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          logText,
        ),
      ],
    );
  }

  void reconnect() {
    setState(() {
      buttonText = 'Reconnect';
      logText = backend.test();
    });
  }

  void help() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HelpScreen()),
    );
  }
}
