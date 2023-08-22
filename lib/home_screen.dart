import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('evalution'),
        backgroundColor: Colors.red,
      ),
      body: const Column(
        children: [
          ListTile(
            leading: Icon(Icons.headphones),
            title: Text('sdfjsadhfdjfhkd'),
            trailing: Icon(Icons.hail),
          ),
          ListTile(
            leading: Icon(Icons.headphones),
            title: Text('sdfjsadhfdjfhkd'),
            trailing: Icon(Icons.hail),
          ),
        ],
      ),
    );
  }
}
