import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/pages/car_management/car_in.dart';
import 'package:secure_gates_admin/pages/car_management/car_out.dart';
import 'package:secure_gates_admin/pages/staff_management/add_staff.dart';
import 'package:secure_gates_admin/pages/staff_management/staff_in.dart';
import 'package:secure_gates_admin/pages/staff_management/staff_out.dart';
import 'package:secure_gates_admin/pages/visitor_management/wrong_visitor.dart';
import 'package:secure_gates_admin/routes/app_routes_constants.dart';
import 'package:secure_gates_admin/services/authentication_service.dart';

import '../car_management/add_car.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);
    Size screenSize() {
      return MediaQuery.of(context).size;
    }

    return Scaffold(
      appBar: AppBar(
        title:  GestureDetector(
          onLongPress: () {
            ref.read(authServiceProvider).signOut();
          },
          child: const Text("Secure Gates Admin"),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onLongPress: () async {
            await ref.watch(authServiceProvider).signOut();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Stack(
                          alignment: Alignment.topLeft,
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            Material(
                              shadowColor: Colors.grey,
                              elevation: 20,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              child: Container(
                                height: 170,
                                width: screenSize().width / 1.025,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5)
                                    /*borderRadius:
                                      BorderRadius.all(Radius.circular(20)),*/
                                    ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () => context.pushNamed(
                                        MyAppRoutes.visitorInScreen,
                                      ),
                                      child: const FeatureItems(
                                        imageURL: 'assets/icons/visitor1.png',
                                        featureName: 'Visitor-In',
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 45.0, bottom: 45.0),
                                      child: VerticalDivider(
                                        color: Colors.grey,
                                        thickness: 0.35,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => context.pushNamed(
                                        MyAppRoutes.visitorOutScreen,
                                      ),
                                      child: const FeatureItems(
                                        imageURL:
                                            'assets/icons/visitor-out.png',
                                        featureName: 'Visitor-Out',
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 45.0, bottom: 45.0),
                                      child: VerticalDivider(
                                        color: Colors.grey,
                                        thickness: 0.35,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const WrongVisitor())),
                                      child: const FeatureItems(
                                        imageURL:
                                            'assets/icons/wrong-visitors.png',
                                        featureName: 'Wrong-Visitor',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                top: -20,
                                left: 10,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 180,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffeabfff),
                                      border: Border.all(
                                          color: Colors.grey, width: 1)),
                                  child: const Text(
                                    "Visitor Management",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ))
                          ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Stack(
                          alignment: Alignment.topLeft,
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            Material(
                              shadowColor: Colors.grey,
                              elevation: 20,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Container(
                                height: 170,
                                width: screenSize().width / 1.025,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5)
                                    /*borderRadius:
                                      BorderRadius.all(Radius.circular(20)),*/
                                    ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const StaffIn())),
                                      child: const FeatureItems(
                                        imageURL: 'assets/icons/staff-in.png',
                                        featureName: 'Staff-In',
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 45.0, bottom: 45.0),
                                      child: VerticalDivider(
                                        color: Colors.grey,
                                        thickness: 0.35,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const StaffOut())),
                                      child: const FeatureItems(
                                        imageURL: 'assets/icons/staff-out.png',
                                        featureName: 'Staff-Out',
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 45.0, bottom: 45.0),
                                      child: VerticalDivider(
                                        color: Colors.grey,
                                        thickness: 0.35,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AddStaff())),
                                      child: const FeatureItems(
                                        imageURL: 'assets/icons/add-staff.png',
                                        featureName: 'Add Staff',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                top: -20,
                                left: 10,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 180,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffeabfff),
                                      border: Border.all(
                                          color: Colors.grey, width: 1)),
                                  child: const Text(
                                    "Staff Management",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ))
                          ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Stack(
                          alignment: Alignment.topLeft,
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            Material(
                              shadowColor: Colors.grey,
                              elevation: 20,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              child: Container(
                                height: 170,
                                width: screenSize().width / 1.025,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5)
                                    /*borderRadius:
                                      BorderRadius.all(Radius.circular(20)),*/
                                    ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CarIn())),
                                      child: const FeatureItems(
                                        imageURL: 'assets/icons/car-in.png',
                                        featureName: 'Car-In',
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 45.0, bottom: 45.0),
                                      child: VerticalDivider(
                                        color: Colors.grey,
                                        thickness: 0.35,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CarOut())),
                                      child: const FeatureItems(
                                        imageURL: 'assets/icons/car-out.png',
                                        featureName: 'Car-Out',
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 45.0, bottom: 45.0),
                                      child: VerticalDivider(
                                        color: Colors.grey,
                                        thickness: 0.35,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AddCar())),
                                      child: const FeatureItems(
                                        imageURL: 'assets/icons/add-car.png',
                                        featureName: 'Add Car',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                top: -20,
                                left: 10,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 180,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffeabfff),
                                      border: Border.all(
                                          color: Colors.grey, width: 1)),
                                  child: const Text(
                                    "Car Management",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ))
                          ]),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 60,
        onDestinationSelected: (value) {
          selectedIndex.value = value;
        },
        selectedIndex: selectedIndex.value,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
            ),
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
            ),
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'Activities',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.emergency,
            ),
            icon: Icon(
              Icons.emergency_outlined,
            ),
            label: 'Emergency',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.settings,
            ),
            icon: Icon(
              Icons.settings_outlined,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class FeatureItems extends StatelessWidget {
  final String imageURL;
  final String featureName;

  const FeatureItems(
      {super.key, required this.imageURL, required this.featureName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            height: 95,
            child: Image(image: AssetImage(imageURL)),
          ),
        ),
        Text(featureName)
      ],
    );
  }
}
