part of 'pages.dart';

class LoginWithNFCPage extends StatefulWidget {
  const LoginWithNFCPage({Key? key}) : super(key: key);

  @override
  State<LoginWithNFCPage> createState() => _LoginWithNFCPageState();
}

class _LoginWithNFCPageState extends State<LoginWithNFCPage> {
  late LoginBloc _loginBloc;
  ValueNotifier<dynamic> result = ValueNotifier(null);

  @override
  void initState() {
    _loginBloc = getIt<LoginBloc>();
    super.initState();
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
                      child: const Text('LOGIN NFC',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    const SizedBox(
                      child: Text('Data NFC :',
                      ),
                    ),
                    SizedBox(height: height * 0.015),
                    ValueListenableBuilder<dynamic>(
                      valueListenable: result,
                      builder: (context, value, _) =>
                          Text('${value ?? ''}'),
                    ),
                    SizedBox(height: height * 0.025),
                    Container(
                      color: Colors.blue,
                      width: width * 0.8,
                      child: TextButton(
                        onPressed: () => _onSave(context),
                        child: const Text(
                          'Scan NFC untuk Login',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
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

  void _onSave(BuildContext context) async {
    bool isAvailable = await NfcManager.instance.isAvailable();
    if (isAvailable) {
      NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          print(tag.data);
          result.value = tag.data;
          if (result.value != null) {
            _loginBloc.add(const LoginEvent.loginNFCEvent());
          }
          NfcManager.instance.stopSession();
        },
      );
    } else {
      _showSnackBar('NFC Tidak tersedia');
    }
  }

  void _showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

}
