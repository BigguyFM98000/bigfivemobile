import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.purple,
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          )),
      home: HomePage(),
    );
  }
}

class Animal {
  const Animal(
      {required this.name,
      required this.description,
      required this.age,
      required this.imageUrl});

  final String name;
  final String description;
  final int age;
  final String imageUrl;
}

final String server =
    defaultTargetPlatform == TargetPlatform.android ? '10.0.2.2' : 'localhost';

final List<Animal> _kittens = <Animal>[
  const Animal(
      name: "Elephant",
      description: "Large animal with long trunk",
      age: 70,
      imageUrl:
          "https://images.unsplash.com/photo-1628767765522-8dfe2765fbaa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c291dGglMjBhZnJpY2FuJTIwYmlnJTIwZml2ZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=600"),
  const Animal(
      name: "Rhinoceros",
      description: "Strong animal with sharp long horn",
      age: 45,
      imageUrl:
          'https://media.istockphoto.com/id/104486329/photo/white-rhinoceros-with-2-weeks-calf.jpg?b=1&s=170667a&w=0&k=20&c=iPlPxgLiog1sTokZj6ZacQ_9WaVqIoaPdIAF0jG-ytM='),
  const Animal(
      name: "Buffalo",
      description: "Big animal with curved horns",
      age: 20,
      imageUrl:
          'https://images.unsplash.com/photo-1629104851926-873153be018c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c291dGglMjBhZnJpY2FuJTIwYmlnJTIwZml2ZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
  const Animal(
      name: "Leopard",
      description: "Dotted wildlife animal",
      age: 23,
      imageUrl:
          'https://media.istockphoto.com/id/95857242/photo/lepard-in-high-grass.jpg?b=1&s=170667a&w=0&k=20&c=TS4wyx1c27999URR25Jh-Nlxub_k03NZvln5zmpVEuc='),
  const Animal(
      name: "Lion",
      description: "Fierce animal with lots of hair on neck",
      age: 19,
      imageUrl:
          'https://images.unsplash.com/photo-1610624393235-c1b89453b7d4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c291dGglMjBhZnJpY2FuJTIwYmlnJTIwZml2ZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60')
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _dialogBuilder(BuildContext context, Animal kitten) {
    ThemeData localTheme = Theme.of(context);

    return SimpleDialog(
      children: [
        Image.network(
          kitten.imageUrl,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                kitten.name,
                style: localTheme.textTheme.headlineSmall,
              ),
              Text('${kitten.age} years old',
                  style: localTheme.textTheme.headlineSmall),
              SizedBox(
                height: 16.0,
              ),
              Text(
                kitten.description,
                style: localTheme.textTheme.bodyMedium,
              ),
              SizedBox(
                height: 16.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Cancel",
                        selectionColor: Colors.red,
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: const Text(
                        "Adopt",
                        selectionColor: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _ListItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => _dialogBuilder(context, _kittens[index])),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          _kittens[index].name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("South African BigFive Animals")),
      ),
      body: ListView.builder(
        itemCount: _kittens.length,
        itemExtent: 60.0,
        itemBuilder: _ListItemBuilder,
      ),
    );
  }
}
