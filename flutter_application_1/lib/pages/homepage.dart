import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  AppBar makeAppBar(BuildContext context) {
    return AppBar(
          title: const Text("Homepage"),
          backgroundColor: Colors.white,
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.home)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.settings)),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            }, icon: const Icon(Icons.close)),
            ],
          );
  }

  Widget makeBody(BuildContext context) {
    return Container(
          color: const Color.fromARGB(255, 165, 194, 238),
          child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                const SizedBox(
                  width: 50,
                  height: 600,
                  child: Text("Calories Consumed")
                ),
                const SizedBox(
                  width: 50,
                  height: 600,
                  child: Text("Meals Eaten Today"),
                  ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2.0)
                  ),
                child: const Text("Placeholder", textAlign: TextAlign.center,),)
              ],
            ),
        );
  }

  Scaffold makeScaffold(BuildContext context) {
    return Scaffold(
        appBar: makeAppBar(context),
        body: makeBody(context),
        );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homepage',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: makeScaffold(context)
    );
  }
}