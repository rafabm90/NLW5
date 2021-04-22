
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/home/home_repositoy.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final stateNotifier =  ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;
  
  
  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async{
    state = HomeState.loading;
    user = await repository.getUser();
    if(user != null && quizzes != null)
      state = HomeState.succes;
  }

  void getQuizzes() async{
    state = HomeState.loading;
    await Future.delayed(Duration(seconds:2));
    quizzes = await repository.getQuizzes();
    state = HomeState.succes;
  }
}
