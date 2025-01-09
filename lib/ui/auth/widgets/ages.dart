import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/ui/auth/auth.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: BlocBuilder<AgeDisplayCubit, AgeDisplayState>(
        builder: (context, state) {
          if (state is Loading) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }

          if (state is Loaded) {
            return _ages(state.ages);
          }

          if (state is LoadFailed) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                state.message,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
            context
                .read<AgeSelectCubit>()
                .selectAge(ages[index].data()['value'] as String);
          },
          child: Text(
            ages[index].data()['value'] as String,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemCount: ages.length,
    );
  }
}
