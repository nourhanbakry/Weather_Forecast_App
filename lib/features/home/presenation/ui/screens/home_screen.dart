import 'package:cellula_project/core/networking/firbase_services.dart';
import 'package:cellula_project/features/home/presenation/logic/weather_cubit.dart';
import 'package:cellula_project/features/home/presenation/ui/widgets/custom_app_bar_title.dart';
import 'package:cellula_project/features/home/presenation/ui/widgets/custom_tab_bar_bottom.dart';
import 'package:cellula_project/features/home/presenation/ui/widgets/home_screen_body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth firebaseAuth = FirbaseServices.authInstance;

  final FirebaseFirestore firestore = FirbaseServices.firestore;

  String? name;

  Future getUserName() async {
    String uid = firebaseAuth.currentUser!.uid;
    DocumentSnapshot userDoc =
        await firestore.collection('users').doc(uid).get();
    String? userName = userDoc['name'];
    setState(() {
      name = userName;
    });
  }

  @override
  void initState() {
    getUserName();
    context.read<WeatherCubit>().fetchWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: CustomAppBarTitle(name: name),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(150),
            child: CustomTabBarBottom(),
          ),
        ),
        body: HomeScreenBody(),
      ),
    );
  }
}
