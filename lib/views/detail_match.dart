import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_prac_response/models/matches_model.dart';

class DetailMatchPage extends StatefulWidget {
  MatchesModel listMatches;
  DetailMatchPage({ Key? key, required this.listMatches }) : super(key: key);

  @override
  State<DetailMatchPage> createState() => _DetailMatchPageState();
}

class _DetailMatchPageState extends State<DetailMatchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Detail Match"),
          ),
        ),
        body: Container(
          child: const Center(
            child: Text("Detail Match"),
          ),
        ),
      )
    );
  }
}