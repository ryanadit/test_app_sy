part of 'pages.dart';

class LoginWithQRPage extends StatefulWidget {
  const LoginWithQRPage({Key? key}) : super(key: key);

  @override
  State<LoginWithQRPage> createState() => _LoginWithQRPageState();
}

class _LoginWithQRPageState extends State<LoginWithQRPage> with SingleTickerProviderStateMixin {
  late LoginBloc _loginBloc;
  BarcodeCapture? barcode;
  MobileScannerArguments? arguments;

  MobileScannerController controller = MobileScannerController(
    torchEnabled: true,
    // formats: [BarcodeFormat.qrCode]
    // facing: CameraFacing.front,
    // detectionSpeed: DetectionSpeed.normal
    // detectionTimeoutMs: 1000,
    returnImage: false,
  );

  bool isStarted = true;

  void _startOrStop() {
    try {
      if (isStarted) {
        controller.stop();
      } else {
        controller.start();
      }
      setState(() {
        isStarted = !isStarted;
      });
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Something went wrong! $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void initState() {
    _loginBloc = getIt<LoginBloc>();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
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
          Widget content = barcode?.image != null
              ? _showResultScan()
              : _scannerWidget();
          return Scaffold(
            body: /*SingleChildScrollView(
              child: Form(
                key: _keyForm,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.15),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: const Text('LOGIN QRCODE',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.015),
                    SizedBox(height: height * 0.020),
                    InkWell(
                      onTap: () {

                      },
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Scan QR',
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
                          'SCAN QR',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )*/ content,
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
    _loginBloc.add(const LoginEvent.loginQREvent());
  }

  Widget _showResultScan() {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Transform.rotate(
              angle: 90 * pi / 180,
              child: Image(
                gaplessPlayback: true,
                image: MemoryImage(barcode!.image!),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        if (barcode?.image != null) ...[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.005,
          ),
          Center(
            child: Text(barcode?.barcodes.first.rawValue ?? '',
              style: const TextStyle(
                color: Colors.indigoAccent,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
          ),
        ],
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        const Center(
          child: Text('Scan QR berhasil, lanjut login?'),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        Center(
          child: Container(
            color: Colors.blue,
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextButton(
                onPressed: _onSave,
                child: const Text('Ya',
                  style: TextStyle(
                      color: Colors.white
                  ),
                )
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        Center(
          child: Container(
            color: Colors.redAccent,
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextButton(
                onPressed: () {
                  BarcodeCapture? barCap;
                  setState(() {
                    barcode = barCap;
                    controller = MobileScannerController(
                      torchEnabled: true,
                      returnImage: true,
                    );
                    controller.start();
                  });
                },
                child: const Text('Tidak',
                  style: TextStyle(
                      color: Colors.white
                  ),
                )
            ),
          ),
        ),
      ],
    );
  }

  Widget _scannerWidget() {
    return Stack(
      children: [
        MobileScanner(
          controller: controller,
          errorBuilder: (context, error, child) {
            return ScannerErrorWidget(error: error);
          },
          fit: BoxFit.contain,
          onDetect: (barcode) {
            setState(() {
              this.barcode = barcode;
              controller.stop();
            });
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.bottomCenter,
            height: 100,
            color: Colors.black.withOpacity(0.4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  color: Colors.white,
                  icon: ValueListenableBuilder(
                    valueListenable: controller.torchState,
                    builder: (context, state, child) {
                      switch (state) {
                        case TorchState.off:
                          return const Icon(
                            Icons.flash_off,
                            color: Colors.grey,
                          );
                        case TorchState.on:
                          return const Icon(
                            Icons.flash_on,
                            color: Colors.yellow,
                          );
                      }
                    },
                  ),
                  iconSize: 32.0,
                  onPressed: () => controller.toggleTorch(),
                ),
                IconButton(
                  color: Colors.white,
                  icon: isStarted
                      ? const Icon(Icons.stop)
                      : const Icon(Icons.camera_alt_outlined),
                  iconSize: 32.0,
                  onPressed: _startOrStop,
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 200,
                    height: 50,
                    child: FittedBox(
                      child: Text(
                        barcode?.barcodes.first.rawValue ??
                            'Scan QR',
                        overflow: TextOverflow.fade,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  color: Colors.white,
                  icon: ValueListenableBuilder(
                    valueListenable: controller.cameraFacingState,
                    builder: (context, state, child) {
                      switch (state) {
                        case CameraFacing.front:
                          return const Icon(Icons.camera_front);
                        case CameraFacing.back:
                          return const Icon(Icons.camera_rear);
                      }
                    },
                  ),
                  iconSize: 32.0,
                  onPressed: () => controller.switchCamera(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}

class BarcodeScannerWithController extends StatefulWidget {
  const BarcodeScannerWithController({Key? key}) : super(key: key);

  @override
  State<BarcodeScannerWithController> createState() =>
      _BarcodeScannerWithControllerState();
}

class _BarcodeScannerWithControllerState
    extends State<BarcodeScannerWithController>
    with SingleTickerProviderStateMixin {
  BarcodeCapture? barcode;

  MobileScannerController controller = MobileScannerController(
    torchEnabled: true,
    // formats: [BarcodeFormat.qrCode]
    // facing: CameraFacing.front,
    // detectionSpeed: DetectionSpeed.normal
    // detectionTimeoutMs: 1000,
    // returnImage: false,
  );

  bool isStarted = true;

  void _startOrStop() {
    try {
      if (isStarted) {
        controller.stop();
      } else {
        controller.start();
      }
      setState(() {
        isStarted = !isStarted;
      });
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Something went wrong! $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Builder(
        builder: (context) {
          return Stack(
            children: [
              MobileScanner(
                controller: controller,
                errorBuilder: (context, error, child) {
                  return ScannerErrorWidget(error: error);
                },
                fit: BoxFit.contain,
                onDetect: (barcode) {
                  setState(() {
                    this.barcode = barcode;
                  });
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: 100,
                  color: Colors.black.withOpacity(0.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: controller.hasTorchState,
                        builder: (context, state, child) {
                          if (state != true) {
                            return const SizedBox.shrink();
                          }
                          return IconButton(
                            color: Colors.white,
                            icon: ValueListenableBuilder(
                              valueListenable: controller.torchState,
                              builder: (context, state, child) {
                                switch (state) {
                                  case TorchState.off:
                                    return const Icon(
                                      Icons.flash_off,
                                      color: Colors.grey,
                                    );
                                  case TorchState.on:
                                    return const Icon(
                                      Icons.flash_on,
                                      color: Colors.yellow,
                                    );
                                }
                              },
                            ),
                            iconSize: 32.0,
                            onPressed: () => controller.toggleTorch(),
                          );
                        },
                      ),
                      IconButton(
                        color: Colors.white,
                        icon: isStarted
                            ? const Icon(Icons.stop)
                            : const Icon(Icons.play_arrow),
                        iconSize: 32.0,
                        onPressed: _startOrStop,
                      ),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 200,
                          height: 50,
                          child: FittedBox(
                            child: Text(
                              barcode?.barcodes.first.rawValue ??
                                  'Scan something!',
                              overflow: TextOverflow.fade,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        color: Colors.white,
                        icon: ValueListenableBuilder(
                          valueListenable: controller.cameraFacingState,
                          builder: (context, state, child) {
                            switch (state) {
                              case CameraFacing.front:
                                return const Icon(Icons.camera_front);
                              case CameraFacing.back:
                                return const Icon(Icons.camera_rear);
                            }
                          },
                        ),
                        iconSize: 32.0,
                        onPressed: () => controller.switchCamera(),
                      ),
                      /*IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.image),
                        iconSize: 32.0,
                        onPressed: () async {
                          final ImagePicker picker = ImagePicker();
                          // Pick an image
                          final XFile? image = await picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          if (image != null) {
                            if (await controller.analyzeImage(image.path)) {
                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Barcode found!'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } else {
                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('No barcode found!'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                      ),*/
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class BarcodeScannerReturningImage extends StatefulWidget {
  const BarcodeScannerReturningImage({Key? key}) : super(key: key);

  @override
  State<BarcodeScannerReturningImage> createState() =>
      _BarcodeScannerReturningImageState();
}

class _BarcodeScannerReturningImageState
    extends State<BarcodeScannerReturningImage>
    with SingleTickerProviderStateMixin {
  BarcodeCapture? barcode;
  MobileScannerArguments? arguments;

  MobileScannerController controller = MobileScannerController(
    torchEnabled: true,
    // formats: [BarcodeFormat.qrCode]
    // facing: CameraFacing.front,
    // detectionSpeed: DetectionSpeed.normal
    // detectionTimeoutMs: 1000,
    returnImage: true,
  );

  bool isStarted = true;

  void _startOrStop() {
    try {
      if (isStarted) {
        controller.stop();
      } else {
        controller.start();
      }
      setState(() {
        isStarted = !isStarted;
      });
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Something went wrong! $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: barcode?.image != null ? _showResultScan() : _scannerWidget(),
      ),
    );
  }

  Widget _showResultScan() {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Transform.rotate(
              angle: 90 * pi / 180,
              child: Image(
                gaplessPlayback: true,
                image: MemoryImage(barcode!.image!),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        const Center(
          child: Text('Scan QR berhasil, lanjut login?'),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        Center(
          child: Container(
            color: Colors.blue,
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextButton(
                onPressed: () {},
                child: const Text('Ya',
                  style: TextStyle(
                      color: Colors.white
                  ),
                )
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        Center(
          child: Container(
            color: Colors.redAccent,
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextButton(
                onPressed: () {
                  BarcodeCapture? barCap;
                  setState(() {
                    barcode = barCap;
                    controller = MobileScannerController(
                      torchEnabled: true,
                      returnImage: true,
                    );
                    controller.start();
                  });
                },
                child: const Text('Tidak',
                  style: TextStyle(
                      color: Colors.white
                  ),
                )
            ),
          ),
        ),
      ],
    );
  }

  Widget _scannerWidget() {
    return Stack(
      children: [
        MobileScanner(
          controller: controller,
          errorBuilder: (context, error, child) {
            return ScannerErrorWidget(error: error);
          },
          fit: BoxFit.contain,
          onDetect: (barcode) {
            setState(() {
              this.barcode = barcode;
              controller.stop();
            });
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.bottomCenter,
            height: 100,
            color: Colors.black.withOpacity(0.4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  color: Colors.white,
                  icon: ValueListenableBuilder(
                    valueListenable: controller.torchState,
                    builder: (context, state, child) {
                      switch (state) {
                        case TorchState.off:
                          return const Icon(
                            Icons.flash_off,
                            color: Colors.grey,
                          );
                        case TorchState.on:
                          return const Icon(
                            Icons.flash_on,
                            color: Colors.yellow,
                          );
                      }
                    },
                  ),
                  iconSize: 32.0,
                  onPressed: () => controller.toggleTorch(),
                ),
                IconButton(
                  color: Colors.white,
                  icon: isStarted
                      ? const Icon(Icons.stop)
                      : const Icon(Icons.camera_alt_outlined),
                  iconSize: 32.0,
                  onPressed: _startOrStop,
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 200,
                    height: 50,
                    child: FittedBox(
                      child: Text(
                        barcode?.barcodes.first.rawValue ??
                            'Scan QR',
                        overflow: TextOverflow.fade,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  color: Colors.white,
                  icon: ValueListenableBuilder(
                    valueListenable: controller.cameraFacingState,
                    builder: (context, state, child) {
                      switch (state) {
                        case CameraFacing.front:
                          return const Icon(Icons.camera_front);
                        case CameraFacing.back:
                          return const Icon(Icons.camera_rear);
                      }
                    },
                  ),
                  iconSize: 32.0,
                  onPressed: () => controller.switchCamera(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
