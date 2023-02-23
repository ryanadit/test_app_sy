part of 'pages.dart';

class DetailPageCRUD extends StatefulWidget {
  final DateModel? dateModel;
  const DetailPageCRUD({Key? key, this.dateModel}) : super(key: key);

  @override
  State<DetailPageCRUD> createState() => _DetailPageCRUD();
}

class _DetailPageCRUD extends State<DetailPageCRUD> {
  late TextEditingController _inputText, _dateController;
  int? id;

  final _keyForm = GlobalKey<FormState>();

  void _updateDataDate() async {
    UpdateDateUsecase updateData = UpdateDateUsecase(DateRepositoryImpl());
    LoadingDialogWidget.showLoading(context);
    final resultUpdate = await updateData.call(
      DateModel(
          input: _inputText.text,
          dateTime: _dateController.text,
          id: id
      )
    );
    if (resultUpdate.isRight()) {
      if (resultUpdate.getRight() == true) {
        _showSnackBar('Berhasil Update');
        Future.delayed(const Duration(milliseconds: 1000)).then((value) {
          Navigator.of(context).pop();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const HomePage()), (route) => false);
        });
      } else {
        Future.delayed(const Duration(milliseconds: 1000)).then((value) {
          _showSnackBar('Gagal Update');
          Navigator.of(context).pop();
        });
      }
    } else {
      Future.delayed(const Duration(milliseconds: 1000)).then((value){
        _showSnackBar('${resultUpdate.getLeft()?.failureMessage}');
        Navigator.of(context).pop();
      });
    }

  }

  void _insertDataDate() async {
    InsertDateUsecase insertData = InsertDateUsecase(DateRepositoryImpl());
    LoadingDialogWidget.showLoading(context);
    final resultUpdate = await insertData.call(
        DateModel(
            input: _inputText.text,
            dateTime: _dateController.text,
        )
    );
    if (resultUpdate.isRight()) {
      if (resultUpdate.getRight() == true) {
        _showSnackBar('Berhasil Simpan Data');
        Future.delayed(const Duration(milliseconds: 1000)).then((value) {
          Navigator.of(context).pop();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const HomePage()), (route) => false);
        });
      } else {
        Future.delayed(const Duration(milliseconds: 1000)).then((value) {
          _showSnackBar('Gagal Simpan');
          Navigator.of(context).pop();
        });
      }
    } else {
      Future.delayed(const Duration(milliseconds: 1000)).then((value){
        _showSnackBar('${resultUpdate.getLeft()?.failureMessage}');
        Navigator.of(context).pop();
      });
    }

  }

  void _deleteDataDate() async {
    DeleteDateUsecase deleteData = DeleteDateUsecase(DateRepositoryImpl());
    LoadingDialogWidget.showLoading(context);
    final resultUpdate = await deleteData.call(
        DateModel(
            input: _inputText.text,
            dateTime: _dateController.text,
            id: id
        )
    );
    if (resultUpdate.isRight()) {
      if (resultUpdate.getRight() == true) {
        _showSnackBar('Berhasil Delete Data');
        Future.delayed(const Duration(milliseconds: 1000)).then((value) {
          Navigator.of(context).pop();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const HomePage()), (route) => false);
        });
      } else {
        Future.delayed(const Duration(milliseconds: 1000)).then((value) {
          _showSnackBar('Gagal Delete');
          Navigator.of(context).pop();
        });
      }
    } else {
      Future.delayed(const Duration(milliseconds: 1000)).then((value){
        _showSnackBar('${resultUpdate.getLeft()?.failureMessage}');
        Navigator.of(context).pop();
      });
    }

  }

  void _getInfoIdModel() {
    if (widget.dateModel != null && widget.dateModel?.id != null) {
      setState(() {
        id = widget.dateModel?.id;
      });
    }
  }

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(), //get today's date
        firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101)
    );

    if(pickedDate != null ){
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(formattedDate);

      setState(() {
        _dateController.text = formattedDate; //set foratted date to TextField value.
      });
    }else{
      _showSnackBar('Date is not selected');
    }
  }

  @override
  void initState() {
    _inputText = TextEditingController(text: widget.dateModel?.input ?? '');
    _dateController = TextEditingController(text: widget.dateModel?.dateTime ?? '');
    _getInfoIdModel();
    super.initState();
  }

  @override
  void dispose() {
    _inputText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Date'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _keyForm,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.030),
                SizedBox(
                  width: width * 0.8,
                  child: TextFormField(
                    controller: _inputText,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val != null && val.isNotEmpty) {
                        return null;
                      }
                      return 'Input harap diisi';
                    },
                    decoration: const InputDecoration(
                        label: Text('Input'),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.025),
                SizedBox(
                  width: width * 0.8,
                  child: TextFormField(
                    controller: _dateController,
                    readOnly: true,
                    validator: (val) {
                      if (val != null && val.isNotEmpty) {
                        return null;
                      }
                      return 'Tanggal harap diisi';
                    },
                    decoration: const InputDecoration(
                        label: Text('Enter Date'),
                        icon: Icon(Icons.calendar_today),
                    ),
                    onTap: _pickDate,
                  ),
                ),
                SizedBox(height: height * 0.025),
                Container(
                  color: Colors.blue,
                  width: width * 0.8,
                  child: TextButton(
                    onPressed: widget.dateModel != null ? _updateDataDate :_onSave,
                    child: const Text(
                      'Simpan',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.015),
                Container(
                  color: Colors.redAccent,
                  width: width * 0.8,
                  child: TextButton(
                    onPressed: _deleteDataDate,
                    child: const Text(
                      'Hapus',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.015),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSave() {
    final valid = _keyForm.currentState?.validate() ?? false;
    if (valid) {
      FocusScope.of(context).unfocus();
      _insertDataDate();
    }
  }

  void _showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

}
