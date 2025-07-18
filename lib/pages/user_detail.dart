import 'package:autoapi_example_flutter/apis/auto/demo/api_user.dart';
import 'package:autoapi_example_flutter/apis/auto/demo/model.dart';
import 'package:autoapi_example_flutter/entities/tuple_entity.dart';
import 'package:autoapi_example_flutter/utils/validator.dart';
import 'package:autoapi_example_flutter/widgets/command_footer.dart';
import 'package:autoapi_example_flutter/widgets/form/label_image_form_field.dart';
import 'package:autoapi_example_flutter/widgets/form/label_input_form_field.dart';
import 'package:autoapi_example_flutter/widgets/form/label_select_form_field.dart';
import 'package:autoapi_example_flutter/widgets/form/label_switch_form_field.dart';
import 'package:autoapi_example_flutter/widgets/form/lable_multiline_input_form_field.dart';
import 'package:flutter/material.dart';

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
  late int? _userId;
  String? _operateType;
  String? _userCode;
  String? _userName;
  String? _email;
  int? _gender = 2;
  String? _address;
  List<String>? _avatarList;
  bool? _status;

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
      'avatar': (List<String> val) => setState(() {
            _avatarList = val;
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
    var res = await ApiUser.getUserOne(req);
    setState(() {
      _userCode = res.code;
      _userName = res.name;
      _email = res.email;
      _gender = res.gender;
      _address = res.address;
      _avatarList = (res.avatar ?? '').isNotEmpty ? [res.avatar!] : [];
      _status = res.status;
    });
  }

  /// 保存
  Future _handleSave(BuildContext context) async {
    _formKey.currentState?.save();
    if (_operateType == 'add') {
      await ApiUser.addUser(UserAddRequestDto(
        code: _userCode,
        name: _userName,
        email: _email,
        gender: _gender,
        address: _address,
        avatar: _avatarList?.isNotEmpty ?? false ? _avatarList![0] : '',
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
        avatar: _avatarList?.isNotEmpty ?? false ? _avatarList![0] : '',
        status: _status,
      ));
    }
    if (!mounted) return;
    await ScaffoldMessenger.of(_scaffoldContext)
        .showSnackBar(const SnackBar(
            duration: Duration(seconds: 1), content: Text("操作成功")))
        .closed;
    if (!mounted) return;
    Navigator.of(_scaffoldContext).pop(true);
  }

  /// 取消
  Future _handleCancel(BuildContext context) async {
    Navigator.of(context).pop(false);
  }

  Widget _getfieldsWidget() {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(children: [
              LabelInputFormField(
                label: '编号:',
                initialValue: _userCode,
                validator: Validator.validateEmpty(message: '不能为空'),
                saveHandler: _fieldSaveHandlerMap['userCode']!,
                enabled: true,
                allowEmpty: false,
              ),
              LabelInputFormField(
                label: '姓名:',
                initialValue: _userName,
                validator: Validator.validateEmpty(message: '不能为空'),
                saveHandler: _fieldSaveHandlerMap['userName']!,
                enabled: true,
              ),
              LabelInputFormField(
                label: '邮箱:',
                initialValue: _email,
                validator: Validator.validateEmpty(message: '不能为空'),
                saveHandler: _fieldSaveHandlerMap['email']!,
                enabled: true,
              ),
              LabelSelectFormField(
                label: '性别:',
                initialValue: _gender,
                options: const {0: '未知', 1: '男', 2: '女'},
                saveHandler: _fieldSaveHandlerMap['gender']!,
                enabled: true,
              ),
              LabelSwitchFormField(
                label: '状态:',
                initialValue: TupleEntity<bool, String>(
                    _status ?? false, _status == true ? '启用' : '禁用'),
                saveHandler: _fieldSaveHandlerMap['status']!,
                enabled: true,
              ),
              LableMultilineInputFormField(
                label: '地址:',
                initialValue: _address,
                validator: Validator.validateEmpty(message: '不能为空'),
                saveHandler: _fieldSaveHandlerMap['address']!,
                enabled: true,
              ),
              LabelImageFormField(
                label: '头像:',
                initialValue: _avatarList,
                validator: Validator.validateEmpty(message: '不能为空'),
                saveHandler: _fieldSaveHandlerMap['avatar']!,
                enabled: true,
              ),
            ])));
  }

  @override
  Widget build(BuildContext context) {
    _scaffoldContext = context;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('添加用户'),
        ),
        body: Form(
            key: _formKey,
            child: Builder(
              builder: (BuildContext context) {
                _scaffoldContext = context;
                return SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
                  child: _getfieldsWidget(),
                );
              },
            )),
        bottomNavigationBar: CommandFooter(
            commandFooterData: CommandFooterData(
                details: [],
                commandsTitle: '操作',
                commands: [
                  FooterCommand('保存', _handleSave),
                  FooterCommand('取消', _handleCancel),
                ])));
  }
}
