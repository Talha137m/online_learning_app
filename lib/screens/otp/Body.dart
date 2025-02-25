import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';
import 'package:flutter/services.dart';

import 'package:classes_app/theme/Color.dart';
import 'package:classes_app/utils/app_localizations.dart';

class Body extends StatelessWidget {
  Body(
      {Key? key,
      required this.errorController,
      required this.textEditingController,
      required this.submitClick})
      : super(key: key);

  final List<TextInputFormatter> inputFormatters = [
    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
  ];
  TextEditingController textEditingController;
  StreamController<ErrorAnimationType> errorController;

  Function(String) submitClick;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(20.0),
      children: <Widget>[
        new PinCodeTextField(
          appContext: context,
          length: 4,
          obscureText: false,
          animationType: AnimationType.fade,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          inputFormatters: inputFormatters,
          keyboardType: TextInputType.number,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.underline,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            activeFillColor: ColorsInt.colorBG,
            inactiveFillColor: ColorsInt.colorBG,
            activeColor: ColorsInt.colorPrimary,
            inactiveColor: ColorsInt.colorPrimary,
            selectedColor: ColorsInt.colorPrimary,
          ),
          //inputFormatters: ,
          animationDuration: Duration(milliseconds: 200),
          backgroundColor: ColorsInt.colorBG,
          enableActiveFill: false,
          textStyle: TextStyle(
              fontFamily: "regular",
              fontSize: 20.0,
              color: ColorsInt.colorText),
          errorAnimationController: errorController,
          controller: textEditingController,
          onCompleted: (v) {
            print("Completed");
          },
          onChanged: (value) {
            print(value);
            /*setState(() {
              currentText = value;
            });*/
          },
          beforeTextPaste: (text) {
            print("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ),
        new SizedBox(
          height: 20.0,
        ),
        new InkWell(
          child: new Container(
            decoration: new BoxDecoration(
              color: ColorsInt.colorPrimary,
              borderRadius: new BorderRadius.all(Radius.circular(8)),
            ),
            padding: EdgeInsets.all(10.0),
            child: new Center(
              child: Text(
                AppLocalizations.of(context).translate("submit"),
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "bold",
                    color: ColorsInt.colorWhite),
              ),
            ),
          ),
          onTap: () {
            submitClick(textEditingController.text.toString());
          },
        ),
      ],
    );
  }
}
