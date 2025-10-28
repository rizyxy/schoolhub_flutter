import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolhub_flutter/data/model/drill.dart';
import 'package:schoolhub_flutter/data/repository/drill_repository.dart';

part 'drill_history_event.dart';
part 'drill_history_state.dart';

class DrillHistoryBloc extends Bloc<DrillHistoryEvent, DrillHistoryState> {
  final DrillRepository drillRepository = DrillRepository();

  DrillHistoryBloc() : super(DrillHistoryInitial()) {
    on<FetchDrillHistories>((event, emit) async {
      emit(DrillHistoryLoading());

      try {
        List<DrillModel> drills =
            await drillRepository.fetchDrills(status: 'finished');

        emit(DrillHistorySuccess(drills: drills));
      } catch (e) {
        emit(DrillHistoryError(errorMessage: e.toString()));
      }
    });
  }
}
