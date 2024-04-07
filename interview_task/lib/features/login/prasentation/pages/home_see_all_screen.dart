import 'package:flutter/material.dart';
import 'package:interview_task/core/utils/colurs.dart';
import 'package:interview_task/core/utils/textstyle.dart';
import 'package:interview_task/core/utils/ui_data.dart';
import 'package:interview_task/features/login/data/firebase/firebase_store.dart';
import 'package:interview_task/features/login/data/models/song_model.dart';
import 'package:interview_task/features/login/prasentation/pages/audio_play_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interview_task/core/navigation/route_path.dart' as route;

class HomeSeeAllScreen extends StatefulWidget {
  const HomeSeeAllScreen({super.key});

  @override
  State<HomeSeeAllScreen> createState() => _HomeSeeAllScreenState();
}

class _HomeSeeAllScreenState extends State<HomeSeeAllScreen> {
  final FirebaseServices firebaseServices = FirebaseServices();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Padding(
          padding: EdgeInsets.only(left: 112),
          child: Text("Popular",style: AppTextStyle.blackbold()),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp,),
          // tooltip: 'Menu Icon',
          onPressed: () {},
        ),
      ),
      body: StreamBuilder<List<SongModel>>(
        stream:
            firebaseServices.getUserList(), // Use stream from FirebaseServices
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<SongModel> songs = snapshot.data ?? [];
            return ListView.separated(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                SongModel song = songs[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, route.songplayScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8, top: 8, right: 20, left: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 64,
                          width: 91,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(song.name!), // Use song title from SongModel
                            Text(
                                song.time!), // Use song duration from SongModel
                          ],
                        ),
                        SizedBox(width: 125),
                        Image.asset(UIData.Logo,color: Colours.white_grey,),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(height: 5),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(UIData.Home),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(UIData.Book),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(UIData.Grp),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(UIData.keypad),
          ),
        ],
      ),
    );
  }
}
