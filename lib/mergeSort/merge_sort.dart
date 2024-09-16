import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'merge_sort_controller.dart';


class MergeSortScreen extends StatelessWidget {
  MergeSortScreen({super.key});

  final MergeSortController mergeSortController =
  Get.put(MergeSortController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Merge Sort Visualizer"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.5,
                child: Obx(
                      () => BarChart(
                    swapAnimationCurve: Curves.decelerate,
                    swapAnimationDuration: const Duration(milliseconds: 800),
                    BarChartData(
                      barGroups: mergeSortController.arr
                          .asMap()
                          .map((index, value) => MapEntry(
                        index,
                        BarChartGroupData(
                          x: mergeSortController.arr[index],
                          barRods: [
                            BarChartRodData(
                              fromY: 0,
                              toY: value.toDouble(),
                              color: Colors.blue,
                              width: 20,
                            )
                          ],
                          // showingTooltipIndicators: [0],
                        ),
                      ))
                          .values
                          .toList(),
                      barTouchData: BarTouchData(
                        enabled: true,
                        touchTooltipData: BarTouchTooltipData(
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            // Format tooltip as an integer
                            return BarTooltipItem(
                              '${rod.toY.toInt()}',
                              // Convert double to int here
                              const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            );
                          },
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    "${value.toInt()}",
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                );
                              },
                              interval: 1),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    "${value.toInt()}",
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                );
                              },
                              interval: 10),
                        ),
                        rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Adjust Sorting Speed", style: TextStyle(fontSize: 18),),
                  Obx(() {
                    return Slider(
                      value: mergeSortController.sortSpeed.value,
                      label: mergeSortController.sortSpeed.toInt().toString(),
                      activeColor: Colors.blue,
                      max: 2000,
                      divisions: 20,
                      onChanged: (value) {
                        mergeSortController.sortSpeed.value = value;
                      },
                    );
                  }),
                ],
              ),
              Obx(
                () {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.green),
                          onPressed: () async {
                            await mergeSortController.startSorting();
                          },
                          child: const Text("Start")),
                      mergeSortController.isSorting.value == true ? Container(
                        padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6)
                          ),
                          child: const Text("Sorting array.......", style: TextStyle(color: Colors.white),)) : const SizedBox.shrink(),
                      ElevatedButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.red),
                          onPressed: () {
                            mergeSortController.resetSorting();
                          },
                          child: const Text("Reset")),
                    ],
                  );
                }
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Obx(
                          () {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Array Before Sorting:", style: TextStyle(fontSize: 16),),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(child: Text(mergeSortController.unsortedArray.toString()))
                          ],
                        );
                      }
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                          () {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Array After Sorting:", style: TextStyle(fontSize: 16),),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(child: Text(mergeSortController.arr.toString()))
                          ],
                        );
                      }
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
