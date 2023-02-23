part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late LoginBloc _loginBloc;
  late String? _email;
  Timer? _time;

  late String _timeString;

  // for accelerometer
  String _accX = '0';
  String _accY = '0';
  String _accZ = '0';

  // for gyroscope
  String _gyroX = '0';
  String _gyroY = '0';
  String _gyroZ = '0';

  // for magnetometer
  String _magX = '0';
  String _magY = '0';
  String _magZ = '0';

  // for location
  String _lat = '0';
  String _lgd = '0';

  int _batteryLvl = 0;

  String _infoAndroidHardware = '';

  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  void _getEmail() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      setState(() {
        _email = preferences.getString(NameHelper.nameUsername);
      });
    } catch(e) {
      print(e);
    }
  }

  void _getAccelerometer() async {
    try {
      await accelerometerEvents.first.then((event) {
        setState(() {
          _accX = event.x.toString();
          _accY = event.y.toString();
          _accZ = event.z.toString();
        });
      });
    } catch (e) {
      print(e);
    }
  }

  void _getGyroscope() async {
    try {
      await gyroscopeEvents.first.then(
            (GyroscopeEvent event) {
          setState(() {
            _gyroX = event.x.toString();
            _gyroY = event.y.toString();
            _gyroZ = event.z.toString();
          });
        },
      );
    } catch (e) {
      print(e);
    }
  }

  void _getMagnetometer() async {
    try {
      magnetometerEvents.first.then(
            (MagnetometerEvent event) {
          setState(() {
            _magX = event.x.toString();
            _magY = event.y.toString();
            _magZ = event.z.toString();
          });
        },
      );
    } catch (e) {
      print(e);
    }
  }

  void _deviceInfo() async {
    try {
      final infoDevice = await DeviceInfoHelper().androidInfoHardware;
      setState(() {
        _infoAndroidHardware = infoDevice.hardware;
      });
    } catch(e) {
      print(e);
    }
  }

  void _getLocation() async {
    try {
      final infoLocation = await DeviceInfoHelper().determinePosition;
      setState(() {
        _lat = infoLocation.latitude.toString();
        _lgd = infoLocation.longitude.toString();
      });
    } catch(e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }
  }

  void _getBatteryLvl() async {
    try {
      final battery = Battery();
      _streamSubscriptions.add(
          battery.onBatteryStateChanged.listen((BatteryState state) async{
            final lvl = await battery.batteryLevel;
            setState(() {
              _batteryLvl = lvl;
            });
          })
      );
    } catch (e) {
      print(e);
    }

  }

  @override
  void initState() {
    _loginBloc = getIt<LoginBloc>();
    _getEmail();
    _timeString = DateHelper.formatDateTime(DateTime.now());
    _time = Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    _getAccelerometer();
    _getGyroscope();
    _getMagnetometer();
    _deviceInfo();
    _getLocation();
    _getBatteryLvl();
    super.initState();
  }

  @override
  void dispose() {
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
    _time?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocProvider.value(
      value: _loginBloc,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state){
          if (state.loginStatus == LoginStatus.successLogout) {
            _loginBloc.add(const LoginEvent.getUserInfoLogin());
            Future.delayed(const Duration(milliseconds: 600)).then((value) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginPage())
              );
            });
          } else if (state.loginStatus == LoginStatus.loading) {
            LoadingDialogWidget.showLoading(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home Page'),
              actions: [
                IconButton(
                    onPressed: () {
                      _loginBloc.add(LoginEvent.logoutEvent(_email ?? ''));
                    },
                    icon: const Icon(
                        Icons.door_back_door_outlined,
                      color: Colors.white,
                    )
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.only(top: height * 0.015),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Waktu saat ini'),
                    Text(_timeString,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.indigo
                      ),
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    const Text('Sensor Info'),
                    Text('Accelerometter Sensor: \n($_infoAndroidHardware, $_accX, $_accY, $_accZ)' ,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.amber
                      ),
                    ),
                    Text('Gyroscope Sensor: \n($_infoAndroidHardware, $_gyroX, $_gyroY, $_gyroZ)' ,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.purple
                      ),
                    ),
                    Text('Magnetometer Sensor: \n($_infoAndroidHardware, $_magX, $_magY, $_magZ)' ,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.red
                      ),
                    ),
                    Text('GPS Coordinate: \n(latitude : $_lat, longitude : $_lgd)' ,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.cyan
                      ),
                    ),
                    Text('Battery Level : \n(status : $_batteryLvl%)' ,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.green
                      ),
                    ),
                    SizedBox(
                      height: height * 0.035,
                    ),
                    Container(
                      color: Colors.blue,
                      width: width * 0.5,
                      child: TextButton(
                        onPressed: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const HomePageB()
                          ));
                        },
                        child: const Text('To Page B',
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

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = DateHelper.formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

}
