import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pcos/result.dart';

class Requestoutput {
  final String data;

  const Requestoutput({required this.data});

  factory Requestoutput.fromJson(Map<String, dynamic> json) {
    var loc = json['output'];
    return Requestoutput(data: loc);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List output = [];
  String finaloutput = '';
  onsubmit() {
    output = [
      c2.text,
      c3.text,
      c4.text,
      c5.text,
      c6.text,
      c7.text,
      c8.text,
      c9.text,
      c10.text,
      c11.text,
      c12.text,
      c13.text,
      c14.text,
      c15.text,
      c16.text,
      c17.text,
      c18.text,
      c19.text,
      c20.text,
      c21.text,
      c22.text,
      c23.text,
      c24.text,
      c25.text,
      c26.text,
      c27.text,
      c28.text,
      c29.text,
      c30.text,
      c31.text,
      c32.text,
      c33.text,
      c34.text,
      c35.text,
      c36.text,
      c37.text,
      c38.text,
      c39.text,
      c40.text,
      c41.text,
      c42.text,
      c43.text,
    ];

    if (output.contains('')) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Fill all Fields",
            style: TextStyle(
              color: Colors.white,
            ),
          )));
    } else {
      api(output);
    }
  }

  api(List output) async {
    final response =
        await http.post(Uri.parse('https://pcos-api.herokuapp.com/predict_api'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              "Access-Control-Allow-Origin": "*",
            },
            body: jsonEncode({'data': output}));
    if (response.statusCode == 200) {
      setState(() {
        finaloutput = Requestoutput.fromJson(jsonDecode(response.body)).data;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OutputScreen(prediction: finaloutput)),
      );
      return Requestoutput.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  TextEditingController c5 = TextEditingController();
  TextEditingController c6 = TextEditingController();
  TextEditingController c7 = TextEditingController();
  TextEditingController c8 = TextEditingController();
  TextEditingController c9 = TextEditingController();
  TextEditingController c10 = TextEditingController();
  TextEditingController c11 = TextEditingController();
  TextEditingController c12 = TextEditingController();
  TextEditingController c13 = TextEditingController();
  TextEditingController c14 = TextEditingController();
  TextEditingController c15 = TextEditingController();
  TextEditingController c16 = TextEditingController();
  TextEditingController c17 = TextEditingController();
  TextEditingController c18 = TextEditingController();
  TextEditingController c19 = TextEditingController();
  TextEditingController c20 = TextEditingController();
  TextEditingController c21 = TextEditingController();
  TextEditingController c22 = TextEditingController();
  TextEditingController c23 = TextEditingController();
  TextEditingController c24 = TextEditingController();
  TextEditingController c25 = TextEditingController();
  TextEditingController c26 = TextEditingController();
  TextEditingController c27 = TextEditingController();
  TextEditingController c28 = TextEditingController();
  TextEditingController c29 = TextEditingController();
  TextEditingController c30 = TextEditingController();
  TextEditingController c31 = TextEditingController();
  TextEditingController c32 = TextEditingController();
  TextEditingController c33 = TextEditingController();
  TextEditingController c34 = TextEditingController();
  TextEditingController c35 = TextEditingController();
  TextEditingController c36 = TextEditingController();
  TextEditingController c37 = TextEditingController();
  TextEditingController c38 = TextEditingController();
  TextEditingController c39 = TextEditingController();
  TextEditingController c40 = TextEditingController();
  TextEditingController c41 = TextEditingController();
  TextEditingController c42 = TextEditingController();
  TextEditingController c43 = TextEditingController();
  Widget texfield(String lable, TextEditingController inputvalue,
      List<TextInputFormatter> tf, TextInputType inputtype) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 50,
        alignment: Alignment.center,
        child: TextFormField(
          inputFormatters: tf,
          style: const TextStyle(
            color: Colors.white,
          ),
          cursorColor: Colors.white,
          keyboardType: inputtype,
          controller: inputvalue,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            label: Text(
              lable,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "PCOS",
          style: TextStyle(
              color: Color(0xFF18E4F2),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                onsubmit();
              },
              icon: const Icon(Icons.keyboard_arrow_right_sharp))
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: Colors.black,
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
                child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                texfield(
                    "Name",
                    c1,
                    [FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z. ]"))],
                    TextInputType.name),
                texfield(
                  'Patient File No.',
                  c2,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  ' Age (yrs)',
                  c3,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'Weight (Kg)',
                  c4,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'Height (Cm) ',
                  c5,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'BMI',
                  c6,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'Blood Group',
                  c7,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'Pulse rate (bpm) ',
                  c8,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'RR (breaths/min)',
                  c9,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'Hb (g/dl)',
                  c10,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'Cycle (R/I)',
                  c11,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'Cycle length (days)',
                  c12,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'Marraige Status (Yrs)',
                  c13,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                    'Pregnant (Y/N)',
                    c14,
                    [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.allow(RegExp("y|n|Y|N"))
                    ],
                    TextInputType.name),
                texfield(
                  'No. of abortions',
                  c15,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'I   beta-HCG (mIU/mL)',
                  c16,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'II    beta-HCG (mIU/mL)',
                  c17,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'FSH (mIU/mL)',
                  c18,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'LH (mIU/mL)',
                  c19,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'FSH/LH',
                  c20,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'Hip (inch)',
                  c21,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'Waist (inch)',
                  c22,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'Waist:Hip Ratio',
                  c23,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'TSH (mIU/L)',
                  c24,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'AMH (ng/mL)',
                  c25,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'PRL (ng/mL)',
                  c26,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'Vit D3 (ng/mL)',
                  c27,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'PRG (ng/mL)',
                  c28,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'RBS (mg/dl)',
                  c29,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                    'Weight gain (Y/N)',
                    c30,
                    [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.allow(RegExp("y|n|Y|N"))
                    ],
                    TextInputType.name),
                texfield(
                    'hair growth (Y/N)',
                    c31,
                    [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.allow(RegExp("y|n|Y|N"))
                    ],
                    TextInputType.name),
                texfield(
                    'Skin darkening (Y/N)',
                    c32,
                    [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.allow(RegExp("y|n|Y|N"))
                    ],
                    TextInputType.name),
                texfield(
                    'Hair loss (Y/N)',
                    c33,
                    [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.allow(RegExp("y|n|Y|N"))
                    ],
                    TextInputType.name),
                texfield(
                    'Pimples (Y/N)',
                    c34,
                    [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.allow(RegExp("y|n|Y|N"))
                    ],
                    TextInputType.name),
                texfield(
                    'Fast food (Y/N)',
                    c35,
                    [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.allow(RegExp("y|n|Y|N"))
                    ],
                    TextInputType.name),
                texfield(
                    'Reg.Exercise (Y/N)',
                    c36,
                    [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.allow(RegExp("y|n|Y|N"))
                    ],
                    TextInputType.name),
                texfield(
                  'BP _Systolic (mmHg)',
                  c37,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'BP _Diastolic (mmHg)',
                  c38,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'Follicle No. (L)',
                  c39,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'Follicle No. (R)',
                  c40,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'Avg. F size (L) (mm)',
                  c41,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'Avg. F size (R) (mm)',
                  c42,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
                texfield(
                  'Endometrium (mm)',
                  c43,
                  [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                  TextInputType.number,
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
