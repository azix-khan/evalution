import 'package:evalution/utils/utils.dart';
import 'package:evalution/widgets/round_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final postController = TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Post');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Posts'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              maxLines: 4,
              controller: postController,
              decoration: const InputDecoration(
                  hintText: 'What is in your mind?',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundButton(
                loading: loading,
                title: 'Add Post',
                onTap: () {
                  setState(() {
                    loading = true;
                  });
                  final id = DateTime.now().microsecondsSinceEpoch.toString();
                  databaseRef.child(id).set({
                    'id': id,
                    'title': postController.text.toString(),
                  }).then((value) {
                    Utils().toastMessage('Post Added');
                    setState(() {
                      loading = false;
                    });
                  }).onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                    setState(() {
                      loading = false;
                    });
                  });
                })
          ],
        ),
      ),
    );
  }
}
