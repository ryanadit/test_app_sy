part of 'pages.dart';

enum _SupportState {
  unknown,
  supported,
  unsupported,
}

class LoginWithBiometricsPage extends StatefulWidget {
  const LoginWithBiometricsPage({Key? key}) : super(key: key);

  @override
  State<LoginWithBiometricsPage> createState() => _LoginWithBiometricsPageState();
}

class _LoginWithBiometricsPageState extends State<LoginWithBiometricsPage> {
  late LoginBloc _loginBloc;

  final _keyForm = GlobalKey<FormState>();

  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  @override
  void initState() {
    _loginBloc = getIt<LoginBloc>();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported
          ? _SupportState.supported
          : _SupportState.unsupported),
    );
    super.initState();
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    setState(
            () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
    if (authenticated) {
      _saveLogin();
    } else {
      _showSnackBar('Authenticated failed');
    }
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason:
        'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });

    if (authenticated) {
      _saveLogin();
    } else {
      _showSnackBar('Authenticated failed');
    }

  }

  Future<void> _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }

  void _saveLogin() {
    _loginBloc.add(const LoginEvent.loginBiometricsEvent());
  }

  void _showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocProvider.value(
      value: _loginBloc,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: _onLoginInfoListener,
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.15),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: const Text('LOGIN BIOMETRICS',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent
                        ),
                      ),
                    ),
                    _infoSupportDeviceWidget(),
                    if (_isAuthenticating)
                      ElevatedButton(
                        onPressed: _cancelAuthentication,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Text('Cancel Authentication'),
                            Icon(Icons.cancel),
                          ],
                        ),
                      )
                    else
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: _authenticate,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const <Widget>[
                                Text('Authenticate'),
                                Icon(Icons.perm_device_information),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _authenticateWithBiometrics,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(_isAuthenticating
                                    ? 'Cancel'
                                    : 'Authenticate: biometrics only'),
                                const Icon(Icons.fingerprint),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _infoSupportDeviceWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (_supportState == _SupportState.unknown)
          const CircularProgressIndicator()
        else if (_supportState == _SupportState.supported)
          const Text('This device is supported biometrics')
        else
          const Text('This device is not supported biometrics'),
        const Divider(height: 100),
      ],
    );

  }

  void _onLoginInfoListener(
      BuildContext context,
      LoginState state
      ) {
    if (state.loginStatus == LoginStatus.loading) {
      LoadingDialogWidget.showLoading(context);
    } else if (state.loginStatus == LoginStatus.failedLogout
        || state.loginStatus == LoginStatus.failedLogin
    ) {
      Future.delayed(const Duration(milliseconds: 600)).then((value) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
      });
    } else if (state.loginStatus == LoginStatus.successLogin
        || state.loginStatus == LoginStatus.successLogout) {
      Future.delayed(const Duration(milliseconds: 600)).then((value) {
        Navigator.of(context).pop();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const HomePage()), (route) => false);
      });
    }

  }

}




