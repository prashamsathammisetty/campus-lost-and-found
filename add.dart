import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  final titleController =
  TextEditingController();

  final locationController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Add Item'),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            const Text(

              'Post Lost Item',

              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            TextField(

              controller: titleController,

              decoration: InputDecoration(

                labelText: 'Item Name',

                border: OutlineInputBorder(

                  borderRadius:
                  BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(

              controller: locationController,

              decoration: InputDecoration(

                labelText: 'Location',

                border: OutlineInputBorder(

                  borderRadius:
                  BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(

              width: double.infinity,
              height: 55,

              child: ElevatedButton(

                onPressed: () {

                  Navigator.pop(

                    context,

                    {

                      'title':
                      titleController.text,

                      'location':
                      locationController.text,

                      'status':
                      'Missing',
                    },
                  );
                },

                child: const Text(
                  'Post Item',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}