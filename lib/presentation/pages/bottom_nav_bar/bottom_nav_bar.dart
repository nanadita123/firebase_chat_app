import 'package:firebase_chat_app/presentation/export/bottom_nav_exports.dart';
import 'package:firebase_chat_app/presentation/pages/home/home_page.dart';

import '../explore/explore.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;

  final pages = [
    HomePage(),
    Explore(),
    Center(child: Text("Activity")),
    Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],

      bottomNavigationBar: CustomBottomNav(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
      ),
    );
  }
}
