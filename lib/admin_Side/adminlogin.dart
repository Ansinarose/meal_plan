import 'package:flutter/material.dart';
import 'package:meal_plan/admin_Side/days.dart';
import 'package:meal_plan/admin_Side/home.dart';
import 'package:meal_plan/user_Interaction/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenAdminLogin extends StatefulWidget {
  const ScreenAdminLogin({Key? key}) : super(key: key);

  @override
  _ScreenAdminLogin createState() => _ScreenAdminLogin();
}

class _ScreenAdminLogin extends State<ScreenAdminLogin> {
  final UsernameTextController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 226, 6),
      ),
      body: SingleChildScrollView(
        child: Container(height: 800,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/about.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top:130.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: UsernameTextController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter the Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: _isObscured,
                      controller: _passwordController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        focusColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: 'Re enter Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscured
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Re Enter the name';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 250, 226, 6),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        checklogin(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Please enter all the details',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 250, 226, 6),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checklogin(BuildContext ctx) async {
    final Username = UsernameTextController.text;
    final Password = _passwordController.text;

    // String User = 'ANSINA';
    // String Pass = '123';

    // if (Username == User && Password == Pass) {
      if(UsernameTextController.text == _passwordController.text){
      final SharedPrefs = await SharedPreferences.getInstance();
      await SharedPrefs.setBool(SAVE_KEY_NAME, true);
       Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => ScreenAdHome(),
      ),
    );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: Color.fromARGB(255, 250, 226, 6),
          content: Text(
            'Username or Password is incorrect',
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    }
  }
}
