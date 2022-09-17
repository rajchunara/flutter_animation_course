import 'package:flutter/material.dart';
import 'package:flutter_animation_course/animation_screens/Implicit_animation.dart';
import 'package:flutter_animation_course/animation_screens/bounceable.dart';
import 'package:flutter_animation_course/animation_screens/click_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: Scaffold(
        body: PageView(
          controller: controller,
          children: [
            Scaffold(
              body: Center(child: ClickBounceAnimation()),
            ),
            Scaffold(
              body: Center(
                child: Bounceable(
                  child: ContainerBounce(),
                  onTap: () {},
                ),
              ),
            ),
            Scaffold(
              body: Center(
                child: AnimateOpacity(),
              ),
            ),
            Scaffold(
              body: Center(
                child: AlignAnimate(),
              ),
            ),
          ].reversed.toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 26, 28, 35),
          selectedItemColor: const Color.fromARGB(137, 166, 166, 166),
          unselectedItemColor: const Color.fromARGB(137, 166, 166, 166),
          onTap: ((value) {
            if (value == 1) {
              controller.nextPage(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOut);
            } else if (value == 0) {
              controller.previousPage(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOut);
            }
          }),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back),
              label: 'back',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.arrow_forward), label: 'forward'),
          ],
        ),
      ),
      // home: HomePage(
      //   container: const SimpleContainer(),
      // ),
    );
  }
}
