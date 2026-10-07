import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatefulWidget {
  const MeuApp({super.key});

  @override
  State<MeuApp> createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  bool ligado = false;
  bool aceito = false;
  double valor = 50;
  String opcao = "A";

  void clicarIcone() {
    print("Clicou no coração");
  }

  void alterarSwitch(bool novoValor) {
    setState(() {
      ligado = novoValor;
    });

    print(novoValor);
  }

  void alterarCheckbox(bool novoValor) {
    setState(() {
      aceito = novoValor;
    });

    print(novoValor);
  }

  void alterarSlider(double novoValor) {
    setState(() {
      valor = novoValor;
    });

    print(novoValor);
  }

  void alterarOpcao(String novaOpcao) {
    setState(() {
      opcao = novaOpcao;
    });

    print(novaOpcao);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Galeria de Widgets"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("IconButton"),

              IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: clicarIcone,
              ),

              const SizedBox(height: 20),

              const Text("Switch"),

              Switch(
                value: ligado,
                onChanged: (valor) {
                  alterarSwitch(valor);
                },
              ),

              const SizedBox(height: 20),

              const Text("Checkbox"),

              Checkbox(
                value: aceito,
                onChanged: (valor) {
                  alterarCheckbox(valor ?? false);
                },
              ),

              const SizedBox(height: 20),

              Text("Slider: ${valor.toInt()}"),

              Slider(
                min: 0,
                max: 100,
                value: valor,
                onChanged: (novoValor) {
                  alterarSlider(novoValor);
                },
              ),

              const SizedBox(height: 20),

              const Text("SegmentedButton"),

              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(
                    value: "A",
                    label: Text("Opção A"),
                  ),
                  ButtonSegment(
                    value: "B",
                    label: Text("Opção B"),
                  ),
                  ButtonSegment(
                    value: "C",
                    label: Text("Opção C"),
                  ),
                ],
                selected: {opcao},
                onSelectionChanged: (novaSelecao) {
                  alterarOpcao(novaSelecao.first);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}