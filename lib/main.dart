import 'package:flutter/material.dart';

class Producto {
  final int idProducto;
  final String nombre;
  final String categoria;

  Producto(
      {required this.idProducto,
      required this.nombre,
      required this.categoria});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          ProductosScreen(), // Establece ProductosScreen como la pantalla principal
    );
  }
}

class ProductosScreen extends StatelessWidget {
  final List<Map<String, dynamic>> productosData = [
    {'idProducto': 1, 'nombre': 'Laptop', 'categoria': 'Electrónica'},
    {'idProducto': 2, 'nombre': 'Camiseta', 'categoria': 'Ropa'},
    {'idProducto': 3, 'nombre': 'Libro de cocina', 'categoria': 'Libros'},
    {'idProducto': 4, 'nombre': 'Smartphone', 'categoria': 'Electrónica'},
    {'idProducto': 5, 'nombre': 'Pantalones', 'categoria': 'Ropa'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
        backgroundColor: Colors.blue[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Inicio de la parte visual de la app
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: productosData.length,
              itemBuilder: (context, index) {
                final productoMap = productosData[index];
                final id = productoMap['idProducto'] as int? ?? 0;
                final nombre =
                    productoMap['nombre'] as String? ?? 'Nombre no disponible';
                final categoria = productoMap['categoria'] as String? ??
                    'Categoría no disponible';

                Producto producto = Producto(
                    idProducto: id, nombre: nombre, categoria: categoria);

                // Inicio del container donde se muestra cada producto
                return Container(
                  margin: EdgeInsets.all(11),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: _getColor(producto.categoria),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ID: ${producto.idProducto}',
                          style: TextStyle(fontSize: 12)),
                      Text('Nombre: ${producto.nombre}',
                          style: TextStyle(fontSize: 12)),
                      Text('Categoría: ${producto.categoria}',
                          style: TextStyle(fontSize: 12)),
                    ],
                  ),
                );
                // Fin del container donde se muestra cada producto
              },
            ),
            SizedBox(height: 10),
            // Inicio del texto donde se muestra el nombre y la matricula
            Text(
              'Diego Rodriguez, Mat: 1296',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            // Fin del texto donde se muestra el nombre y la matricula
            // Fin de la parte visual de la app
          ],
        ),
      ),
    );
  }

  Color _getColor(String categoria) {
    switch (categoria) {
      case 'Electrónica':
        return Colors.blue[100]!;
      case 'Ropa':
        return Colors.green[100]!;
      case 'Libros':
        return Colors.orange[100]!;
      default:
        return Colors.grey[100]!;
    }
  }
}
