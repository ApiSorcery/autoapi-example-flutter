import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('用户管理'),
      ),
      body: const Center(
        child: Text('用户管理'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '添加用户',
        child: const Icon(Icons.add),
      ),
    );
  }
}
