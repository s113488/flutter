import 'package:app/models/webtoonmodel.dart';
import 'package:app/screens/webtoon_widget.dart';
import 'package:app/services/api_services.dart';
import 'package:flutter/material.dart';

class HomeToon extends StatelessWidget {
  HomeToon({super.key});
  final Future<List<WebtoonModel>> webtoons = ApiServices.getTodaysToons();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          title: const Text(
            '오늘의 웹툰',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ),
        body: FutureBuilder(
          future: webtoons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  const SizedBox(height: 50),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: makeList(snapshot),
                  )),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 40),
        itemBuilder: (context, index) {
          var webtoon = snapshot.data![index];
          return Webtoon(
            id: webtoon.id,
            title: webtoon.title,
            thumb: webtoon.thumb,
          );
        },
        itemCount: snapshot.data!.length);
  }
}
