import 'package:flutter/material.dart';
import 'package:self_learn13/model/user.dart';
import 'package:self_learn13/api/api_service.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Homepage());
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<User>> users;

  @override
  void initState() {
    super.initState();

    users = ApiService().getUser();
  }

  void refreshData() {
    setState(() {
      users = ApiService().getUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CRUD User API")),

      body: FutureBuilder<List<User>>(
        future: users,

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          List<User> list = snapshot.data ?? [];

          if (list.isEmpty) {
            return const Center(child: Text("No Data"));
          }

          return ListView.builder(
            itemCount: list.length,

            itemBuilder: (context, index) {
              User user = list[index];

              return Card(
                margin: const EdgeInsets.all(10),

                child: ListTile(
                  leading: CircleAvatar(child: Text(user.id.toString())),

                  title: Text(user.name),

                  subtitle: Text(user.email),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      IconButton(
                        icon: const Icon(Icons.update),

                        onPressed: () async {
                          await ApiService().updateUser(
                            user.id,

                            user.name,

                            user.email,
                          );

                          refreshData();
                        },
                      ),

                      IconButton(
                        icon: const Icon(Icons.delete),

                        onPressed: () async {
                          await ApiService().deleteUser(user.id);

                          refreshData();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
