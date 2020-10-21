import 'package:flutter/cupertino.dart';

class WumpusBloc extends ChangeNotifier
{
    int _direction= 0;

  List wumpusGrid;
    void increaseDirection(){
      _direction+=90;
      _direction%=360;
      notifyListeners();

    }


    int get direction => _direction;

  WumpusBloc(){
      wumpusGrid = [];
      for (int i = 0; i < 4; i++) {
        final grid = [];
        for (int j = 0; j < 4; j++) {
          grid.add(0);
        }
        wumpusGrid.add(grid);
      }
    }
}
