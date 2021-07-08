import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/location_controller.dart';

class LoadingView extends GetView<LocationController> {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Authentic SG Weather App'),
      ),
    );
  }
}
