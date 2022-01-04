import 'package:blog/constants.dart';
import 'package:blog/models/CurrentData.dart';
import 'package:blog/service/login.dart';
import 'package:blog/store/actions/blog_action.dart';
import 'package:blog/store/states/blog_state.dart';
import 'package:blog/store/store.dart';
import 'package:blog/widgets/Login_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;

  void _onTap(bool? canNav, CurrentData? data) {
    if (canNav != null && data != null) {
      Redux.store.dispatch(SetBlogState(BlogState(currentData: data)));
      Navigator.of(context).pushReplacementNamed(ContentScreen);
    }
  }

  void _onSubmit() {
    this.setState(() {
      loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: green,
        child: Center(
          child: !loading
              ? LoginButton("Are you sure?", _onSubmit)
              : FutureBuilder(
                  future: loadCurrentData(),
                  builder: (ctx, AsyncSnapshot<CurrentData> snapshot) {
                    if (snapshot.hasError) {
                      this.setState(() {
                        loading = false;
                      });
                      return SizedBox();
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      return GestureDetector(
                        onTap: () => _onTap(true, snapshot.data),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: red, width: 2),
                            ),
                            child: Image(
                              image: AssetImage('assets/loading.gif'),
                            ),
                          ),
                        ),
                      );
                    }
                    return GestureDetector(
                      onTap: () => _onTap(null, null),
                      child: Center(
                        child: Image(
                          image: AssetImage('assets/loading.gif'),
                        ),
                      ),
                    );
                  }),
        ),
      ),
    );
  }
}
