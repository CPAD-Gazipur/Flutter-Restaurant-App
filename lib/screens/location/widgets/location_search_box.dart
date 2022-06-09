import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant_app/blocs/auto_complete/auto_complete_bloc.dart';

class LocationSearchBox extends StatelessWidget {
  const LocationSearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutoCompleteBloc, AutoCompleteState>(
        builder: (context, state) {
      if (state is AutoCompleteLoading) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      }
      else if (state is AutoCompleteLoaded) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Enter you location',
              hintStyle: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(Icons.location_searching),
              contentPadding: const EdgeInsets.only(
                left: 20,
                top: 5,
                bottom: 5,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
            onChanged: (value) {
              context
                  .read<AutoCompleteBloc>()
                  .add(LoadAutocomplete(searchInput: value));
              debugPrint('AutoComplete: $value');
            },
          ),
        );
      }
      return const Text('Something went wrong');
    });
  }
}
