import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homepage',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Homepage"),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.home)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.settings))
            ],
          ),
        body: Container(
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
        )
        )
    );
  }
}