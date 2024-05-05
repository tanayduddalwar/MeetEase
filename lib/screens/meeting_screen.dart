import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meetease/resources/jitsi_methods.dart';
import 'package:meetease/screens/video_call_screen.dart';
import 'package:meetease/widgets/home_buttons.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final JitsiMeetMethod jitsiMeet = JitsiMeetMethod();

  void createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    JitsiMeetMethod().createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: createNewMeeting,
              text: 'New Meeting',
              icon: Icons.videocam,
            ),
            HomeMeetingButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VideoCallScreen()),
              ),
              text: 'Join Meeting',
              icon: Icons.add_box_rounded,
            ),
            // Removed unused buttons for now
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Create/Join Meetings with just a click!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
