import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_prac_response/api/data_source.dart';
import 'package:mobile_prac_response/models/matches_model.dart';
import 'package:mobile_prac_response/views/detail_match.dart';

class ListMatchPage extends StatefulWidget {
  ListMatchPage({Key? key}) : super(key: key);

  @override
  State<ListMatchPage> createState() => _ListMatchPageState();
}

class _ListMatchPageState extends State<ListMatchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("List Match"),
      ),
      body: _BuildListMatches(),
    ));
  }
}

_BuildListMatches() {
  return Container(
    padding: EdgeInsets.all(8),
    child: FutureBuilder(
      future: ApiDataSource.instance.loadMatch(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          List<MatchesModel> listMatches = [];
          snapshot.data!.forEach((element) {
            listMatches.add(MatchesModel.fromJson(element));
          });
          return ListView.builder(
            itemCount: listMatches.length,
            itemBuilder: (context, index) {
              String flagUrl = "https://flagcdn.com/256x192/";
              return InkWell(
                child: Card(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(flagUrl + listMatches[index].homeTeam!.name!.toLowerCase().substring(0,2) + ".png"),
                          Text('${listMatches[index].homeTeam!.goals}'),
                          SizedBox(height: 10),
                          Text('-'),
                          SizedBox(height: 10),
                          Text('${listMatches[index].awayTeam!.goals}'),
                          Image.network(flagUrl + listMatches[index].awayTeam!.name!.toLowerCase().substring(0,2) + ".png"),
                        ],
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailMatchPage(
                                listMatches: listMatches[index],
                              )));
                },
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ),
  );
}
