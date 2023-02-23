import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_synapsisid/common/module/di/di_init_config.dart';
import 'package:test_synapsisid/modul/login/presentations/login_bloc/login_bloc.dart';
import 'package:test_synapsisid/modul/login/presentations/register_bloc/register_bloc.dart';
import 'package:test_synapsisid/modul/splash_screen/presentations/pages/splash_screen_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => getIt<LoginBloc>()
              ..add(const LoginEvent.getUserInfoLogin()),
        ),
        BlocProvider(
            create: (context) => getIt<RegisterBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Test App',
        initialRoute: SplashScreenPage.routeName,
        routes: {
          SplashScreenPage.routeName: (_) => const SplashScreenPage(),
        },
      ),
    );
  }
}
