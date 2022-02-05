abstract class NewsStates {}

class NewsInitialStates extends NewsStates {}

class NewsBottomNav extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  late final String error;

  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  late final String error;

  NewsGetSportsErrorState(this.error);
}

class NewsGetSciencesSuccessState extends NewsStates {}

class NewsGetSciencesErrorState extends NewsStates {
  late final String error;

  NewsGetSciencesErrorState(this.error);
}

class NewsChangeModeState extends NewsStates {}
