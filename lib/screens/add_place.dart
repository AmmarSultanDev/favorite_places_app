import 'package:favorite_places_app/providers/user_places.dart';
import 'package:favorite_places_app/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _savePlace() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty) {
      return;
    }

    ref.read(userPlacesProvider.notifier).addPlace(enteredTitle);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              controller: _titleController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            // Image input
            const SizedBox(height: 10),
            ImageInput(),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text('Add Place'),
            )
          ],
        ),
      ),
    );
  }
}
