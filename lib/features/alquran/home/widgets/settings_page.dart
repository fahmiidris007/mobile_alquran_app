import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_alquran_app/config/themes/AppColors.dart';
import 'package:mobile_alquran_app/features/intro/bloc/intro_bloc.dart';

import '../../../../utils/shared_preferences_helper.dart';
import '../../../alquran/home/widgets/build_text.dart';
import '../../../intro/intro_screen.dart';



class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final introBloc = BlocProvider.of<IntroBloc>(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async {
                final name = await showDialog<String>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                        'Enter Your Name',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                      content: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Your Name',
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).pop(nameController.text);
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ],
                    );
                  },
                );
                if (name != null && name.isNotEmpty) {
                  introBloc.add(InputUsername(name));
                  SharedPreferencesHelper.setName(name);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Center(child: Text('Name has been changed to $name')),
                    ),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.circular(30)),
                child: const BuildText(
                  text: 'Change Name',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async {
                SharedPreferencesHelper.removeName();
                Navigator.of(context).pushReplacementNamed(IntroScreen.routeName);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30)),
                child: const BuildText(
                  text: 'Log Out',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
