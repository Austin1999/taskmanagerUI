import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taskmanager/screens/projects/allprojects.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final PageController pagecontroller = PageController(initialPage: 0);
  int _pageindex = 0;
  final pageView = [
    AllProjects(),
    const Center(
      child: Text('Ongoing Page'),
    ),
    const Center(
      child: Text('Completed'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  Fluttertoast.showToast(
                      msg: "You Pressed Search Button",
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 16.0);
                },
                icon: const Icon(CupertinoIcons.search),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'Project',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
          ),
          const SizedBox(
            height: 15.0,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(_pageindex == 0
                        ? Colors.deepPurpleAccent.shade100
                        : Colors.white)),
                onPressed: () {
                  setState(() {
                    pagecontroller.animateToPage(0,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInCirc);
                  });
                },
                child: Text(
                  'All',
                  style: TextStyle(
                    color: _pageindex == 0 ? Colors.white : Colors.black,
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(_pageindex == 1
                        ? Colors.deepPurpleAccent.shade100
                        : Colors.white)),
                onPressed: () {
                  setState(() {
                    pagecontroller.animateToPage(1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  });
                },
                child: Text(
                  'Ongoing',
                  style: TextStyle(
                    color: _pageindex == 1 ? Colors.white : Colors.black,
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(_pageindex == 2
                        ? Colors.deepPurpleAccent.shade100
                        : Colors.white)),
                onPressed: () {
                  setState(() {
                    pagecontroller.animateToPage(2,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  });
                },
                child: Text(
                  'Completed',
                  style: TextStyle(
                    color: _pageindex == 2 ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            flex: 1,
            child: PageView(
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    _pageindex = value;
                    print(_pageindex);
                  });
                },
                controller: pagecontroller,
                children: pageView),
          ),
        ],
      ),
    );
  }
}
