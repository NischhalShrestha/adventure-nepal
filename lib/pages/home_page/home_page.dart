import 'package:adventure_nepal/pages/description_page/desc_page.dart';
import 'package:adventure_nepal/pages/loactions/locations_page.dart';
import 'package:adventure_nepal/provider/adventure_provider.dart';
import 'package:adventure_nepal/services/adventure_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:adventure_nepal/pages/login_page/login_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  int activeIndex = 0;
  final controller = CarouselController();

  @override
  void initState() {
    super.initState();
    fetchAdventure();
  }

  void fetchAdventure() async {
    context.read<AdventureProvider>().loadAdventures();
  }

  Future trying() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    final adventureProvider = Provider.of<AdventureProvider>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 92, 225, 230),
            centerTitle: true,
            leading: const Icon(Icons.menu),
            title: const Text('Adventure Nepal'),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 92, 225, 230)),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then(
                        (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const LoginPage())),
                        ),
                      );
                },
                child: const Icon(Icons.logout_rounded),
              )
            ],
          ),

          const SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Places for Adventure',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          )),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
              child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  itemCount: adventureProvider.adventures.length,
                  itemBuilder: (context, index) {
                    final adventure = adventureProvider.adventures[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LocationsPage(
                                    adventureDesc: adventure,
                                  ))),
                        );
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 40.r,
                              child: Image(
                                image: NetworkImage(
                                    adventure.iconImage.toString()),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.all(2.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(adventure.name.toString()))
                        ],
                      ),
                    );
                  }),
            ),
          ),

          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'About Adventure Sports',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: adventureProvider.adventures.length,
            itemBuilder: (context, index) {
              final adventure = adventureProvider.adventures[index];
              return Container(
                padding: const EdgeInsets.all(8),
                color: Colors.transparent,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => Descpage(
                                  adventureDesc: adventure,
                                ))),
                      );
                    },
                    child: FutureBuilder(
                      future: trying(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          print(snapshot.data);
                          return Container(
                            height: 300,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      adventure.backgroundImage.toString(),
                                    ),
                                    fit: BoxFit.fill),
                                color: const Color.fromARGB(255, 92, 225, 230),
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10.0.h),
                                  child: Text(
                                    adventure.name.toString(),
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    )),
              );
            },
          ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     height: 400,
          //     color: Colors.transparent,
          //     child: MasonryGridView.builder(
          //       padding: const EdgeInsets.all(10.0),
          //       itemCount: 10,
          //       crossAxisSpacing: 15,
          //       mainAxisSpacing: 15,
          //       gridDelegate:
          //           const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 2,
          //       ),
          //       itemBuilder: (context, index) {
          //         return Container(
          //             decoration: BoxDecoration(
          //                 image: const DecorationImage(
          //                     image: AssetImage('lib/image/reverrse.jpg'),
          //                     fit: BoxFit.fill),
          //                 color: const Color.fromARGB(255, 92, 225, 230),
          //                 borderRadius: BorderRadius.circular(15)),
          //             height: 250,
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.end,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: const [
          //                 Padding(
          //                   padding: EdgeInsets.all(10.0),
          //                   child: Text(
          //                     'Adventure',
          //                     textAlign: TextAlign.justify,
          //                     style:
          //                         TextStyle(color: Colors.white, fontSize: 20),
          //                   ),
          //                 ),
          //               ],
          //             ));
          //       },
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
