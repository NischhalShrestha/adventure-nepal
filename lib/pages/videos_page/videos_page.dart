import 'package:adventure_nepal/provider/videos_provider.dart';
import 'package:adventure_nepal/services/videos_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({super.key});

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'ZMUMAeNqGgo',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  void fetchVideos() async {
    context.read<VideosProvider>().loadVideos();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return VideosProvider(VideosService())..loadVideos();
      },
      child: Builder(builder: (context) {
        final videosProvider = Provider.of<VideosProvider>(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Adventure Videos'),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.all(10.h),
            child: ListView.builder(
              itemCount: videosProvider.adventureVideos.length,
              itemBuilder: (context, index) {
                final videos = videosProvider.adventureVideos[index];
                return Container(
                  margin: EdgeInsets.all(8.h),
                  child: Column(
                    children: [
                      YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: videos.id.toString(),
                          flags: const YoutubePlayerFlags(
                            autoPlay: false,
                            mute: false,
                          ),
                        ),
                        showVideoProgressIndicator: true,
                      ),
                      Text(
                        videos.title.toString(),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
