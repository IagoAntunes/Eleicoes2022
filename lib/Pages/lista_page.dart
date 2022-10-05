import 'package:appeleicoes/Models/candidatos.dart';
import 'package:appeleicoes/Models/eleicao.dart';

import 'package:appeleicoes/services/gerenciador.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../Widgets/Indicator.dart';
import '../Widgets/chart2.dart';

class ListaPage extends StatefulWidget {
  ListaPage({super.key});

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  Gerenciador gerenciador = Gerenciador();
  List<Candidato>? listaCandidatos = [];
  List<PieChartSectionData> data = [];
  List<Widget> listaIndicator = [];
  Eleicao? eleicao;
  @override
  void initState() {
    super.initState();
  }

  void zeraValores() {
    listaCandidatos = [];
    eleicao!.cand = [];
    data = [];
  }

  Future<bool> consultaApi() async {
    if (listaCandidatos!.length < 1) {
      await gerenciador.getApi();
      setState(() {
        eleicao = gerenciador.getEleicao();
        listaCandidatos = eleicao!.cand;
      });
      for (var pessoa in listaCandidatos!) {
        if (int.parse(pessoa.seq!) <= 3) {
          data.add(
            PieChartSectionData(
              title: pessoa.nm,
              color: pessoa.color,
              value: double.parse(
                pessoa.pvap!.replaceAll(',', '.'),
              ),
            ),
          );
        }
      }
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resultados',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: FutureBuilder(
          future: consultaApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: PageView(
                      children: [
                        PieChartSample1(
                          listaCand: listaCandidatos!.isEmpty
                              ? []
                              : listaCandidatos!.sublist(0, 4),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '${eleicao!.pvv}% das seções totalizadas',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  LinearProgressIndicator(
                                    minHeight: 10,
                                    value: double.parse(
                                        eleicao!.pvv!.replaceAll(',', '.')),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 60),
                              child: GestureDetector(
                                onTap: () => setState(() {
                                  zeraValores();
                                }),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.refresh,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //Lista
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: listaCandidatos!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(30)),
                                          color: listaCandidatos![index].color),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: Text(
                                          listaCandidatos![index].n!,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: index == 0 || index == 1
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  listaCandidatos![index]
                                                      .nm
                                                      .toString(),
                                                ),
                                                Container(
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    child: Text(
                                                      '2 Turno',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Text(
                                              listaCandidatos![index]
                                                  .nm
                                                  .toString(),
                                            ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '${listaCandidatos![index].pvap.toString()}%',
                                        style: TextStyle(
                                            color:
                                                listaCandidatos![index].e == 's'
                                                    ? Colors.green.shade800
                                                    : Colors.grey,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        listaCandidatos![index].vap.toString(),
                                        style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
