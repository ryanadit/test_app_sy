part of 'pages.dart';

class CameraBonusPage extends StatefulWidget {
  const CameraBonusPage({super.key});

  @override
  State<CameraBonusPage> createState() => _CameraBonusPageState();
}

class _CameraBonusPageState extends State<CameraBonusPage> {
  final picker = ImagePicker();
  File? image;

  // for magnetometer
  double _magX = 0;
  double _magY = 0;
  double _magZ = 0;

  double? _lat;
  double? _lng;

  void _getLocation() async {
    try {
      final infoLocation = await DeviceInfoHelper().determinePosition;
      setState(() {
        _lat = infoLocation.latitude;
        _lng = infoLocation.longitude;
      });
    } catch(e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }
  }

  void _getMagnetometer() async {
    try {
      magnetometerEvents.first.then(
            (MagnetometerEvent event) {
          setState(() {
            _magX = event.x;
            _magY = event.y;
            _magZ = event.z;
          });
        },
      );
    } catch (e) {
      print(e);
    }
  }

  final _picker = ImagePicker();
  Uint8List? imgBytes;
  Uint8List? watermarkedImgBytes;
  bool isLoading = false;
  String watermarkText = "", imgname = "image not selected";
  List<bool> textOrImage = [true, false];

  @override
  void initState() {
    _getLocation();
    _getMagnetometer();
    super.initState();
  }

  pickImage() async {
    final image = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (image != null) {
      var t = await image.readAsBytes();
      imgBytes = Uint8List.fromList(t);
    }

    String stamp = '${DateTime.now().toString()}\n'
        'Latitude : $_lat, Longitude : $_lng \n'
        'Magnetometer $_magX, $_magY, $_magZ';

    watermarkedImgBytes =
    await ImageWatermark.addTextWatermark(
      ///image bytes
      imgBytes: imgBytes!,

      ///watermark text
      watermarkText: stamp,
      font: ui.arial_14,
      color: Colors.white,
      dstX: 20,
      dstY: 30,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Stamp'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  pickImage();
                },
                child: const Text('Take Picture') ,
              ),
              const SizedBox(
                height: 10,
              ),
              watermarkedImgBytes == null
                  ? const SizedBox()
                  : Column(
                children: [
                  Image.memory(watermarkedImgBytes!,
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.width * 0.7,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent
                    ),
                    onPressed: () {
                      Uint8List? uint;
                      setState(() {
                        watermarkedImgBytes = uint;
                      });
                    },
                    child: const Text('Remove Picture') ,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}