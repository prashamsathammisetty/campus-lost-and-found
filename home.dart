import 'package:flutter/material.dart';
import 'add.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Map<String, dynamic>> items = [

    {
      'title': 'Lost Wallet',
      'location': 'Library',
      'status': 'Missing',
    },

    {
      'title': 'Lost ID Card',
      'location': 'Cafeteria',
      'status': 'Missing',
    },
  ];

  String searchText = '';

  void addItem(Map<String, dynamic> item) {

    setState(() {
      items.add(item);
    });

  }

  @override
  Widget build(BuildContext context) {

    final filteredItems = items.where((item) {

      return item['title']
          .toLowerCase()
          .contains(searchText.toLowerCase());

    }).toList();

    return Scaffold(

      appBar: AppBar(
        title: const Text('Campus Lost & Found'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            TextField(

              onChanged: (value) {

                setState(() {
                  searchText = value;
                });

              },

              decoration: InputDecoration(

                hintText: 'Search items',

                prefixIcon:
                const Icon(Icons.search),

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(

                  borderRadius:
                  BorderRadius.circular(15),

                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(

              child: ListView.builder(

                itemCount: filteredItems.length,

                itemBuilder: (context, index) {

                  final item = filteredItems[index];

                  return Container(

                    margin:
                    const EdgeInsets.only(bottom: 15),

                    decoration: BoxDecoration(

                      color: Colors.white,

                      borderRadius:
                      BorderRadius.circular(20),

                      boxShadow: const [

                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                        ),
                      ],
                    ),

                    child: ExpansionTile(

                      leading: CircleAvatar(

                        backgroundColor:

                        item['status'] == 'Collected'

                            ? Colors.green.shade100

                            : Colors.red.shade100,

                        child: Icon(

                          item['status'] == 'Collected'

                              ? Icons.check_circle

                              : Icons.warning,

                          color:

                          item['status'] == 'Collected'

                              ? Colors.green

                              : Colors.red,
                        ),
                      ),

                      title: Text(

                        item['title'],

                        style: TextStyle(

                          fontWeight: FontWeight.bold,

                          decoration:

                          item['status'] == 'Collected'

                              ? TextDecoration.lineThrough

                              : TextDecoration.none,
                        ),
                      ),

                      subtitle: Text(
                        item['location'],
                      ),

                      trailing: Chip(

                        label:
                        Text(item['status']),

                        backgroundColor:

                        item['status'] == 'Collected'

                            ? Colors.green.shade100

                            : Colors.red.shade100,
                      ),

                      children: [

                        Padding(

                          padding:
                          const EdgeInsets.all(15),

                          child: Column(

                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              Text(

                                item['status'] == 'Collected'

                                    ? 'Item Found'

                                    : 'Item Missing',
                              ),

                              const SizedBox(height: 20),

                              SizedBox(

                                width: double.infinity,

                                child: ElevatedButton(

                                  onPressed: () {

                                    setState(() {

                                      item['status'] =
                                      'Collected';

                                    });

                                  },

                                  child: const Text(
                                    'Collected',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton:
      FloatingActionButton.extended(

        icon: const Icon(Icons.add),

        label: const Text('Add Item'),

        onPressed: () async {

          final result = await Navigator.push(

            context,

            MaterialPageRoute(
              builder: (context) =>
              const AddPage(),
            ),
          );

          if (result != null) {

            addItem(result);

          }
        },
      ),
    );
  }
}