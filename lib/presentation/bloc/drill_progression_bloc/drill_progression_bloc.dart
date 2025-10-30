import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolhub_flutter/data/model/drill.dart';
import 'package:schoolhub_flutter/data/model/drill_question.dart';
import 'package:schoolhub_flutter/data/repository/drill_repository.dart';

part 'drill_progression_event.dart';
part 'drill_progression_state.dart';

class DrillProgressionBloc
    extends Bloc<DrillProgressionEvent, DrillProgressionState> {
  final DrillModel drill;

  final DrillRepository drillRepository = DrillRepository();

  DrillProgressionBloc({required this.drill})
      : super(DrillProgressionLoaded(drill: drill)) {
    on<NextDrillQuestion>((event, emit) {
      final DrillProgressionLoaded prevState = state as DrillProgressionLoaded;

      if (prevState.currentQuestionIndex ==
          prevState.drill.drillQuestions.length - 1) {
        return;
      }

      emit(DrillProgressionLoaded(
          drill: prevState.drill,
          currentQuestionIndex: prevState.currentQuestionIndex + 1));
    });

    on<PreviousDrillQuestion>((event, emit) {
      final DrillProgressionLoaded prevState = state as DrillProgressionLoaded;

      if (prevState.currentQuestionIndex == 0) {
        return;
      }

      emit(DrillProgressionLoaded(
          drill: prevState.drill,
          currentQuestionIndex: prevState.currentQuestionIndex - 1));
    });

    on<AnswerDrillQuestion>((event, emit) {
      final prevState = state as DrillProgressionLoaded;

      final currentQuestionIndex = prevState.currentQuestionIndex;
      final prevQuestions = prevState.drill.drillQuestions;
      final currentQuestion = prevQuestions[currentQuestionIndex];

      final newAnswer =
          (currentQuestion.answer != event.answer) ? event.answer : null;
      final updatedQuestion = currentQuestion.copyWith(answer: newAnswer);

      final updatedQuestions = List<DrillQuestionModel>.from(prevQuestions);
      updatedQuestions[currentQuestionIndex] = updatedQuestion;

      final updatedDrill = prevState.drill.copyWith(
        drillQuestions: updatedQuestions,
      );

      emit(DrillProgressionLoaded(
          drill: updatedDrill, currentQuestionIndex: currentQuestionIndex));
    });

    on<FinishDrillProgression>((event, emit) async {
      DrillProgressionLoaded prevState = state as DrillProgressionLoaded;

      try {
        final DrillModel updatedDrill =
            prevState.drill.copyWith(status: 'finished');

        final int responseCode =
            await drillRepository.updateDrill(drill: updatedDrill);

        if (responseCode == 200) {
          emit(DrillProgressionFinished());
        } else {
          emit(DrillProgressionLoaded(
              drill: prevState.drill,
              errorMessage: "An error has occured : ${responseCode}"));
        }
      } catch (e) {
        emit(DrillProgressionLoaded(
            drill: prevState.drill, errorMessage: e.toString()));
      }

      ;
    });
  }
}
