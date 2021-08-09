import 'package:flutter/material.dart';
import 'package:real_estate_app/constants.dart';
import 'package:real_estate_app/models/projects.dart';
import 'package:real_estate_app/responsive.dart';
import 'package:real_estate_app/widgets/main/project_card.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Our Projects",
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: kDefaultPadding / 2),
        Responsive(
          desktop: buildGridView(
              itemCount: demoProjects.length,
              crossAxisCount: 3,
              childAspectRation: 0.75,
              itemBuilder: (context, index) => ProjectCard(
                    project: demoProjects[index],
                  )),
          mobile: buildGridView(
              itemCount: demoProjects.length,
              crossAxisCount: 1,
              childAspectRation: 0.75,
              itemBuilder: (context, index) => ProjectCard(
                    project: demoProjects[index],
                  )),
          mobileLarge: buildGridView(
              itemCount: demoProjects.length,
              crossAxisCount: 2,
              childAspectRation: 0.75,
              itemBuilder: (context, index) => ProjectCard(
                    project: demoProjects[index],
                  )),
          tablet: buildGridView(
              itemCount: demoProjects.length,
              crossAxisCount: MediaQuery.of(context).size.width < 900 ? 2 : 3,
              childAspectRation: 0.75,
              itemBuilder: (context, index) => ProjectCard(
                    project: demoProjects[index],
                  )),
        )
      ],
    );
  }

  GridView buildGridView(
      {required int itemCount,
      required int crossAxisCount,
      required double childAspectRation,
      required IndexedWidgetBuilder itemBuilder}) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRation,
            crossAxisSpacing: kDefaultPadding,
            mainAxisSpacing: kDefaultPadding),
        itemBuilder: itemBuilder);
  }
}
