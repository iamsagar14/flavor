// Copyright (c) {{current_year}}, Prixa Technologies

import 'package:{{project_name.snakeCase()}}/config/config.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          '${Config.description}',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
