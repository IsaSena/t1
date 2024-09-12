import 'dart:math';

import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  bool initApp = false;
  bool isPause = false;
  int volume = 0;

  int doubleValue = Random().nextInt(300);

  _increaseVolume() {
    if (volume >= 15) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text('Alerta!'),
            content: Text('O volume já está no maximo!\n\nVolume máximo: 15.'),
          );
        },
      );
    } else {
      volume = volume + 1;
    }
    setState(() {});
  }

  _decreaseVolume() {
    if (volume <= 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text('Alerta!'),
            content: Text('O volume já está no mínimo!\n\nVolume mínimo: 0.'),
          );
        },
      );
    } else {
      volume = volume - 1;
    }
    setState(() {});
  }

  _volumeIcon() {
    if (volume == 0) {
      return const Icon(Icons.volume_mute);
    } else if (volume > 0 && volume <= 7) {
      return const Icon(Icons.volume_down);
    } else {
      return const Icon(Icons.volume_up);
    }
  }

  List<Widget> _buildVolumeBars() {
    return List.generate(volume, (index) {
      return Container(
        width: 10,
        height: 2,
        margin: const EdgeInsets.symmetric(vertical: 1),
        color: index < volume ? Colors.blue : Colors.grey,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF5DEB3),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: initApp == false
            ? Center(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    child: const Icon(Icons.power_settings_new),
                    onPressed: () {
                      initApp = !initApp;
                      setState(() {});
                    },
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        children: [
                          Text(
                            'Isabela Rodrigues Sena',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),

                        ],
                      ),
                      ElevatedButton(
                        child: const Icon(Icons.power_settings_new),
                        onPressed: () {
                          initApp = !initApp;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$doubleValue',
                            style: const TextStyle(
                                fontSize: 30, color: Colors.black),
                          ),
                          const Text(
                            'FM/AM',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                child: const Icon(Icons.skip_previous),
                                onPressed: () {
                                  doubleValue = Random().nextInt(300);
                                  setState(() {});
                                },
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                child: isPause == false
                                    ? const Icon(Icons.play_arrow)
                                    : const Icon(Icons.pause),
                                onPressed: () {
                                  isPause = !isPause;
                                  setState(() {});
                                },
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                child: const Icon(Icons.skip_next),
                                onPressed: () {
                                  doubleValue = Random().nextInt(300);
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: _volumeIcon(),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        children: [
                          SizedBox(
                            height: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: _buildVolumeBars(),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '$volume',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton(
                        child: const Icon(Icons.add),
                        onPressed: () {
                          _increaseVolume();
                        },
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        child: const Icon(Icons.remove),
                        onPressed: () {
                          _decreaseVolume();
                        },
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
