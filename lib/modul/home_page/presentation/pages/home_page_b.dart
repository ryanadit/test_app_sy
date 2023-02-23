part of 'pages.dart';

class HomePageB extends StatefulWidget {
  const HomePageB({Key? key}) : super(key: key);

  @override
  State<HomePageB> createState() => _HomePageBState();
}

class _HomePageBState extends State<HomePageB> {

  Timer? _time;
  String _inputTextToQR = '';
  late TextEditingController _inputText;

  List<DateModel> listDateModel = [];

  String _infoSoC = '';

  /// SENSOR DATA
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

  String _infoAndroidHardware = '';

  void _deviceInfo() async {
    try {
      final infoDevice = await DeviceInfoHelper().androidInfoHardware;
      final infoPackage = await DeviceInfoHelper().buildInfoPackage;
      setState(() {
        _infoSoC = 'Manufacturer : ${infoDevice.manufacturer}, '
            'Model : ${infoDevice.model}, Build : ${infoPackage.buildNumber}, '
            'SDK : ${infoDevice.version.sdkInt}, Version : ${infoPackage.version}';
        _infoAndroidHardware = infoDevice.hardware;
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

  void _refreshSensor() async {
    _time = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick <= 30) {
        _getAccelerometer();
        _getGyroscope();
        _getMagnetometer();
      } else {
        timer.cancel();
      }
    });
  }

  void _saveQR() async {
    FocusScope.of(context).unfocus();
    setState(() {
      _inputTextToQR = _inputText.text;
    });
  }

  void _getDataDate() async {
    GetDataDateUsecase getData = GetDataDateUsecase(DateRepositoryImpl());
    final resultGetDate = await getData.call();
    if (resultGetDate.isRight()) {
      setState(() {
        listDateModel = resultGetDate.getRight()!;
      });
    }

  }

  void _goToDetailPage(DateModel data) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => DetailPageCRUD(dateModel: data))
    ).then((value) => _getDataDate() );
  }

  @override
  void initState() {
    _inputText = TextEditingController();
    _getDataDate();
    _deviceInfo();
    _getAccelerometer();
    _getGyroscope();
    _getMagnetometer();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _time?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page B'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: height * 0.015),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Data SoC'),
              Text(_infoSoC,
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
              SizedBox(
                height: height * 0.015,
              ),
              Container(
                color: Colors.blue,
                width: width * 0.5,
                child: TextButton(
                  onPressed: _refreshSensor,
                  child: const Text('Refresh Sensor',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Container(
                color: Colors.blue,
                width: width * 0.5,
                child: TextButton(
                  onPressed: () async {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const HomePageC()
                    ));
                  },
                  child: const Text('To Page C',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Container(
                color: Colors.blue,
                width: width * 0.5,
                child: TextButton(
                  onPressed: () async {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const CameraBonusPage()
                    ));
                  },
                  child: const Text('To Camera Bonus Page',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              const Divider(),
              SizedBox(
                height: height * 0.015,
              ),
              SizedBox(
                width: width * 0.8,
                child: TextFormField(
                  controller: _inputText,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      label: Text('Input QR'),
                  ),
                ),
              ),
              Container(
                color: Colors.blue,
                width: width * 0.8,
                child: TextButton(
                  onPressed: _saveQR,
                  child: const Text('Save QR',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              if (_inputTextToQR.isNotEmpty) ... [
                SizedBox(
                  height: height * 0.015,
                ),
                SizedBox(
                  width: width * 0.5,
                  child: QrImage(
                    data: _inputTextToQR,
                    version: QrVersions.auto,
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
              ],
              const Divider(),
              SizedBox(
                height: height * 0.015,
              ),
              _showDataDate(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DetailPageCRUD()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _showDataDate() {
    return Builder(
      builder: (context) {
        if (listDateModel.isEmpty) {
          return const SizedBox(
            child: Text('Data belum tersedia'),
          );
        }
        return Column(
          children: listDateModel.map((e) {
            return Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey
                  )
                )
              ),
              child: ListTile(
                title: Text(e.input),
                subtitle: Text(e.dateTime),
                trailing: SizedBox(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () => _goToDetailPage(e), icon: const Icon(
                        Icons.article_rounded, color: Colors.green,
                      )),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }


}
