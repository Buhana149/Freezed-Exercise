import 'package:flutter/material.dart';
import 'package:frezzed_exercise/model_without_freezed/dart/user_model.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late List<UserModel> userModel = [];

  @override
  void initState() {
    userModel
      ..add(UserModel(
        firstName: 'Leanne',
        lastName: 'Graham',
        emailId: 'Sincere@april.biz',
        isActive: false,
      ))
      ..add(UserModel(
        firstName: 'Ervin',
        lastName: 'Howell',
        emailId: 'shanna@melissa.tv',
        isActive: false,
      ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLutter Freezed Example'),
      ),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: userModel.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(userModel[index].firstName +
                        ' ' +
                        userModel[index].lastName),
                    subtitle: Text(userModel[index].emailId),
                    trailing: Transform.scale(
                      scale: 1,
                      child: Switch(
                        value: userModel[index].isActive,
                        onChanged: (val) {
                          _updateActiveUser(index);
                        },
                        activeColor: Colors.blue,
                        activeTrackColor: Colors.grey[700],
                        inactiveThumbColor: Colors.white12,
                        inactiveTrackColor: Colors.grey[700],
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }

  void _updateActiveUser(int index) {
    userModel[index].isActive = !userModel[index].isActive;
    //userModel[index] = userModel[index].copyWith(
    // isActive: !userModel[index].isActive);
    //setState(() {}); )
  }
}
