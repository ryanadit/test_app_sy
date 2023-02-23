part of 'pages.dart';

class HomePageC extends StatefulWidget {
  const HomePageC({Key? key}) : super(key: key);

  @override
  State<HomePageC> createState() => _HomePageCState();
}

class _HomePageCState extends State<HomePageC> {

  late List<ChartEntity> data;
  late TooltipBehavior _tooltip;

  MapController _mapController = MapController();

  double defaultZoom = 14.5;

  /// SENSOR DATA
  // for accelerometer
  double _accX = 0;
  double _accY = 0;
  double _accZ = 0;

  // for gyroscope
  double _gyroX = 0;
  double _gyroY = 0;
  double _gyroZ = 0;

  // for magnetometer
  double _magX = 0;
  double _magY = 0;
  double _magZ = 0;

  // for location
  double? _lat;
  double? _lgd;

  void _getAccelerometer() async {
    try {
      await accelerometerEvents.first.then((event) {
        setState(() {
          _accX = event.x;
          _accY = event.y;
          _accZ = event.z;
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
            _gyroX = event.x;
            _gyroY = event.y;
            _gyroZ = event.z;
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

  void _getLocation() async {
    try {
      final infoLocation = await DeviceInfoHelper().determinePosition;
      setState(() {
        _lat = infoLocation.latitude;
        _lgd = infoLocation.longitude;
      });
    } catch(e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }
  }

  @override
  void initState() {
    _getAccelerometer();
    _getGyroscope();
    _getMagnetometer();
    _getLocation();
    _tooltip = TooltipBehavior(enable: true);
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page C'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: height * 0.015),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Grafik Sensor',
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              _chartAcc(),
              _chartGyro(),
              _chartMagneto(),
              if (_lgd != null && _lat != null) _maps(),
              SizedBox(
                height: height * 0.025,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chartAcc() {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: width * 0.4,
      child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          title: ChartTitle(text: 'Accelerometer Sensor Grafik'),
          tooltipBehavior: _tooltip,
          series: <LineSeries<ChartEntity, String>>[
            LineSeries<ChartEntity, String>(
                dataSource:  <ChartEntity>[
                  ChartEntity('X', _accX),
                  ChartEntity('Y', _accY),
                  ChartEntity('Z', _accZ),
                ],
                xValueMapper: (ChartEntity sales, _) => sales.type,
                yValueMapper: (ChartEntity sales, _) => sales.value,
                // Enable data label
                dataLabelSettings: const DataLabelSettings(isVisible: true)
            )
          ]
      ),
    );
  }

  Widget _chartGyro() {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: width * 0.4,
      child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          title: ChartTitle(text: 'Gyroscope Sensor Grafik'),
          tooltipBehavior: _tooltip,
          series: <LineSeries<ChartEntity, String>>[
            LineSeries<ChartEntity, String>(
                dataSource:  <ChartEntity>[
                  ChartEntity('X', _gyroX),
                  ChartEntity('Y', _gyroY),
                  ChartEntity('Z', _gyroZ),
                ],
                xValueMapper: (ChartEntity sales, _) => sales.type,
                yValueMapper: (ChartEntity sales, _) => sales.value,
                // Enable data label
                dataLabelSettings: const DataLabelSettings(isVisible: true)
            )
          ]
      ),
    );
  }

  Widget _chartMagneto() {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: width * 0.4,
      child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          title: ChartTitle(text: 'Magnetometer Sensor Grafik'),
          tooltipBehavior: _tooltip,
          series: <LineSeries<ChartEntity, String>>[
            LineSeries<ChartEntity, String>(
                dataSource:  <ChartEntity>[
                  ChartEntity('X', _magX),
                  ChartEntity('Y', _magY),
                  ChartEntity('Z', _magZ),
                ],
                xValueMapper: (ChartEntity sales, _) => sales.type,
                yValueMapper: (ChartEntity sales, _) => sales.value,
                // Enable data label
                dataLabelSettings: const DataLabelSettings(isVisible: true)
            )
          ]
      ),
    );
  }

  Widget _maps() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.4,
      width: width * 0.8,
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(_lat ?? 0, _lgd ?? 0),
          zoom: defaultZoom,
        ),
        nonRotatedChildren: [
          AttributionWidget.defaultWidget(
            source: 'OpenStreetMap contributors',
            onSourceTapped: null,
          ),
        ],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          MarkerLayer(markers: _buildMarkersOnMap(),)
        ],
        // mapController: _mapController,
      ),
    );
  }

  List<Marker> _buildMarkersOnMap() {
    List<Marker> markers = [];
    var marker =  Marker(
      point: LatLng(_lat ?? 0, _lgd ?? 0),
      builder: (context) => const Icon(Icons.location_on, color: Colors.redAccent,),
    );
    markers.add(marker);
    return markers;
  }

}
