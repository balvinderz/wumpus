import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wumpus/bloc/wumpus_bloc.dart';
import 'package:wumpus/models/wumpus_block.dart';

class WumpusContainer extends StatefulWidget
{
  final WumPusBlock wumPusBlock;

  WumpusContainer(this.wumPusBlock);

  @override
  _WumpusContainerState createState() => _WumpusContainerState();
}

class _WumpusContainerState extends State<WumpusContainer> {
  WumpusBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of(context);

    // TODO: implement build
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.lightGreen,
            border:
            Border.all(color: Colors.black)),
        child: Stack(children: [
          bloc.isGoldLocation(widget.wumPusBlock.iIndex, widget.wumPusBlock.jIndex)? Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                "assets/ingot.png",
                height: MediaQuery.of(context)
                    .size
                    .height *
                    0.05,
              )) : Container(),
         bloc.showPlayerIcon(widget.wumPusBlock.iIndex,widget.wumPusBlock.jIndex) ? Align(
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
              )) : Container(),

         bloc.showPitIcon(widget.wumPusBlock.iIndex,widget.wumPusBlock.jIndex) ? Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                "assets/wind.png",
                height: MediaQuery.of(context)
                    .size
                    .height *
                    0.05,
              )): Container(),
        ]),
      ),
    );
  }
}