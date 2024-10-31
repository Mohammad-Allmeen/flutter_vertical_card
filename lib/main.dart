import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: '',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<String> titles = [
    'Mecca',
    'Medina',
    'Al-Aqsa',
    'Sheikh Zayed',
    'Jama Masjid',
    'The Blue Mosque',
    'Astana'

  ];

  final List<String> imagePath =
  [
    'https://images.pexels.com/photos/5004002/pexels-photo-5004002.jpeg?auto=compress&cs=tinysrgb&w=1200',
    'https://images.pexels.com/photos/11118835/pexels-photo-11118835.jpeg?auto=compress&cs=tinysrgb&w=1200',
    'https://images.pexels.com/photos/23557054/pexels-photo-23557054/free-photo-of-dome-of-the-rock-in-old-city-of-jerusalem.jpeg?auto=compress&cs=tinysrgb&w=1200',
    'https://images.pexels.com/photos/2406731/pexels-photo-2406731.jpeg?auto=compress&cs=tinysrgb&w=1200',
    'https://images.pexels.com/photos/3624566/pexels-photo-3624566.jpeg?auto=compress&cs=tinysrgb&w=1200',
    'https://images.pexels.com/photos/19328486/pexels-photo-19328486/free-photo-of-view-of-the-blue-mosque-in-istanbul-turkey.jpeg?auto=compress&cs=tinysrgb&w=1200',
    'https://media.gettyimages.com/id/1770465602/photo/astana-kazakhstan-an-interior-view-of-astana-grand-mosque-the-biggest-mosque-of-central-asia.jpg?s=612x612&w=0&k=20&c=cju_wVPtUl2Sgr2FXjDO1qiEKwdAkQ7G5xcuWlBxEmI=',

  ];

  final List<String> urls = [
    'https://thepilgrim.co/masjid-al-haram/#:~:text=Allah%20SWT%20then%20commanded%20Prophet,through%20several%20renovations%20and%20expansions.',
    'https://zamzam.com/blog/history-of-masjid-e-nabawi/',
    'https://study.com/academy/lesson/al-aqsa-mosque-jerusalem-history-construction-purpose.html',
    'https://visitabudhabi.ae/en/plan-your-trip/article-hub/facts-about-szgm',
    'https://www.archnet.org/sites/1571',
    'https://www.britannica.com/topic/Blue-Mosque-Istanbul-Turkey',
    'https://archello.com/project/nur-sultan-grand-mosque',
  ];
  List<Widget> generateImages(List<String> imagePath, double borderRadius) {
    return imagePath.map((path) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          child: CachedNetworkImage(
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
            const Icon(Icons.error_outline),
            imageUrl: path,
            fit: BoxFit.fill,),
          // child: Image.network(path, fit: BoxFit.fill),
        ),
      );
    }).toList();
  }

  //Function to open the URL in the browser
  void _launchURL(String url ) async {
    final Uri uri= Uri.parse(url);
    if(await canLaunchUrl(uri)){
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
    else
      {
        throw 'could not launch $url';
      }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageWidget = generateImages(imagePath, 16.0); // image generated above is stored in the variable imageWidget
    return Scaffold(
        appBar: AppBar(
          title: Text('Masjids in the World', style: TextStyle(fontWeight: FontWeight.bold),),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(child: Column(
          children: <Widget>[
            Expanded(child: VerticalCardPager(
              titles: titles,
              // An array of strings that serves as the title of each card. Each item in the titles list corresponds to a title on a specific card.
              images: imageWidget,
              // An array of widgets, usually Image widgets, representing the images displayed on each card.
              textStyle: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              align: ALIGN.CENTER,
              onPageChanged: (
                  page) { // A callback function triggered when a new page is swiped to.
                // this Function: Allows you to perform actions when the page changes. For example, you could update other parts of the UI or log the current page.
              },
              // onSelectedItem - Purpose: A callback function triggered when a user taps or selects a card.
              // Function: Lets you handle events based on the selected card. This could involve navigating to a different screen or displaying additional details related to the selected card.
              onSelectedItem: (index) {
                _launchURL(urls[index]);
              },

            ),
            ),
            SizedBox(height: 5,),

          ],
        )
        )
    );
  }
}



// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:vertical_card_pager/vertical_card_pager.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(
//         title: '',
//       ),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final List<String> titles = [
//     'Mecca',
//     'Medina',
//     'Al-Aqsa',
//     'Sheikh Zayed',
//     'Jama Masjid',
//     'The Blue Mosque',
//     'Astana',
//   ];
//
//   final List<String> imagePath = [
//     'https://images.pexels.com/photos/5004002/pexels-photo-5004002.jpeg?auto=compress&cs=tinysrgb&w=1200',
//     'https://images.pexels.com/photos/11118835/pexels-photo-11118835.jpeg?auto=compress&cs=tinysrgb&w=1200',
//     'https://images.pexels.com/photos/23557054/pexels-photo-23557054/free-photo-of-dome-of-the-rock-in-old-city-of-jerusalem.jpeg?auto=compress&cs=tinysrgb&w=1200',
//     'https://images.pexels.com/photos/2406731/pexels-photo-2406731.jpeg?auto=compress&cs=tinysrgb&w=1200',
//     'https://images.pexels.com/photos/3624566/pexels-photo-3624566.jpeg?auto=compress&cs=tinysrgb&w=1200',
//     'https://images.pexels.com/photos/19328486/pexels-photo-19328486/free-photo-of-view-of-the-blue-mosque-in-istanbul-turkey.jpeg?auto=compress&cs=tinysrgb&w=1200',
//     'https://www.shutterstock.com/image-photo/nursultan-kazakhstan-largest-big-mosque-260nw-2221426541.jpg',
//   ];
//
//   final List<String> urls = [
//     'https://thepilgrim.co/masjid-al-haram/#:~:text=Allah%20SWT%20then%20commanded%20Prophet,through%20several%20renovations%20and%20expansions.',
//     'https://zamzam.com/blog/history-of-masjid-e-nabawi/',
//     'https://study.com/academy/lesson/al-aqsa-mosque-jerusalem-history-construction-purpose.html',
//     'https://visitabudhabi.ae/en/plan-your-trip/article-hub/facts-about-szgm',
//     'https://www.archnet.org/sites/1571',
//     'https://www.britannica.com/topic/Blue-Mosque-Istanbul-Turkey',
//     'https://archello.com/project/nur-sultan-grand-mosque',
//   ];
//
//   List<Widget> generateImages(List<String> imagePath, double borderRadius, List<String> titles) {
//     return List.generate(imagePath.length, (index) {
//       return ClipRRect(
//         borderRadius: BorderRadius.circular(borderRadius),
//         child: Stack(
//           children: [
//             CachedNetworkImage(
//               placeholder: (context, url) => const CircularProgressIndicator(),
//               errorWidget: (context, url, error) => const Icon(Icons.error_outline),
//               imageUrl: imagePath[index],
//               fit: BoxFit.fill,
//               width: double.infinity,
//               height: double.infinity,
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                // color: Colors.black54, // Semi-transparent background for text
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   titles[index],
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
//
//   // Function to open the URL in the browser
//   void _launchURL(String url) async {
//     final Uri uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri, mode: LaunchMode.externalApplication);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> imageWidget = generateImages(imagePath, 16.0, titles);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Masjids in the World',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: VerticalCardPager(
//                 titles: titles,
//                 images: imageWidget,
//                 textStyle: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 align: ALIGN.CENTER,
//                 onPageChanged: (page) {
//                   // This Function allows you to perform actions when the page changes.
//                 },
//                 onSelectedItem: (index) {
//                   _launchURL(urls[index]);
//                 },
//               ),
//             ),
//             SizedBox(height: 5),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
