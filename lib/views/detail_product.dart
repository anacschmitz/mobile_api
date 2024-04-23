import 'package:flutter/material.dart';
import 'package:flutter_application_0504/views/test_view.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => TestView(title: "Nova Página"),
              ),
            );
          },
          child: Text('Ir para segunda page'),
        ),
      ),
    );
  }
}
