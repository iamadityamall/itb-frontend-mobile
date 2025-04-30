// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// class VideoOfTheDay extends StatefulWidget {
//   const VideoOfTheDay({super.key});
//
//   @override
//   State<VideoOfTheDay> createState() => _VideoOfTheDayState();
// }
//
// class _VideoOfTheDayState extends State<VideoOfTheDay> {
//   late YoutubePlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     const videoUrl = 'https://www.youtube.com/watch?v=K4TOrB7at0Y'; // sample video
//     final videoId = YoutubePlayer.convertUrlToId(videoUrl)!;
//
//     _controller = YoutubePlayerController(
//       initialVideoId: videoId,
//       flags: const YoutubePlayerFlags(
//         autoPlay: false,
//         mute: false,
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Video of the day",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 12),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: YoutubePlayer(
//               controller: _controller,
//               showVideoProgressIndicator: true,
//               progressIndicatorColor: Colors.teal,
//             ),
//           ),
//           const SizedBox(height: 12),
//           const Text(
//             "Celebrating 50 Years – Bank Aisa Dost Jaisa",
//             style: TextStyle(fontSize: 16),
//           ),
//         ],
//       ),
//     );
//   }
// }
