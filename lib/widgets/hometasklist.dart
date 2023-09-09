import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:taskmanager/screens/details.dart';

import '../class/progressclass.dart';
import 'constants.dart';

class HomeTaskList extends StatelessWidget {
  const HomeTaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Progress> progressdata = [
      Progress(
        text: 'App Amimation',
        percent: 0.65,
        color: Colors.deepPurpleAccent.shade100,
        icon: const Icon(
          Icons.check_circle_outline_rounded,
          color: Colors.grey,
        ),
      ),
      Progress(
        text: 'Dashboard Design',
        percent: 1.0,
        color: Colors.lightGreen.shade300,
        icon: const Icon(
          Icons.check_circle_rounded,
          color: Colors.lightGreen,
        ),
      ),
      Progress(
        text: 'UI/UX Design',
        percent: 0.30,
        color: Colors.amberAccent.shade100,
        icon: const Icon(
          Icons.check_circle_outline_rounded,
          color: Colors.grey,
        ),
      ),
    ];

    List<String> profiledps = [
      'assets/images/dp1.jpg',
      'assets/images/dp2.jpg',
      'assets/images/dp3.jpg'
    ];

    return ListView.builder(
      itemCount: progressdata.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var progress = progressdata[index];
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsPage(projects: projects[index],),),);
          },
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  progress.icon,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          progress.text,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      LinearPercentIndicator(
                        barRadius: Radius.circular(15.0),
                        width: 200,
                        lineHeight: 15.0,
                        animation: true,
                        percent: progress.percent,
                        progressColor: progress.color,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 30,
                      child: Stack(
                        // fit: StackFit.expand,
                        children: List.generate(
                          profiledps.length,
                          (index) {
                            return Positioned(
                              left: index * 18,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(profiledps[index]),
                                radius: 15,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
