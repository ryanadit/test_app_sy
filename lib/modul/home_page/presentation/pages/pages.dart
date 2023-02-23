import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:image/image.dart' as ui;
import 'package:image_picker/image_picker.dart';
import 'package:image_watermark/image_watermark.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:test_synapsisid/common/extension/dartz_extension.dart';
import 'package:test_synapsisid/common/module/di/di_init_config.dart';
import 'package:test_synapsisid/common/utils/date_helper.dart';
import 'package:test_synapsisid/common/utils/device_info_helper.dart';
import 'package:test_synapsisid/common/utils/name_helper.dart';
import 'package:test_synapsisid/common/widgets/loading_dialog_widget.dart';
import 'package:test_synapsisid/modul/home_page/data/models/date_model.codegen.dart';
import 'package:test_synapsisid/modul/home_page/data/repositories/date_repository_impl.dart';
import 'package:test_synapsisid/modul/home_page/domain/entity/chart_entity.dart';
import 'package:test_synapsisid/modul/home_page/domain/usecases/date/delete_date_usecase.dart';
import 'package:test_synapsisid/modul/home_page/domain/usecases/date/get_data_date_usecase.dart';
import 'package:test_synapsisid/modul/home_page/domain/usecases/date/insert_date_usecase.dart';
import 'package:test_synapsisid/modul/home_page/domain/usecases/date/update_date_usecase.dart';
import 'package:test_synapsisid/modul/login/presentations/login_bloc/login_bloc.dart';
import 'package:test_synapsisid/modul/login/presentations/pages/pages.dart';

part 'home_pages.dart';
part 'home_page_b.dart';
part 'home_page_c.dart';
part 'detail_page_crud.dart';
part 'camera_page.dart';