import 'package:flutter/material.dart';

class CalculaScreen extends StatefulWidget {
  @override
  _CalculaScreenState createState() => _CalculaScreenState();
}

class _CalculaScreenState extends State<CalculaScreen> {
  final _correnteController = TextEditingController();
  final _distanciaController = TextEditingController();

  double? bitola110;
  double? bitola220;

  void calcularBitola() {
    final corrente = double.tryParse(_correnteController.text.replaceAll(',', '.')) ?? 0;
    final distancia = double.tryParse(_distanciaController.text.replaceAll(',', '.')) ?? 0;

    final calc110 = (2 * corrente * distancia) / 294.64;
    final calc220 = (2 * corrente * distancia) / 510.4;

    setState(() {
      bitola110 = calc110;
      bitola220 = calc220;
    });
  }

  void resetar() {
    _correnteController.clear();
    _distanciaController.clear();
    setState(() {
      bitola110 = null;
      bitola220 = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Bitola'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _correnteController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Corrente elétrica (A)',
                prefixIcon: Icon(Icons.flash_on),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _distanciaController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Distância (metros)',
                prefixIcon: Icon(Icons.straighten),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: calcularBitola,
                    child: Text('Calcular'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: resetar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade400,
                      foregroundColor: Colors.black87,
                    ),
                    child: Text('Resetar'),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            if (bitola110 != null)
              Text(
                'Bitola para 110V: ${bitola110!.toStringAsFixed(2)} mm²',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            if (bitola220 != null)
              Text(
                'Bitola para 220V: ${bitola220!.toStringAsFixed(2)} mm²',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
          ],
        ),
      ),
    );
  }
}