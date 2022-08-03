import 'package:brasil_fields/brasil_fields.dart';
import 'package:colorful_iconify_flutter/icons/twemoji.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class GetApiPage extends StatefulWidget {
  const GetApiPage({Key? key}) : super(key: key);

  @override
  State<GetApiPage> createState() => _GetApiPageState();
}

class _GetApiPageState extends State<GetApiPage> {
  TextEditingController cepController = TextEditingController();
  FocusNode cepFocusNode = FocusNode();
  var response;
  Map cepData = {};

  Future getInfoByCep(String cep) async {
    try {
      cep = cepController.text.replaceAll(RegExp('[^0-9]'), '');
      var url = "https://viacep.com.br/ws/$cep/json/";
      response = await Dio().get(url);

      if (response.data['erro'] != "true") {
        cepData = response.data;
      } else {
        cepData.clear();
      }
      setState(() {});

      cepController.clear();
    } catch (e) {
      cepData.clear();
      print("CEP Incorreto");
      setState(() {});
      cepController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Api Rest'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              child: TextFormField(
                focusNode: cepFocusNode,
                controller: cepController,
                decoration: InputDecoration(
                  labelText: 'CEP',
                  hintText: 'CEP',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CepInputFormatter(),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Visibility(
              visible: cepData.isNotEmpty,
              replacement: const SizedBox.shrink(),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      width: 2,
                      color: Colors.pink,
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 15,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.pink,
                            radius: 20,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 18,
                              child: Iconify(
                                Twemoji.house,
                                size: 22,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'My home',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink.shade500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${cepData['logradouro']}, ${cepData['bairro']}, ${cepData['localidade']}',
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${cepData['cep']}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.pink,
                            child: Text(
                              "${cepData['uf']}",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getInfoByCep(cepController.text);
          cepFocusNode.unfocus();
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
