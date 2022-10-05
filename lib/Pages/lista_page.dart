import 'package:appeleicoes/Models/candidatos.dart';
import 'package:appeleicoes/Widgets/chart.dart';
import 'package:appeleicoes/services/gerenciador.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../Providers/candidatos_provider.dart';
import '../Widgets/chart2.dart';

class ListaPage extends StatefulWidget {
  ListaPage({super.key});

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  Gerenciador gerenciador = Gerenciador();
  List<Candidato>? listaAqui = [];

  @override
  void initState() {
    teste();
    super.initState();
  }

  void teste() async {
    await gerenciador.getApi();
    setState(() {
      listaAqui = gerenciador.getCandidatos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: listaAqui!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    color: Colors.orange),
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
                                            listaAqui![index].nm.toString(),
                                          ),
                                          Container(
                                            height: 20,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: const Padding(
                                              padding: EdgeInsets.all(5.0),
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
                                        listaAqui![index].nm.toString(),
                                      ),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  '${listaAqui![index].pvap.toString()}%',
                                  style: TextStyle(
                                      color: Colors.green.shade800,
                                      fontSize: 20),
                                ),
                                Text(
                                  '${listaAqui![index].vap.toString()}',
                                  style: TextStyle(
                                      color: Colors.green.shade800,
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
          ),
        ],
      ),
    );
  }
}
