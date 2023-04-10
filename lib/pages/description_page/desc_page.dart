import 'package:adventure_nepal/models/adventure_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Descpage extends StatefulWidget {
  final AdventureModel adventureDesc;
  const Descpage({super.key, required this.adventureDesc});

  @override
  State<Descpage> createState() => _DescpageState();
}

class _DescpageState extends State<Descpage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.adventureDesc.name!),
        centerTitle: true,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                  height: 350,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.adventureDesc.backgroundImage!),
                                fit: BoxFit.fill)),
                      ),
                      Positioned(
                        top: 270,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(10)),
                          height: 45,
                          child: Text(
                            widget.adventureDesc.name!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(),
                child: Text(
                  widget.adventureDesc.description!,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
