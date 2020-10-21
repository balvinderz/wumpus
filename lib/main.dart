import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wumpus/bloc/wumpus_bloc.dart';
import 'package:wumpus/widgets/controls.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_)=> WumpusBloc(),
    child: MaterialApp(
        home: Scaffold(
      body: Wumpus(),
      backgroundColor: Colors.black,
    )),
  ));
}

class Wumpus extends StatelessWidget {
  WumpusBloc bloc;
  @override
  Widget build(BuildContext context) {
    bloc = Provider.of(context);

    // TODO: implement build
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            children: [
              ...bloc.wumpusGrid
                  .map((e) => Expanded(
                        child: Row(
                          children: [
                            ...e.map((f) => Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.lightGreen,
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Stack(children: [
                                      Align(
                                          alignment: Alignment.bottomRight,
                                          child: Image.asset(
                                            "assets/ingot.png",
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                          )),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Transform.rotate(
                                            angle: 3.14*bloc.direction/180,
                                            child: Image.asset(
                                              "assets/player.png",
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.05,
                                            ),
                                          )),

                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Image.asset(
                                            "assets/wind.png",
                                            height: MediaQuery.of(context)
                                                .size
                                                .height *
                                                0.05,
                                          )),
                                    ]),
                                  ),
                                ))
                          ],
                        ),
                      ))
                  .toList()
            ],
          ),
        ),
        Controls()
      ],
    );
  }
}
