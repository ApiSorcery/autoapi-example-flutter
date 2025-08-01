import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:castor_flutter/castor_flutter.dart';
import 'package:castor_flutter/ui/entities/tuple_entity.dart';

import 'package:autoapi_example_flutter/apis/auto/demo/api_file.dart';
import 'package:autoapi_example_flutter/apis/auto/demo/api_user.dart';
import 'package:autoapi_example_flutter/apis/auto/demo/model.dart';
// import 'package:autoapi_example_flutter/entities/tuple_entity.dart';
import 'package:autoapi_example_flutter/utils/config.dart';
import 'package:autoapi_example_flutter/utils/validator.dart';
import 'package:autoapi_example_flutter/widgets/command_footer.dart';
// import 'package:autoapi_example_flutter/widgets/form/label_input_form_field.dart';
// import 'package:autoapi_example_flutter/widgets/form/label_select_form_field.dart';
// import 'package:autoapi_example_flutter/widgets/form/label_single_image_form_field.dart';
// import 'package:autoapi_example_flutter/widgets/form/label_switch_form_field.dart';
// import 'package:autoapi_example_flutter/widgets/form/lable_multiline_input_form_field.dart';
import 'package:autoapi_example_flutter/widgets/loading.dart';

class UserDetailPage extends StatefulWidget {
  final Map orderData;
  const UserDetailPage(this.orderData, {super.key});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  final _formKey = GlobalKey<FormState>();
  late BuildContext _scaffoldContext;
  late Map<String, Function> _fieldSaveHandlerMap;
  UserInfoDto? _userInfoDto;
  late int? _userId;
  String? _operateType;
  String? _userCode;
  String? _userName;
  String? _email;
  int? _gender = 2;
  String? _address;
  String? _avatar;
  bool _status = false;

  @override
  void initState() {
    super.initState();
    _userId = widget.orderData['userId'];
    _operateType = widget.orderData['operateType'];
    _fieldSaveHandlerMap = {
      'userCode': (String val) => setState(() {
            _userCode = val;
          }),
      'userName': (String val) => setState(() {
            _userName = val;
          }),
      'email': (String val) => setState(() {
            _email = val;
          }),
      'gender': (int val) => setState(() {
            _gender = val;
          }),
      'address': (String val) => setState(() {
            _address = val;
          }),
      'avatar': (String val) => setState(() {
            _avatar = val;
          }),
      'status': (bool val) => setState(() {
            _status = val;
          }),
    };
    if (_userId != null && _operateType != 'add') {
      _getInitData();
    }
  }

  void _getInitData() async {
    var req = GetUserOneRequest(id: _userId!);
    _userInfoDto = await ApiUser.getUserOne(req);
    setState(() {
      _userCode = _userInfoDto?.code;
      _userName = _userInfoDto?.name;
      _email = _userInfoDto?.email;
      _gender = _userInfoDto?.gender;
      _address = _userInfoDto?.address;
      _avatar = _userInfoDto?.avatar;
      _status = _userInfoDto?.status ?? false;
    });
  }

  /// Cancel
  Future _handleCancel(BuildContext context) async {
    Navigator.of(context).pop(false);
  }

  /// Save
  Future _handleSave(BuildContext context) async {
    if (_formKey.currentState?.validate() == false) {
      return;
    }

    _formKey.currentState?.save();
    if (_operateType == 'add') {
      await ApiUser.addUser(UserAddRequestDto(
        code: _userCode,
        name: _userName,
        email: _email,
        gender: _gender,
        address: _address,
        avatar: _avatar,
        status: _status,
      ));
    } else {
      await ApiUser.modifyUser(UserModifyRequestDto(
        id: _userId,
        code: _userCode,
        name: _userName,
        email: _email,
        gender: _gender,
        address: _address,
        avatar: _avatar,
        status: _status,
      ));
    }
    if (!mounted) return;
    await ScaffoldMessenger.of(_scaffoldContext)
        .showSnackBar(const SnackBar(
            duration: Duration(seconds: 1), content: Text("Operation successful")))
        .closed;
    if (!mounted) return;
    Navigator.of(_scaffoldContext).pop(true);
  }

  Widget _getfieldsWidget() {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(children: [
              LabelInputFormField(
                label: 'Code:',
                initialValue: _userCode,
                validator: Validator.validateEmpty(message: 'Cannot be empty'),
                saveHandler: _fieldSaveHandlerMap['userCode']!,
                enabled: _operateType == 'add',
                allowEmpty: false,
              ),
              LabelInputFormField(
                label: 'Name:',
                initialValue: _userName,
                validator: Validator.validateEmpty(message: 'Cannot be empty'),
                saveHandler: _fieldSaveHandlerMap['userName']!,
                enabled: true,
                allowEmpty: false,
              ),
              LabelInputFormField(
                label: 'Email:',
                initialValue: _email,
                validator: Validator.validateEmpty(message: 'Cannot be empty'),
                saveHandler: _fieldSaveHandlerMap['email']!,
                enabled: true,
                allowEmpty: false,
              ),
              LabelSelectFormField(
                label: 'Gender:',
                initialValue: _gender,
                options: const {0: 'Unknown', 1: 'Male', 2: 'Female'},
                saveHandler: _fieldSaveHandlerMap['gender']!,
                enabled: true,
              ),
              LabelSwitchFormField(
                label: 'Status:',
                initialValue: TupleEntity<bool, String>(
                    _status, _status == true ? 'Enabled' : 'Disabled'),
                saveHandler: _fieldSaveHandlerMap['status']!,
                enabled: true,
              ),
              LabelMultilineInputFormField(
                label: 'Address:',
                initialValue: _address,
                saveHandler: _fieldSaveHandlerMap['address']!,
                enabled: true,
              ),
              LabelSingleImageFormField(
                label: 'Avatar:',
                initialValue: _avatar,
                saveHandler: _fieldSaveHandlerMap['avatar']!,
                uploadHandler: (MultipartFile file) async {
                  var req = UploadFileRequest(file: file);
                  var imageId = await ApiFile.uploadFile(req);
                  return '${Config.apiHost}/file/$imageId';
                },
                enabled: true,
                avatarWidth: 100,
                avatarHeight: 110,
              ),
            ])));
  }

  @override
  Widget build(BuildContext context) {
    _scaffoldContext = context;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Add User'),
        ),
        body: _operateType == 'edit' && _userInfoDto == null
            ? const Loading()
            : Form(
                key: _formKey,
                child: Builder(
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      padding:
                          const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
                      child: _getfieldsWidget(),
                    );
                  },
                )),
        bottomNavigationBar: _operateType == 'edit' && _userInfoDto == null
            ? const Loading()
            : CommandFooter(
                commandFooterData: CommandFooterData(
                    details: [],
                    commandsTitle: 'Actions',
                    commands: [
                      FooterCommand('Save', _handleSave),
                      FooterCommand('Cancel', _handleCancel),
                    ])));
  }
}
