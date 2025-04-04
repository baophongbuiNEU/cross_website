import 'package:flutter/material.dart';
import 'package:test_flutter/func.dart';

class Lists extends StatefulWidget {
  const Lists({super.key});

  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> with Func {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "My Lists",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/new_page");
              },
              icon: const Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                // Navigator.pushNamed(context, ViewList.routeName,
                //     arguments: ViewArguments(
                //         listName: "All Items", id: "", all: true));
              },
              icon: const Icon(Icons.more_horiz))
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
          future: getLists(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // EmptyWidget(
                        //   image: null,
                        //   packageImage: PackageImage.Image_4,
                        //   title: 'No Lists',
                        //   subTitle: 'No Lists available yet',
                        //   titleTextStyle: const TextStyle(
                        //       fontSize: 22,
                        //       color: Colors.blue,
                        //       fontWeight: FontWeight.w500),
                        //   subtitleTextStyle:
                        //       const TextStyle(fontSize: 14, color: Colors.grey),
                        // ),
                        newList(context)
                      ],
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    var entryList = snapshot.data!.toList();

                    if (index == snapshot.data!.length) {
                      return newList(context);
                    }
                    return Card(
                      child: ListTile(
                        onTap: () {
                          // Navigator.pushNamed(context, ViewList.routeName,
                          //     arguments: ViewArguments(
                          //         listName:
                          //             entryList[index].value["name"] ?? "",
                          //         id: entryList[index].value["id"] ?? ""));
                        },
                        leading: const Icon(Icons.list),
                        title: Text(entryList[index]["name"] ?? ""),
                        trailing: const Icon(Icons.arrow_right),
                      ),
                    );
                  },
                );
              }
            } else {
              return Center(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: const Text('')
                    // EmptyWidget(
                    //   image: null,
                    //   packageImage: PackageImage.Image_4,
                    //   title: 'No Lists',
                    //   subTitle: 'No Lists available yet',
                    //   titleTextStyle: const TextStyle(
                    //       fontSize: 22,
                    //       color: Colors.blue,
                    //       fontWeight: FontWeight.w500),
                    //   subtitleTextStyle:
                    //       const TextStyle(fontSize: 14, color: Colors.grey),
                    // ),
                    ),
              );
            }
          }),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.restaurant), label: 'Recipe'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.file_download_sharp), label: 'Files'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.chat_bubble), label: 'Chat Room')
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.blue[800],
      //   unselectedItemColor: Colors.black,
      //   showUnselectedLabels: true,
      //   unselectedLabelStyle:
      //       const TextStyle(color: Colors.black, fontSize: 11),
      //   unselectedIconTheme: const IconThemeData(size: 15),
      //   onTap: _onItemTapped,
      // ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 1) {
      Navigator.pushNamed(context, "/recipe");
    } else if (_selectedIndex == 2) {
      Navigator.pushNamed(context, "/file");
    } else {
      Navigator.pushNamed(context, "/chat");
    }
  }

  ElevatedButton newList(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  icon: const CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                  content: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: nameController,
                        decoration:
                            const InputDecoration(hintText: 'Add name '),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a new list';
                          }
                          return null;
                        },
                      )),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            createList(nameController.text);
                            Navigator.pop(context);
                            nameController.clear();
                            setState(() {});
                          }
                        },
                        child: const Text("Add"))
                  ],
                );
              });
        },
        icon: const Icon(Icons.add),
        label: const Text("Add new list"));
  }
}

// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:test_flutter/api.dart';

// class JsonScreen extends StatefulWidget {
//   const JsonScreen({super.key});

//   @override
//   _JsonScreenState createState() => _JsonScreenState();
// }

// class _JsonScreenState extends State<JsonScreen> {
//   late Future<Response<dynamic>?> jsonData;

//   @override
//   void initState() {
//     super.initState();
//     jsonData = ApiService.fetchData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('PostgreSQL JSON Data')),
//       body: FutureBuilder<Response<dynamic>?>(
//         future: jsonData,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError || snapshot.data == null) {
//             return Center(child: Text('Failed to fetch data'));
//           }

//           final data = snapshot.data!.data;
//           if (data is List && data.isNotEmpty) {
//             return ListView.builder(
//               itemCount: data.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(data[index]['name'] ?? 'No Name'),
//                   subtitle: Text('ID: ${data[index]['id']}'),
//                 );
//               },
//             );
//           } else {
//             return Center(child: Text('No data found'));
//           }
//         },
//       ),
//     );
//   }
// }
