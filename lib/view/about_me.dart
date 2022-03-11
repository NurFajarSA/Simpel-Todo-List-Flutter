import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:simple_todo_app/styles/assets.dart';
import 'package:simple_todo_app/styles/color_style.dart';
import 'package:simple_todo_app/styles/font_style.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary2,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: secondary1,
        ),
        title: Text("About Me", style: bodyDark),
        centerTitle: true,
        backgroundColor: primary2,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: ternary2,
            height: 1.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 36,
            ),
            Image.asset(
              myProfile,
              scale: 1.5,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Nur Fajar Sayyidul Ayyam",
              style: heading2,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Mobile Developer - UI/UX Designer",
              style: subHeading,
            ),
            const SizedBox(
              height: 8,
            ),
            Card(
              margin: const EdgeInsets.all(24),
              color: primary1,
              elevation: 2,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nickname",
                              style: bodyDark,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Hobby",
                              style: bodyDark,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Social Media",
                              style: bodyDark,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 126,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Fajar",
                              style: text,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Code",
                              style: text,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "nfadjar_",
                              style: text,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Container(
          width: double.infinity,
          height: 44,
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primary3),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)))),
              onPressed: _launchURL,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "More About Me",
                    style: bodyLight,
                  )
                ],
              )),
        ),
        const SizedBox(
          height: 52,
        )
      ],
    );
  }

  void _launchURL() async {
    if (!await launch(myLink)) throw 'Could not launch to link';
  }
}
