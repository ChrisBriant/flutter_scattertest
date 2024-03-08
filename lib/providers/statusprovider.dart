import 'package:flutter/foundation.dart';

enum ActivityName {plantSeed, viewGarden, waterPlants,addThought, viewThoughts, breathOfJoy,fourseveneight,boxbreathing,moonbreathing,onenessalbum, addemotion, viewemotions, addWorries, openWorrySafe,setWorryPeriod, addWorryDoll, retrieveWorryDolls, meditateemotion, runmeditationslides}
enum ActivityMenu { garden, breathofjoy, thoughtburn, acceptingEmotions,mindfulPhotoAlbum,relaxBodyScan,sleepingBreaths,sleepingDolls,worryPeriod, compassionateHand }
enum PageName { happiness, oneness, wellbeing }


class StatusProvider with ChangeNotifier {
  double _mainContainerHeight = 0.0;


  setMainContainerHeight(double height) {
    _mainContainerHeight = height;
  }

  double get mainContainerHeight => _mainContainerHeight;

}

