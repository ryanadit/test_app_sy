part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc _loginBloc;
  late TextEditingController _email, _password;

  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    _loginBloc = getIt<LoginBloc>();
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
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
              child: Form(
                key: _keyForm,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.15),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: const Text('LOGIN',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.8,
                      child: TextFormField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          if (val != null && val.isValidEmail()) {
                            return null;
                          }
                          return 'Email belum benar';
                        },
                        decoration: const InputDecoration(
                            label: Text('Email'),
                            hintText: 'Contoh: john@email.com'
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    SizedBox(
                      width: width * 0.8,
                      child: TextFormField(
                          controller: _password,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: state.visiblePasswordBool,
                          validator: (val) {
                            if (val != null && val.length >= 6) {
                              return null;
                            }
                            return 'Minimum password 6 huruf';
                          },
                          decoration: InputDecoration(
                            label: const Text('Password'),
                            suffixIcon: IconButton(
                              onPressed: () {
                                _loginBloc.add(
                                  const LoginEvent.visiblePasswordMethod(),
                                );
                              },
                              icon: Icon(
                                  (state.visiblePasswordBool)
                                      ? Icons.visibility_off
                                      : Icons.visibility
                              ),
                            ),
                          )
                      ),
                    ),
                    SizedBox(height: height * 0.015),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => const RegisterPage()
                            )
                        );
                      },
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Belum punya akun?',
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    Container(
                      color: Colors.blue,
                      width: width * 0.8,
                      child: TextButton(
                        onPressed: _onSave,
                        child: const Text(
                          'Masuk',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.035),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => const LoginWithQRPage()
                            )
                        );
                      },
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Login with QR',
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.035),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => const LoginWithNFCPage()
                            )
                        );
                      },
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Login with NFC',
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.035),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => const LoginWithBiometricsPage()
                            )
                        );
                      },
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Login with Biometrics',
                        ),
                      ),
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
      Navigator.of(context).pop();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const HomePage()), (route) => false);
    }

  }

  void _onSave() {
    final valid = _keyForm.currentState?.validate() ?? false;
    if (valid) {
      FocusScope.of(context).unfocus();
      _loginBloc.add(LoginEvent.loginEvent(_email.text, _password.text));
    }
  }

}
