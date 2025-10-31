import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolhub_flutter/presentation/bloc/subject_bloc/subject_bloc.dart';
import 'package:schoolhub_flutter/presentation/widgets/subject/subject_list.dart';

class SubjectBlocConsumer extends StatelessWidget {
  const SubjectBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubjectBloc, SubjectState>(listener: (context, state) {
      if (state is SubjectError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage ?? "An error has occured")));
      }
    }, builder: (context, state) {
      if (state is SubjectLoading) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: CircularProgressIndicator(),
          ),
        );
      }

      if (state is SubjectError) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
                onTap: () {
                  context.read<SubjectBloc>().add(FetchSubjects());
                },
                child: const Icon(Icons.restart_alt)),
            const Text("Tap to Retry")
          ],
        );
      }

      if (state is SubjectSuccess) {
        return SubjectList(
          subjects: state.subjects,
        );
      }

      return const SizedBox.shrink();
    });
  }
}
