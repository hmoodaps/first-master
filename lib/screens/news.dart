// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class News extends StatelessWidget {
//   final String url;
//
//   News(this.url, {super.key});
//
//   _launchURL() async {
//     final Uri url = Uri.parse('https://flutter.dev');
//     if (!await launchUrl(url)) {
//       throw Exception('Could not launch ');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back),
//         ),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _launchUrl,
//           child: Text('Open in Browser'),
//         ),
//       ),
//     );
//   }
// }
