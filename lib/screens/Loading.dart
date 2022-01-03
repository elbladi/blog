import 'package:blog/constants.dart';
import 'package:blog/models/CurrentData.dart';
import 'package:blog/service/login.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  Widget get _loader => Center(
        child: Image(
          image: AssetImage('assets/loading.gif'),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadCurrentData(),
        builder: (ctx, AsyncSnapshot<CurrentData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GestureDetector(
              onTap: () {
                if (snapshot.hasError)
                  Navigator.of(context).pushReplacementNamed("/");
                else
                  Navigator.of(context).pushReplacementNamed(ContentScreen,
                      arguments: snapshot.data);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: red),
                  color: green,
                ),
                height: double.infinity,
                child: _loader,
              ),
            );
          }

          return Container(
            height: double.infinity,
            color: green,
            child: _loader,
          );
        },
      ),
    );
  }
}
