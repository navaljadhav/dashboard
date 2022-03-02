import 'package:dashboard/controllers/counter_controller.dart';
import 'package:dashboard/screens/other.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final CounterController counterController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment();
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("CLicks: ${counterController.conuter.value}"),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(OtherScreen ());
                },
                child: const Text("Open"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
