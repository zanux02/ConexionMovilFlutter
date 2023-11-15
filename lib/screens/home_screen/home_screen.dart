import 'package:flutter/material.dart';
import 'package:google/presentation/provider/provider.dart';
import 'package:google/presentation/widgets/custom_bar.dart';
import 'package:google/presentation/widgets/custom_menu.dart';
import 'package:google/presentation/widgets/custom_user_header.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {

final String email;

  const HomeScreen({super.key, required this.email});
  @override
  Widget build(BuildContext context) {

    final provider =context.watch<AppProvider>();
    
    return Scaffold(   
      backgroundColor: Colors.white, 
      body: Stack(
        children: [
          Container(//Fondo azul arriba
            color: const Color.fromARGB(255, 24, 62, 153),
            width: double.infinity,
            height: 200,
          ),
          
          FutureBuilder(
            future: provider.validateUser(email),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(//columna con los objetos de la pantalla
                          children: [
                            Image (image: AssetImage("assets/images/iseneca.png"),),
                            SizedBox(
                              height: 20,
                            ),
                            CustomUserHeader(),
                            SizedBox(
                              height: 20,
                            ),
                            CustomMenu(),
                            CustomBar()
                          ],
                        ),
                      ),
                    );
              } else {
                return const Center(
                  child: Text('Loading.....'),
                );
              }
            },
          ), 
        ],
      ),
    );
  } 
}