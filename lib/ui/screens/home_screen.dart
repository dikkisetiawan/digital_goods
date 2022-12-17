import '../widgets/grid_view_widget.dart';
import '/ui/widgets/screen_title.dart';
import '/ui/widgets/search_field.dart';
import '/ui/theme.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: appBarWidget(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: defaultMargin, right: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: defaultMargin),
                const SearchField(),
                const SizedBox(height: defaultMargin),
                const GridViewWidget(),
                Ktitle(
                  title: 'Promo Sepsial',
                  buttonText: 'Lihat Semua',
                  onPressed: () {},
                ),
                const SizedBox(height: defaultMargin),
              ],
            ),
          ),
          const CarousellWidget(),
          Padding(
            padding: const EdgeInsets.only(
                left: defaultMargin, right: defaultMargin),
            child: Ktitle(
              title: 'Promo Sepsial',
              buttonText: 'Lihat Semua',
              onPressed: () {},
            ),
          ),
          // cardWidget()
        ],
      ),
    );
  }

  AppBar appBarWidget() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: kWhiteColor,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hai,',
              style: blueTextStyle,
            ),
            Ktitle(title: 'Mareto'),
          ],
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: kPrimaryColor,
            )),
        const SizedBox(
          width: defaultMargin,
        )
      ],
    );
  }
}

// class cardWidget extends StatelessWidget {
//   String title;
//   Widget? locationInfo;

//   cardWidget(
//       {Key? key,
//       required String title,
//       required String content,
//       required String imagePath})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (BuildContext context, int index) {
//           return Padding(
//             padding: const EdgeInsets.all(30),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(30),
//               child: Container(
//                 decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
//                 child: Column(
//                   children: [
//                     Image.asset(
//                       imagePath,
//                       fit: BoxFit.fill,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 30,
//                       ),
//                       child: titleWidget(title),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(30),
//                       child: Text(
//                         content,
//                         style: const TextStyle(fontSize: 18),
//                       ),
//                     ),
//                     ElevatedButton(
//                         onPressed: () {}, child: const Text('More Info')),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class CarousellWidget extends StatelessWidget {
  const CarousellWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: defaultMargin),
      child: Column(
        children: [
          CarouselSlider(
              items: [
                bannerItem('promo1.jpg', context),
                bannerItem('promo2.jpg', context),
                bannerItem('promo3.jpg', context),
              ],
              options: CarouselOptions(
                  height: 180,
                  enableInfiniteScroll: true,
                  aspectRatio: 16 / 9,
                  disableCenter: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3))),
          Padding(
            padding: const EdgeInsets.only(
                top: defaultMargin / 2, left: defaultMargin),
            child: Row(
              children: [
                dot(),
                dot(),
                dot(),
                dot(),
                dot(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget dot() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: kSecondaryColor, shape: BoxShape.circle),
    );
  }

  Widget bannerItem(String imagePath, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: defaultMargin),
      child: GestureDetector(
        onTap: () {},
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              'assets/$imagePath',
              fit: BoxFit.cover, //agar rounded corner imagenya
            )),
      ),
    );
  }
}
