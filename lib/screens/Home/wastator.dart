import 'package:flutter/material.dart';

class WastatorAbout extends StatefulWidget {
  const WastatorAbout({super.key});

  @override
  State<WastatorAbout> createState() => _WastatorAboutState();
}

class _WastatorAboutState extends State<WastatorAbout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('About The Project'),
        ),
        body: Column(
          children: [
            const Center(
              child: Text('Abstract:',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                    'The growing desire to solve the grand challenge has become a persistent need. The encumbrance of these challenges inhibits the development of Egypt and obstructs critical ameliorations: recycling garbage and waste for economic purposes and reducing and adapting to the effects of climate change. The problem to be solved is to minimize the effect of the suboptimal waste categorization and sorting practices— coupled with resource depletion— which addresses public health impacts in Mansheya Nasir. The purpose of the study is to maximize the efficiency of recycling through an automated feedback approach. The chosen solution resides in constructing a smart waste segregation station using eco-friendly materials, coped with an automated self-powered operation. It can be concluded from the major findings that the project is profitable as it can maintain the segregation process for the needed time as well as regulate the critical temperature. The prototype design requirements are summarized in optimizing the interior temperature to be less than 3 Celsius degrees or more than the exterior building’s temperature and improving air quality inside the building. After assembling the results, the major conclusion was drawn that the project was found to be capable of reducing the temperature under the required limit.  It was also found that the feedback system was interconnected with app adjustment success in mentoring optimal operation.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
