import 'package:advance_db_class_mobile/ui/branch_menu.dart';
import 'package:advance_db_class_mobile/ui/cafe_branches.dart';
import 'package:advance_db_class_mobile/ui/complaint_page.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset('assets/video.mp4')
      ..initialize().then(
        (value) {
          _controller.play();
          _controller.setLooping(true);
          setState(() {});
        },
      );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.34),
            child: Image.asset('assets/2byte.png'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              padding: const EdgeInsets.fromLTRB(30, 35, 30, 10),
              decoration: const BoxDecoration(
                  color: Color(0xFF3D73D1),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CafeBranch()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                          color: const Color(0xFF8BB3E8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          shadows: const [
                            BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4))
                          ]),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: 'List of ',
                          style: GoogleFonts.jetBrainsMono(
                              color: Colors.black,
                              letterSpacing: 2,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                            text: '2Byte',
                            style: GoogleFonts.jetBrainsMono(
                                color: Colors.black,
                                letterSpacing: 2,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: ' cafe branches',
                            style: GoogleFonts.jetBrainsMono(
                                color: Colors.black,
                                letterSpacing: 2,
                                fontSize: 16,
                                fontWeight: FontWeight.w400))
                      ])),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BranchMenu(),
                          ));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                          color: const Color(0xFF8BB3E8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          shadows: const [
                            BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4))
                          ]),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Show ',
                            style: GoogleFonts.jetBrainsMono(
                                color: Colors.black,
                                letterSpacing: 2,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: '2Byte',
                            style: GoogleFonts.jetBrainsMono(
                                color: Colors.black,
                                letterSpacing: 2,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: ' cafe menu',
                            style: GoogleFonts.jetBrainsMono(
                                color: Colors.black,
                                letterSpacing: 2,
                                fontSize: 16,
                                fontWeight: FontWeight.w400))
                      ])),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ComplaintPage(),
                          ));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                          color: const Color(0xFF8BB3E8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          shadows: const [
                            BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4))
                          ]),
                      child: Text('Submitting a complaint',
                          style: GoogleFonts.jetBrainsMono(
                              color: Colors.black,
                              letterSpacing: 2,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
