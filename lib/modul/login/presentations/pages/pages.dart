import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:test_synapsisid/common/extension/email_string_extension.dart';
import 'package:test_synapsisid/common/module/di/di_init_config.dart';
import 'package:test_synapsisid/common/widgets/loading_dialog_widget.dart';
import 'package:test_synapsisid/common/widgets/scanner_error_widget.dart';
import 'package:test_synapsisid/modul/home_page/presentation/pages/pages.dart';
import 'package:test_synapsisid/modul/login/presentations/login_bloc/login_bloc.dart';
import 'package:test_synapsisid/modul/login/presentations/register_bloc/register_bloc.dart';

part 'login_page.dart';
part 'register_page.dart';
part 'login_with_biometrik_page.dart';
part 'login_with_nfc_page.dart';
part 'login_with_qr_page.dart';