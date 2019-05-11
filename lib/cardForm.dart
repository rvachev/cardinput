import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class cardForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return cardFormState();
  }
}

class cardFormState extends State<cardForm> {
  var value = 0;
  var mainColor = Colors.white;
  String text = 'Awesome text';
  var currentButtonColor = Colors.grey;
  String valueOfField = '12341234';
  String result = '';
  Widget numberWidget;

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          //result = "Camera permission was denied";
        });
      } else {
        setState(() {
          //result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        //result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        //result = "Unknown Error $ex";
      });
    }
    _checkString();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedContainer(
            height: 250,
            margin: EdgeInsets.all(8.0),
            width: double.infinity,
            duration: Duration(seconds: 1),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(
                    'http://etk55.ru/images/логотип_итог.jpg',
                    height: 50,
                    width: 100,
                  ),
                  Row(
                    children: <Widget>[
                      numberWidget,
                      IconButton(
                        icon: Icon(Icons.photo_camera),
                        onPressed: () {
                          _scanQR();
                        },
                        color: currentButtonColor,
                      ),
                      IconButton(
                          icon: Icon(Icons.create),
                          onPressed: () {
                            _changeNumber();
                          },
                          color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
          ),
          OutlineButton(
            borderSide: BorderSide(color: Colors.green),
            splashColor: Color(0xFF66BB6A),
            textTheme: ButtonTextTheme.normal,
            highlightedBorderColor: Colors.green,
            onPressed: () {
              _changeValue();
            },
            child: Text('Принять'),
          ),
        ],
      ),
    );
  }

  _changeNumber() {
    setState(() {
      numberWidget = Form(
        child: SizedBox(
          width: 150,
          child: TextFormField(
            keyboardType: TextInputType.numberWithOptions(),
              initialValue: result,
              decoration: InputDecoration(
                  hintText: 'Номер',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0)))),
        ),
      );
    });
  }

  _changeValue() {
    setState(() {
      valueOfField = valueOfField == '12341234' ? '43214321' : '12341234';
    });
  }

  _fieldToText(){
    setState(() {
      numberWidget = SizedBox(
        width: 150,
        child: Text(
          result,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      );
    });
  }

  _checkString() {
    if (result == '') {
      setState(() {
        numberWidget = Form(
          child: SizedBox(
            width: 150,
            child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                    hintText: 'Номер',
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(color: Colors.grey, width: 2.0)))),
          ),
        );
      });
    } else {
      setState(() {
        numberWidget = SizedBox(
          width: 150,
          child: Text(
            result,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      numberWidget = Form(
        child: SizedBox(
          width: 150,
          child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Номер',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0)))),
        ),
      );
    });
  }

}
