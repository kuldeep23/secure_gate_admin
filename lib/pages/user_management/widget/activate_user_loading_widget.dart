import 'package:flutter/material.dart';
import 'package:secure_gates_admin/widgets/responsive_wrap.dart';
import 'package:secure_gates_admin/widgets/skelton_widget.dart';
import 'package:secure_gates_admin/widgets/vertical_divider_widget.dart';

class ActivateUserLoadingWidget extends StatelessWidget {
  const ActivateUserLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Column(
          children: [
            const IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleSkeleton(
                          size: 70,
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(
                    width: 15,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Shimming(
                                height: 20,
                                width: 150,
                              ),
                              Shimming(
                                height: 15,
                                width: 70,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Shimming(
                            height: 20,
                            width: 50,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Shimming(
                                height: 15,
                                width: 100,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Shimming(
                                height: 15,
                                width: 100,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: Responsive.width(context) * 0.28,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Shimming(
                        height: 15,
                        width: 80,
                      )
                    ],
                  ),
                ),
                const VerticallyDivider(
                  color: Colors.grey,
                  width: 1,
                ),
                SizedBox(
                  width: Responsive.width(context) * 0.28,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Shimming(
                        height: 15,
                        width: 80,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
