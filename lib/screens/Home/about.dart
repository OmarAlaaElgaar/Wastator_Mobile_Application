// ignore_for_file: deprecated_member_use

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('About Us'),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                const Center(
                  child: Text('Team 10211',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  width: 370,
                  child: Image.asset('images/Team10211.jpg'),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    padding: const EdgeInsets.all(21),
                    child: const Text(
                        "We are Seniors '25 at STEM High School for Boys - 6th of October. Our team gather students with different fields of interest (Like Biology, Mathematics, Physics, and Robotics) to work on a project that solves one of Egypt's Grand Challenges by making an integration between these variant fields. Our project is built by the teamwork and collaboration of this team and each team member was essential with his unique skills to build this project.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 16)),
                  ),
                ),
                SizedBox(
                  width: 370,
                  child: Image.asset('images/MazenAbdelsttar.jpg'),
                ),
                const Center(
                  child: Text('Mazen Abdelsttar',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    padding: const EdgeInsets.all(21),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'LinkedIn Profile:\n',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          TextSpan(
                            text:
                                'https://www.linkedin.com/in/mazen-abdelsttar-124a8428a/\n',
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                var url =
                                    'https://www.linkedin.com/in/mazen-abdelsttar-124a8428a/';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                          ),
                          const TextSpan(
                            text: 'Email:\n',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          TextSpan(
                            text: 'mazenelmahdy11@gmail.com',
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                var url = 'mailto:mazenelmahdy11@gmail.com';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 370,
                  child: Image.asset('images/MazenHisham.png'),
                ),
                const Center(
                  child: Text('Mazen Hisham',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    padding: const EdgeInsets.all(21),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'LinkedIn Profile:\n',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          TextSpan(
                            text:
                                'https://www.linkedin.com/in/mazen-hisham-711a24282/\n',
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                var url =
                                    'https://www.linkedin.com/in/mazen-hisham-711a24282/';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                          ),
                          const TextSpan(
                            text: 'Email:\n',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          TextSpan(
                            text: 'hishammazen808@gmail.com',
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                var url = 'mailto:hishammazen808@gmail.com';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 370,
                  child: Image.asset('images/OmarAhmed.jpg'),
                ),
                const Center(
                  child: Text('Omar Ahmed',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    padding: const EdgeInsets.all(21),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'LinkedIn Profile:\n',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          TextSpan(
                            text:
                                'https://www.linkedin.com/in/omar-helmy-3252b4281/\n',
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                var url =
                                    'https://www.linkedin.com/in/omar-helmy-3252b4281/';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                          ),
                          const TextSpan(
                            text: 'Email:\n',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          TextSpan(
                            text: 'omarhaddad895@gmail.com',
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                var url = 'mailto:omarhaddad895@gmail.com';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 370,
                  child: Image.asset('images/OmarAlaa.jpg'),
                ),
                const Center(
                  child: Text('Omar Alaa',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    padding: const EdgeInsets.all(21),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'LinkedIn Profile:\n',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          TextSpan(
                            text: 'https://www.linkedin.com/in/omarelgaar/\n',
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                var url =
                                    'https://www.linkedin.com/in/omarelgaar/';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                          ),
                          const TextSpan(
                            text: 'Email:\n',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          TextSpan(
                            text: 'omar.elgaar01@gmail.com',
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                var url = 'mailto:omar.elgaar01@gmail.com';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
