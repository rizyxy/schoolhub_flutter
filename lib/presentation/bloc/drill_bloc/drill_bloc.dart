import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolhub_flutter/data/model/drill.dart';
import 'package:schoolhub_flutter/data/repository/drill_repository.dart';

part 'drill_event.dart';
part 'drill_state.dart';

class DrillBloc extends Bloc<DrillEvent, DrillState> {
  final DrillRepository drillRepository = DrillRepository();

  DrillBloc() : super(DrillInitial()) {
    on<FetchDrills>((event, emit) async {
      emit(DrillLoading());

      try {
        List<DrillModel> drills =
            await drillRepository.fetchDrills(status: 'running');

        emit(DrillSuccess(drills: drills));
      } catch (e) {
        emit(DrillError(errorMessage: e.toString()));
      }
    });
  }
}
