import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/homecard.dart';
import '../widgets/hometasklist.dart';

// Home Screen

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? dropdownValue;

// List of Homepage Cards
  List<HomeCard> cards = [
    const HomeCard(
      color: Colors.orange,
      icon: Icons.watch_later_outlined,
      text: 'In Progress',
    ),
    const HomeCard(
      color: Colors.deepPurpleAccent,
      icon: Icons.cached,
      text: 'Ongoing',
    ),
    const HomeCard(
      color: Colors.greenAccent,
      icon: Icons.check_circle_outline,
      text: 'Completed',
    ),
    const HomeCard(
      color: Colors.redAccent,
      icon: Icons.cancel_outlined,
      text: 'Canceled',
    )
  ];

  // List of type Progress Class

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/dp.jpg'),
                ),
                IconButton(
                  onPressed: () {
                    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //   content: Text("You Pressed Search Button"),
                    // ));
                    Fluttertoast.showToast(
                        msg: "You Pressed Search Icon",
                        toastLength: Toast.LENGTH_SHORT,
                        fontSize: 16.0);
                  },
                  icon: const Icon(CupertinoIcons.search),
                ),
              ],
            ),
            const Text(
              'Hello',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              'Alex Marconi',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 22),
            ),
            const SizedBox(
              height: 15.0,
            ),
            // Home Screen Card Grid
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 16 / 9,
              crossAxisCount: 2,
              shrinkWrap: true,
              children: cards.map((e) => e).toList(),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Daily Task',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  width: 100.0,
                  child: DropdownButtonFormField<String>(
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    hint: const Text('All Task'),
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['All Task', 'Task 1']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
            const HomeTaskList()
          ],
        ),
      ),
    );
  }
}
