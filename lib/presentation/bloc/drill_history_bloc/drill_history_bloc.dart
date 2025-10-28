import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'drill_history_event.dart';
part 'drill_history_state.dart';

class DrillHistoryBloc extends Bloc<DrillHistoryEvent, DrillHistoryState> {
  DrillHistoryBloc() : super(DrillHistoryInitial()) {
    on<FetchDrillHistories>((event, emit) async {
      emit(DrillHistoryLoading());

      try {
        await Future.delayed(Duration(seconds: 2));

        emit(DrillHistorySuccess());
      } catch (e) {
        emit(DrillHistoryError(errorMessage: e.toString()));
      }
    });
  }
}
