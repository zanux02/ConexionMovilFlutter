import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google/presentation/provider/provider.dart';
import 'package:google/presentation/widgets/custom_button.dart';
import 'package:google/services/firebase_service.dart';
import 'package:google/utils/constants.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    final TextEditingController usuarioController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 62, 153),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Image(image: AssetImage('assets/images/iseneca.png')),
                const SizedBox(
                  height: 30,
                ),
                
                TextField(
                  controller: usuarioController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Usuario',
                    labelStyle: TextStyle(color: Colors.white),
                  )
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: passwordController,
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: const TextStyle(color: Colors.white),
                    suffixIcon: IconButton(
                      onPressed:() {
                        
                      }, 
                      icon: const Icon(Icons.visibility),
                      color: Colors.white,
                    )
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const GoogleSignIn(),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onPressed: () {
                    if(provider.login(usuarioController.text, passwordController.text)){
                          context.pushNamed('home');
                        }
                  }, 
                  text: "Iniciar Sesion"
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text("No recuerdo mi contraseña", style: TextStyle(color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),),
                const SizedBox(
                  height: 250,
                ),
                Transform.scale(
                  scale: 1.5,
                  child: const Image(image: AssetImage('assets/images/juntaDeAndalucia.png'))
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildRowDivider({required Size size}) {
    return SizedBox(
      width: size.width * 0.8,
      child: const Row(children: <Widget>[
        Expanded(child: Divider(color: Constants.kDarkGreyColor)),
        Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              "Or",
              style: TextStyle(color: Constants.kDarkGreyColor),
            )),
        Expanded(child: Divider(color: Constants.kDarkGreyColor)),
      ]),
    );
  }
}

class GoogleSignIn extends StatefulWidget {
  const GoogleSignIn({super.key});

  @override
  _GoogleSignInState createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  !isLoading? SizedBox(
      width: size.width * 0.8,
      child: OutlinedButton.icon(
        icon: const FaIcon(FontAwesomeIcons.google),
        onPressed: () async {
          setState(() {
            isLoading = true;
            
          });
          FirebaseService service = FirebaseService();
          try {
           await service.signInwithGoogle();
           Navigator.pushNamedAndRemoveUntil(context, Constants.homeNavigate, (route) => false);
          } catch(e){
            if(e is FirebaseAuthException){
              showMessage(e.message!);
            }
          }
          setState(() {
            isLoading = false;
          });
        },
        label: const Text(
          Constants.textSignInGoogle,
          style: TextStyle(
              color: Constants.kBlackColor, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Constants.kGreyColor),
            side: MaterialStateProperty.all<BorderSide>(BorderSide.none)),
      ),
    ) : const CircularProgressIndicator();
  }

  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}