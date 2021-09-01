import 'package:blue/model/image_model.dart';
import 'package:flutter/cupertino.dart';

class StoryProvider extends ChangeNotifier {
  StoryModel _selectedStory;
  get selectedStory => _selectedStory;
  set selectedStory(StoryModel value) {
    this._selectedStory = value;
    notifyListeners();
  }
}
