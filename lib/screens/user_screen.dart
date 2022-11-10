import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../widgets/text_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: "");
  @override
  void dispose() {
    _addressTextController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                  text: const TextSpan(
                      text: 'Ho, ',
                      style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                    TextSpan(
                        text: 'Mi nombre',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600))
                  ])),
              const SizedBox(height: 5),
              TextWidget(
                text: 'email@email.com',
                color: Colors.black,
                textSize: 18,
                //isTitle: true,
              ),
              const SizedBox(height: 20),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(height: 20),
              _listTiles(
                  title: 'Mi perfil',
                  icon: IconlyLight.profile,
                  onPressed: () {}),
              _listTiles(
                  title: 'Dirección',
                  subtitle: 'My subtitle',
                  icon: IconlyLight.profile,
                  onPressed: () async {
                    await _showAddressDialog();
                  }),
              _listTiles(
                  title: 'Pedidos', icon: IconlyLight.bag, onPressed: () {}),
              _listTiles(
                  title: 'Olvidé password',
                  icon: IconlyLight.unlock,
                  onPressed: () {}),
              _listTiles(
                  title: 'Logout', icon: IconlyLight.logout, onPressed: () {}),
            ],
          ),
        ),
      ),
    ));
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              onChanged: (value) {
                //_addressTextController.text;
              },
              controller: _addressTextController,
              maxLines: 5,
              decoration: const InputDecoration(hintText: "Your address"),
            ),
            actions: [
              TextButton(onPressed: () {}, child: const Text('Update')),
            ],
          );
        });
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: Colors.black,
        textSize: 22,
        //isTitle: true,
      ),
      subtitle: TextWidget(
        text: subtitle == null ? "" : subtitle,
        color: Colors.black,
        textSize: 18,
      ),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
