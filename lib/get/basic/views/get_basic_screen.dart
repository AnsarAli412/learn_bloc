import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_bloc_flutter/get/basic/controllers/get_basic_controller.dart';

class GetBasicScreen extends StatelessWidget {
  const GetBasicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var getController = Get.put(GetBasicController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Basic"),
      ),
      body: Center(
        child: Obx(() => Text(getController.count.value.toString())),
        // child: GetBuilder<GetBasicController>(
        //   builder: (GetBasicController controller) {
        //     return Text(controller.count.value.toString());
        //   },
        // ),
      ),
      floatingActionButton: Stack(
        children: [
          // Positioned(
          //   top: 100,
          //     right: 100,
          //     child: Obx(() => FloatingActionButton(
          //       onPressed: () =>getController.increment,
          //       child: Icon(Icons.add),
          //     ))),
          Positioned(
              right: 0,
              bottom: 10,
              child: FloatingActionButton(
                onPressed: () {
                  getController.increment();
                },
                child: const Icon(Icons.add),
              )),
          Positioned(
              left: 30,
              bottom: 10,
              child: FloatingActionButton(
                onPressed: () {
                  getController.decrement();
                },
                child: const Icon(Icons.remove),
              )),
        ],
      ),
    );
  }
}
