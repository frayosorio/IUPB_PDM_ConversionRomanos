import 'package:flutter/material.dart';

class ConversorVista extends StatefulWidget {
  const ConversorVista({super.key});

  @override
  State<ConversorVista> createState() => _ConversorState();
}

class _ConversorState extends State<ConversorVista> {
  final _txtNumero = TextEditingController();

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
                  border: OutlineInputBorder()
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
