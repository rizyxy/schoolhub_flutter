import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolhub_flutter/presentation/bloc/drill_history_bloc/drill_history_bloc.dart';
import 'package:schoolhub_flutter/presentation/widgets/drill/drill_list.dart';

class DrillHistoryBlocConsumer extends StatelessWidget {
  const DrillHistoryBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrillHistoryBloc, DrillHistoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is DrillHistoryLoading) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is DrillHistoryError) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                  onTap: () {
                    context.read<DrillHistoryBloc>().add(FetchDrillHistories());
                  },
                  child: Icon(Icons.restart_alt)),
              Text("Tap to Retry")
            ],
          );
        }

        if (state is DrillHistorySuccess) {
          return DrillList();
        }

        return SizedBox.shrink();
      },
    );
  }
}
