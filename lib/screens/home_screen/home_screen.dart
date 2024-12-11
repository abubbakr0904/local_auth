import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_authbek/bloc/main_bloc/main_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LocalAuthentication auth = LocalAuthentication();

  getData() async {
    BlocProvider.of<MainBloc>(context).add(FingerPrintEvent(auth: auth));
  }

  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocListener<MainBloc, MainState>(
          listener: (context, state) {
            if(state is FingerPrintSuccessState){
              isCheck = true;
              setState(() {

              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Spacer(),
                isCheck ? const Icon(
                  Icons.done_outline_outlined,
                  color: Colors.purple,
                  size: 100,
                ) : const SizedBox(),
                const SizedBox(height: 200,),
                GestureDetector(
                  onTap: () async {
                    getData();
                  },
                  child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.purpleAccent,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.fingerprint,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            "   Local Auth",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          )
                        ],
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),);
  }
}
