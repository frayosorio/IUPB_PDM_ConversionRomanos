import 'package:flutter/material.dart';

class ConversorVista extends StatefulWidget {
  const ConversorVista({super.key});

  @override
  State<ConversorVista> createState() => _ConversorState();
}

class _ConversorState extends State<ConversorVista> {
  final _txtNumero = TextEditingController();
  final _keyFormulario = GlobalKey<FormState>();
  String _resultado = "Hola";

  String _convertirARomano(int numero) {
    if (numero <= 0 || numero > 3999) {
      return "El número no está en el rango";
    }
    String romano = "";

    const Map<int, String> digitosRomanos = {
      1000: "M",
      900: "CM",
      500: "D",
      400: "CD",
      100: "C",
      90: "XC",
      50: "L",
      40: "XL",
      10: "X",
      9: "IX",
      5: "V",
      4: "IV",
      1: "I",
    };

    while (numero > 0) {
      for (var clave in digitosRomanos.keys) {
        if (numero > clave) {
          romano += digitosRomanos[clave]!;
          numero -= clave;
          break;
        }
      }
    }

    return romano;
  }

  void _calcular() {
    if (_keyFormulario.currentState!.validate()) {
      final int? numero = int.tryParse(_txtNumero.text);
      if (numero != null) {
        final romano = _convertirARomano(numero);
        setState(() {
          _resultado = romano;
        });
      }
    }
  }

  @override
  Widget build(BuildContext contexto) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Convertidor a Números Romanos"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _keyFormulario,
          child: Column(
            children: [
              const Text(
                "Digite el número a convertir:",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: _txtNumero,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Número arábigo (1-3999)",
                  border: OutlineInputBorder(),
                ),
                validator: (valorDigitado) {
                  if (valorDigitado == null || valorDigitado.isEmpty) {
                    return "por favor ingrese un número";
                  }
                  final int? numero = int.tryParse(valorDigitado);
                  if (numero == null || numero <= 0 || numero > 3999) {
                    return "debe ingresar un número entre 1 y 3999";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _calcular,
                child: const Text("Convertir"),
              ),
              const SizedBox(height: 32),
              Text(_resultado, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
