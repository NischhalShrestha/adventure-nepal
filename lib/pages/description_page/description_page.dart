import 'package:flutter/material.dart';

import '../../provider/adventure_provider.dart';
import 'package:provider/provider.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    final adventureProvider = Provider.of<AdventureProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButton(
              color: Colors.black,
              onPressed: () => Navigator.pop(context),
            ),
            SizedBox(
                height: 350,
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/image/rafting.jpg',
                              ),
                              fit: BoxFit.fill)),
                    ),
                    const Positioned(
                      left: 150,
                      top: 270,
                      child: Text(
                        'Adventure Nepal',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ],
                )),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Description If you have the guts to fly in the sky like a bird, then don’t miss out these 6 places to experience paragliding in Nepal which will give you the chance to glide and witness the undaunted beauty of this nature’s paradise. These best time to paraglide in Nepal is from September to early June.',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
