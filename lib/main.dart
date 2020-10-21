import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wumpus/bloc/wumpus_bloc.dart';
import 'package:wumpus/widgets/controls.dart';
import 'package:wumpus/widgets/wumpus_container.dart';

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

class Wumpus extends StatefulWidget {
  @override
  _WumpusState createState() => _WumpusState();
}

class _WumpusState extends State<Wumpus> {
  WumpusBloc bloc;
  int i =0,j=0;
  @override
  Widget build(BuildContext context) {
    bloc = Provider.of(context);

    // TODO: implement build
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ...bloc.wumpusGrid
                  .map((e) {
                    return Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ...e.map((f) {
                              return WumpusContainer(f);
                            })
                          ],
                        ),
                      );

                  })
                  .toList()
            ],
          ),
        ),
        Controls()
      ],
    );
  }
}
