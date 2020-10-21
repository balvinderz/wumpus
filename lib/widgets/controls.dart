
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wumpus/bloc/wumpus_bloc.dart';

class Controls extends StatelessWidget
{
  WumpusBloc bloc;
  @override
  Widget build(BuildContext context) {
    bloc = Provider.of(context);
    // TODO: implement build
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Arrows : 1",style: TextStyle(
                color: Colors.white
              ),),
              
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Gold : 1",style: TextStyle(
                      color: Colors.white
                  ),),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Moves : 1",style: TextStyle(
                  color: Colors.white
              ),),

            ),
          ],
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,


                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.blue,
                      child: Transform.rotate(
                          angle: 3.14*180/180,
                          child: IconButton(
                            iconSize:  MediaQuery.of(context).size.height*0.1,
                              onPressed: bloc.increaseDirection,
                              icon: Icon(Icons.directions,size: MediaQuery.of(context).size.height*0.1,color: Colors.white,))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.blue,
                      child: Transform.rotate(
                          angle: 3.14*90/180,
                          child: IconButton(
                              onPressed: (){
                                bloc.move();

                              },
                              iconSize:  MediaQuery.of(context).size.height*0.1,
                              icon: Icon(Icons.arrow_back,size: MediaQuery.of(context).size.height*0.1,color: Colors.white,))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.blue,
                      child: Transform.rotate(
                          angle: 3.14*360/180,
                          child: Icon(Icons.directions,size: MediaQuery.of(context).size.height*0.1,color: Colors.white,)),
                    ),
                  ),

                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
