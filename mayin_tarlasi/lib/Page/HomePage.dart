import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mayin_tarlasi/widget/Mayin.dart';
import 'package:mayin_tarlasi/Page/Beginner.dart';
import 'package:mayin_tarlasi/widget/numberbox.dart';

import '../Function/Function.dart';

class HomePage extends StatefulWidget {
  String baslik;
  int zorluk;
  HomePage({super.key, required this.baslik, required this.zorluk});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int kare_Sayisi = 9 * 13;
  int satir_kare_sayisi = 9;
  List Kare_durumu = [];
  final List<int> mayin_konumu = [];
  bool mayin_durumu = false;

  Timer? timer;
  bool started = false;
  int zaman = 0;

  void time_stop() {
    setState(() {
      if (timer != null) {
        timer?.cancel();
      }
      setState(() {
        started = false;
      });
    });
  }

  void time_reset() {
    if (timer != null) {
      timer?.cancel();
    }
    setState(() {
      zaman = 0;
    });
  }

  void time_start() {
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        zaman = zaman + 1;
      });
    });
  }

  void restartGame() {
    setState(() {
      mayin_durumu = false;
      for (int i = 0; i < kare_Sayisi; i++) {
        Kare_durumu[i][1] = false;
      }
      time_reset();
    });
  }

  playerLost() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[700],
          title: const Center(
            child: Text(
              "KAYBETTİN ",
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            MaterialButton(
                color: Colors.grey[100],
                child: const Icon(
                  Icons.refresh,
                ),
                onPressed: () {
                  restartGame();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => BeginnerPage()));
                })
          ],
        );
      },
    );
  }

  void playerWon() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[700],
          title: const Center(
            child: Text(
              "KAZANDIN ",
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            MaterialButton(
                color: Colors.grey[100],
                child: const Icon(
                  Icons.refresh,
                ),
                onPressed: () {
                  restartGame();
                  Navigator.pop(context);
                })
          ],
        );
      },
    );
  }

  void checkWinner() {
    int acilmamis_kare = 0;
    for (int i = 0; i < kare_Sayisi; i++) {
      if (Kare_durumu[i][1] == false) {
        acilmamis_kare++;
      }
    }

    if (acilmamis_kare == mayin_konumu.length) {
      playerWon();
    }
  }

  void random_mayin() {
    for (int i = 0; i < widget.zorluk; i++) {
      int random = Random().nextInt(116);
      mayin_konumu.add(random);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < kare_Sayisi; i++) {
      Kare_durumu.add([0, false]);
    }

    random_mayin();
  }

  Widget build(BuildContext context) {
    setState(() {
      scanBombs(kare_Sayisi, satir_kare_sayisi, mayin_konumu, Kare_durumu);
    });
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 150,
              color: Colors.grey[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        mayin_konumu.length.toString(),
                        style: TextStyle(fontSize: 40),
                      ),
                      SizedBox(
                          width: 60,
                          height: 60,
                          child: Image.asset("assets/mayın.png"))
                    ],
                  ),
                  GestureDetector(
                    onTap: restartGame,
                    child: Card(
                      child: Icon(
                        Icons.refresh,
                        size: 40,
                        color: Colors.white,
                      ),
                      color: Colors.grey[700],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        zaman.toString(),
                        style: TextStyle(fontSize: 40),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Icon(
                          Icons.timer_rounded,
                          size: 30,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: kare_Sayisi,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: satir_kare_sayisi),
                itemBuilder: (context, index) {
                  if (mayin_konumu.contains(index)) {
                    return Mayin(
                      revelead: mayin_durumu,
                      function: () {
                        setState(() {
                          mayin_durumu = true;
                          time_stop();
                        });

                        playerLost();
                      },
                    );
                  } else {
                    return MyNumberBox(
                      child: Kare_durumu[index][0],
                      revelead: Kare_durumu[index][1],
                      function: () {
                        if (started == false) {
                          time_start();
                        }
                        setState(() {
                          revealBoxNumber(index, Kare_durumu, satir_kare_sayisi,
                              kare_Sayisi);
                        });

                        checkWinner();
                      },
                    );
                  }
                },
              ),
            ),
            Text(
              widget.baslik,
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
