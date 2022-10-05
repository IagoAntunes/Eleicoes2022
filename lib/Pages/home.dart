import 'package:appeleicoes/Pages/lista_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(color: Colors.green),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Eleições 2022',
                            style: TextStyle(color: Colors.white, fontSize: 36),
                          ),
                          Text(
                            'Acompanhe os votos da eleição',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Opções',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => ListaPage())),
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          elevation: 2,
                          shadowColor: Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Container(
                                    decoration: const BoxDecoration(
                                        color: Color(0xfffff4da),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.how_to_vote,
                                        size: 35,
                                        color: Color(0xfffca82f),
                                      ),
                                    )),
                                const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    'Votações',
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          elevation: 2,
                          shadowColor: Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Container(
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 184, 233, 186),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.info,
                                        size: 35,
                                        color: Colors.green,
                                      ),
                                    )),
                                const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    'Sobre',
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 10,
            child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.yellow),
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'B',
                      style: TextStyle(color: Colors.blue.shade800),
                    ),
                    Text('R', style: TextStyle(color: Colors.yellow.shade800))
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
