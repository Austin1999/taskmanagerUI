import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../widgets/constants.dart';
import '../details.dart';

class AllProjects extends StatelessWidget {
  AllProjects({super.key});

  final List<String> profiledps = [
    'assets/images/dp1.jpg',
    'assets/images/dp2.jpg',
    'assets/images/dp3.jpg',
    'assets/images/dp2.jpg',
    'assets/images/dp1.jpg',
    // 'assets/images/dp-add.png',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: projects.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var projectdata = projects[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    projects: projects[index],
                  ),
                ),
              );
            },
            child: Card(
              color: Colors.white,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            projectdata.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            projectdata.sharedby,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Team',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          SizedBox(
                            height: 30,
                            child: Stack(
                              // fit: StackFit.expand,
                              children: List.generate(
                                profiledps.length,
                                (index) {
                                  return Positioned(
                                    left: index * 18,
                                    child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage(profiledps[index]),
                                      radius: 15,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            projectdata.date,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    CircularPercentIndicator(
                      radius: 60.0,
                      lineWidth: 10.0,
                      animation: true,
                      percent: projectdata.percent,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: projectdata.percentcolor,
                      center: new Text(
                        "${(projectdata.percent * 100).round()}%",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
