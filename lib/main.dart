import 'package:flutter/material.dart';
import 'widgets/search_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'widgets/uncontained_layout_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mega Mall',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: const MyHomePage(title: 'Mega Mall'),
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
  final List<String> images = [
    "assets/images/carousel_image1.png",
    "assets/images/carousel_image2.png",
    "assets/images/carousel_image3.png",
    "assets/images/carousel_image4.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300),
        child: SizedBox(
          width: 100,
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height * .24,
            width: MediaQuery
                .of(context)
                .size
                .width * 1.0,
            decoration: BoxDecoration(color: Colors.blue),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Navigate back",
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                          iconSize: 32,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.blue,
                          iconSize: 32,
                        ),
                      ],
                    ),
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "This is notifications",
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.notifications_none_rounded),
                          color: Colors.white,
                          iconSize: 32,
                        ),
                        IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "This is user cart",
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.shopping_cart_outlined),
                          color: Colors.white,
                          iconSize: 32,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        spacing: 40,
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
            child: CustomSearchBar(
              onItemSelected: (item) {
                print('Item dipilih: $item');
              },
            ),
          ),

          // Carousel
          CarouselSlider(
            options: CarouselOptions(
              height: 180,
              autoPlay: true,
              viewportFraction: 0.88,
            ),
            items: List.generate(images.length, (index) {
              return UncontainedLayoutCard(
                index: index,
                label: images[index],
                width: 380,
              );
            }),
          ),
          
          // Heading
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Categories",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                ButtonTheme(child: Text("See All"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
