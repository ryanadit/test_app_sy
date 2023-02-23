import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_synapsisid/common/utils/name_helper.dart';
import 'package:test_synapsisid/modul/home_page/presentation/pages/pages.dart';
import 'package:test_synapsisid/modul/login/presentations/login_bloc/login_bloc.dart';
import 'package:test_synapsisid/modul/login/presentations/pages/pages.dart';

class SplashScreenPage extends StatefulWidget {
  static const String routeName = 'splash_page';
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: _onLoginInfoListener,
      builder: (context, state) {
        return Scaffold(
          body: Image.asset(
            NameHelper.splashScreenImage,
            height: double.infinity,
            fit: BoxFit.cover,
            width: double.infinity,
            alignment: Alignment.center,
          ),
        );
      },
    );
  }

  void _onLoginInfoListener(
      BuildContext context,
      LoginState state
  ) {
    if (!state.statusLogin && state.loginStatus == LoginStatus.statusLoaded) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginPage())
      );
    } else if (state.statusLogin && state.loginStatus == LoginStatus.statusLoaded) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomePage())
      );
    }
  }

}
