import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clon de Pinterest',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const PinterestClone(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PinterestClone extends StatefulWidget {
  const PinterestClone({super.key});

  @override
  State<PinterestClone> createState() => _PinterestCloneState();
}

class _PinterestCloneState extends State<PinterestClone> {
  bool isDarkMode = false;
  List<String> savedItems = [];

  void _toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  void _toggleSave(String title) {
    setState(() {
      if (savedItems.contains(title)) {
        savedItems.remove(title);
      } else {
        savedItems.add(title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clon de Pinterest'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.brightness_7 : Icons.brightness_2),
            onPressed: _toggleTheme,
          ),
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Guardados'),
                    content: SizedBox(
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: savedItems.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(savedItems[index]),
                          );
                        },
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cerrar'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          String title = 'Título de la Imagen $index';
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.network(
                    'data:image/jpeg;base64,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',
                    fit: BoxFit.cover,
                    color: isDarkMode ? Colors.black.withOpacity(0.5) : null,
                    colorBlendMode: isDarkMode ? BlendMode.darken : BlendMode.srcOver,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(
                          savedItems.contains(title) ? Icons.favorite : Icons.favorite_border,
                          color: savedItems.contains(title) ? Colors.red : null,
                        ),
                        onPressed: () => _toggleSave(title),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
