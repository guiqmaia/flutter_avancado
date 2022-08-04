// ignore_for_file: avoid_print

import 'package:brasil_fields/brasil_fields.dart';
import 'package:colorful_iconify_flutter/icons/twemoji.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

import 'cep_model.dart';

class GetApiPage extends StatefulWidget {
  const GetApiPage({Key? key}) : super(key: key);

  @override
  State<GetApiPage> createState() => _GetApiPageState();
}

class _GetApiPageState extends State<GetApiPage> {
  TextEditingController cepController = TextEditingController();
  FocusNode cepFocusNode = FocusNode();

  CepModel? cepModel;

  Future<CepModel?> getInfoByCep() async {
    try {
      String cep = cepController.text.replaceAll(RegExp('[^0-9]'), '');

      if (cep.length == 8) {
        var url = "https://viacep.com.br/ws/$cep/json/";
        final response = await Dio().get(url);

        if (response.data['erro'] != "true") {
          cepModel = CepModel.fromMap(response.data);
        } else {
          cepModel = null;
        }
      }
    } catch (e) {
      print('Deu erro $e');
    } finally {
      setState(() {});
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          'GET',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueGrey.shade800,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: 40,
          ),
        ),
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
            FutureBuilder(
              future: getInfoByCep(),
              builder: (context, AsyncSnapshot<CepModel?> snapshot) {
                if (snapshot.data == null) {
                  cepModel = null;
                  return const Text('Nenhum Resultado');
                }

                cepModel = snapshot.data;

                return Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.blue,
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
                              backgroundColor: Colors.blue,
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
                                color: Colors.blue.shade500,
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
                                    '${cepModel?.logradouro.toString()}, ${cepModel?.bairro.toString()}, ${cepModel!.localidade.toString()}',
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
                                    '${cepModel?.cep.toString()}',
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
                              backgroundColor: Colors.blue,
                              child: Text(
                                '${cepModel?.uf.toString()}',
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
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getInfoByCep,
        child: const Icon(Icons.search),
      ),
    );
  }
}
