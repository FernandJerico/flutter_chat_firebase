import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_firebase/data/datasources/firebase_datasource.dart';
import 'package:flutter_chat_firebase/data/models/user_model.dart';
import 'package:flutter_chat_firebase/views/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Firebase Chat App',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: StreamBuilder<List<UserModel>>(
          stream: FirebaseDatasource.instance.allUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final List<UserModel> users = (snapshot.data ?? [])
                .where((element) => element.id != currentUser!.uid)
                .toList();
            if (users.isEmpty) {
              return const Center(child: Text('No user found'));
            }
            return ListView.separated(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      radius: 25,
                      child: Text(users[index].userName[0].toUpperCase(),
                          style: const TextStyle(color: Colors.white)),
                    ),
                    title: Text(users[index].userName),
                    subtitle: const Text('Last message'),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ChatScreen(
                          partnerUser: users[index],
                        );
                      }));
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                });
          }),
    );
  }
}
