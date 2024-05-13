import 'package:flutter/material.dart';
import 'package:secure_gates_admin/widgets/skelton_widget.dart';

class StaffListLoading extends StatelessWidget {
  const StaffListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 7,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: IntrinsicHeight(
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
                            width: 170,
                          ),
                          Shimming(
                            height: 10,
                            width: 40,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Shimming(
                        height: 15,
                        width: 150,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Shimming(
                        height: 15,
                        width: 150,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Shimming(
                        height: 15,
                        width: 150,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
