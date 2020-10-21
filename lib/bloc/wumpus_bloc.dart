import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:wumpus/enum/wumpus_type.dart';
import 'package:wumpus/models/wumpus_block.dart';

class WumpusBloc extends ChangeNotifier
{
  int _direction = 0;
  final _playerPosition = [0, 0];
  final _pitIndexes = [];

  List wumpusGrid;
  int gridSize = 4;

  void increaseDirection() {
    _direction += 90;
    _direction %= 360;
    notifyListeners();
  }
  void decreaseDirection(){
    _direction -= 90;
    _direction %= 360;
    notifyListeners();
  }
  void move(){
    int i = _playerPosition[0];
    int j = _playerPosition[1];

    if(direction ==0)
      {
        if(j+1==gridSize)
          return ;
        j+=1;
      }
    else
    if(direction ==90)
      {
        if(i-1 ==-1)
          return ;
        i-=1;
      }
    else if(direction ==180)
      {
        if(j-1==0)
          return ;
        j-=1;
      }
    else
      {
        if(i+1 ==gridSize)
          return ;
        i+=1;

      }
    _playerPosition[0] = i;
    _playerPosition[1] = j;

    notifyListeners();

  }

  int get direction => _direction;
  WumpusBloc() {
    wumpusGrid = [];
    for (int i = 0; i < 4; i++) {
      final grid = [];
      for (int j = 0; j < 4; j++) {
        grid.add(WumPusBlock(i, j));
      }
      wumpusGrid.add(grid);
    }
    wumpusGrid= wumpusGrid.reversed.toList();
    generatePits();
    //generateGoldLocation();


  }

  generatePits(){
    for(var i =0;i<4;i++)
      {
        final pitIndex = [Random().nextInt(4),Random().nextInt(4)];
        if(_pitIndexes.contains(pitIndex))
          {
            i-=1;

          }
        else
          _pitIndexes.add(pitIndex);

      }
    print(_pitIndexes);

    print(_pitIndexes.length);

  }
  bool showPlayerIcon(int i,j) {
    return (i == _playerPosition[0]) && (j== _playerPosition[1]);
  }
  bool showPitIcon(int i,j){
    bool x,y,z,w;
    for(int i =0;i<_pitIndexes.length;i++)
      {

        x = i == _pitIndexes[i][0] && j-1 == _pitIndexes[i][1];
        y = i == _pitIndexes[i][0] && j+1 == _pitIndexes[i][1];
        z = i+1 == _pitIndexes[i][0] && j == _pitIndexes[i][1];
        w = i-1 == _pitIndexes[i][0] && j == _pitIndexes[i][1];
        bool result = x || y || z|| w;
        if(result)
          return result;

      }

    return false;


  }
  final _goldLocation =[3,3];

  bool isGoldLocation(int i,j)=> _goldLocation[0] == i && _goldLocation[1] ==j;


}
