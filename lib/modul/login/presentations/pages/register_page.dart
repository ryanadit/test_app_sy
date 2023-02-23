part of 'pages.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterBloc _registerBloc;
  late TextEditingController _email, _password, _rePassword;
  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    _registerBloc = getIt<RegisterBloc>();
    _email = TextEditingController();
    _password = TextEditingController();
    _rePassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _rePassword.dispose();
    _registerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocProvider.value(
      value: _registerBloc,
      child: Scaffold(
        body: BlocConsumer<RegisterBloc, RegisterState>(
          listener: _listenerBloc,
          builder: (context, state){
            return SingleChildScrollView(
              child: Form(
                key: _keyForm,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.15),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: const Text('REGISTER',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: width * 0.025
                      ),
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
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: width * 0.025
                      ),
                      child: TextFormField(
                          controller: _password,
                          obscureText: state.visiblePasswordBool!,
                          keyboardType: TextInputType.visiblePassword,
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
                                _registerBloc.add(
                                  const RegisterEvent.visiblePasswordMethod(),
                                );
                              },
                              icon: Icon(
                                  (state.visiblePasswordBool!)
                                      ? Icons.visibility_off
                                      : Icons.visibility
                              ),
                            ),
                          )
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: width * 0.025
                      ),
                      child: TextFormField(
                          controller: _rePassword,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: state.visiblePasswordBool!,
                          validator: (val) {
                            if (val != null && val.length >= 6) {
                              if (val.isNotEmpty
                                  && (val != _password.text
                                      && _password.text.isNotEmpty)
                              ) {
                                return 'Password tidak sama';
                              }
                              return null;
                            }
                            return 'Minimum password 6 huruf';
                          },
                          decoration: InputDecoration(
                            label: const Text('Re password'),
                            suffixIcon: IconButton(
                              onPressed: () {
                                _registerBloc.add(
                                  const RegisterEvent.visiblePasswordMethod(),
                                );
                              },
                              icon: Icon(
                                  (state.visiblePasswordBool!)
                                      ? Icons.visibility_off
                                      : Icons.visibility
                              ),
                            ),
                          )
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    Container(
                      width: width - ((width * 0.025) * 2),
                      color: Colors.blue,
                      child: TextButton(
                        onPressed: _onSave,
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _listenerBloc(BuildContext context, RegisterState state) {
    if (state.registerStatus == RegisterStatus.loading) {
      LoadingDialogWidget.showLoading(context);
    } else if (state.registerStatus == RegisterStatus.successRegister) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${state.message}')));
      Future.delayed(const Duration(milliseconds: 600)).then((value) {
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginPage()));
      });
    } else if (state.registerStatus == RegisterStatus.failedRegister) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${state.message}')));
      Future.delayed(const Duration(milliseconds: 600)).then((value) => Navigator.of(context).pop());
    }

  }

  void _onSave() {
    final state = _keyForm.currentState?.validate() ?? false;
    if (state) {
      _registerBloc.add(RegisterEvent.registerEvent(_email.text, _password.text));
    }
    
  }
}

