import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:mobile_prac_response/api/data_source.dart';
import 'package:mobile_prac_response/api/base_network.dart';
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
        title: Text("Piala Dunia 2022"),
      ),
      body: _BuildListMatches(context),
    ));
  }
}

_BuildListMatches(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: FutureBuilder(
      future: BaseNetwork.getList("matches"),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          List<MatchesModel> listMatches = [];
          snapshot.data!.forEach((element) {
            listMatches.add(MatchesModel.fromJson(element));
          });
          return ListView.builder(
            itemCount: listMatches.length,
            itemBuilder: (context, index) {
              MatchesModel matchs = listMatches[index];
              String flagUrl = "https://flagcdn.com/256x192/";
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailMatchPage(
                        id: matchs.id!,
                      ),
                    ),
                  );
                },
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Image.network(
                                flagUrl +
                                    listMatches[index]
                                        .homeTeam!
                                        .name!
                                        .toLowerCase()
                                        .substring(0, 2) +
                                    ".png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text('${listMatches[index].homeTeam!.name}'),
                          ],
                        ),
                        Row(
                          children: [
                            Text('${listMatches[index].homeTeam!.goals.toString()}'),
                            SizedBox(height: 10),
                            Text('-'),
                            SizedBox(height: 10),
                            Text('${listMatches[index].awayTeam!.goals.toString()}'),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Image.network(
                                flagUrl +
                                    listMatches[index]
                                        .awayTeam!
                                        .name!
                                        .toLowerCase()
                                        .substring(0, 2) +
                                    ".png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text('${listMatches[index].awayTeam!.name}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
