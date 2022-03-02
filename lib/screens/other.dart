import 'package:dashboard/controllers/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherScreen extends StatelessWidget {
  OtherScreen({Key? key}) : super(key: key);
  final CounterController _counterController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counterController.increment();
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
          child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("CLicks: ${_counterController.conuter.value}"),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Close"),
            )
          ],
        ),
      )),
    );
  }
}
