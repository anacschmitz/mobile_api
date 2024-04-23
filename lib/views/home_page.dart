import 'package:flutter/material.dart';
import 'package:flutter_application_0504/services/request_http.dart';
import 'package:flutter_application_0504/views/test_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
      ),
      body: FutureBuilder(
        future: getProducts(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              itemCount: snapshot.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(product: snapshot.data[index]),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 10,
                      color: Colors.grey,
                       child: SizedBox(
        height: 100,
        child: Column(
          children: [
            Image.network(
              snapshot.data[index]['images'][0],
              width: 300,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 3),
            Text('${snapshot.data[index]['title']}'),
            Text('R\$ ${snapshot.data[index]['price']}'),
                          
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Produto'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              product['images'][0],
              width: 200,
              height: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 12),
            Text('${product['title']}'),
            Text('R\$ ${product['price']}'),
            Text('R\$ ${product['brand']}'),
            Text('R\$ ${product['description']}'),
            // Adicione mais informações conforme necessário
          ],
        ),
      ),
    );
  }
}

// GridView.builder(
//         itemCount: 12,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//         ),
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Card(
//               elevation: 10,
//               color: Colors.grey,
//               child: Column(
//                 children: [
//                   Image.network('https://source.unsplash.com/300x220/?phone'),
//                   SizedBox(height: 12), 
//                   Text('Galaxy Pocket'),
//                   Text('R\$2500'),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),