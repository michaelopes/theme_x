import 'package:flutter/material.dart';
import 'package:theme_x/theme_x.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  //const Color(0xFFF4D836),  Color(0xFF3f51b5), Color(0xFF684437)
  final theme = ThemeX(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF684437),
    colorEngine: ThemeXColorEngine.traditional,
    backgroundColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.get(),
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final primaryColors = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
  final greyColors = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
  final secondaryColors = [100, 200, 400, 700];

  ThemeX get theme => ThemeX.I;

  Widget _buildPrimaryItem(int colorNumber) {
    var hex = theme.toHex8((theme.primary[colorNumber]!));
    return Container(
      color: theme.primary[colorNumber],
      height: 40,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              hex.toUpperCase(),
              style: TextStyle(
                  color: theme.contrastColor(theme.grey[colorNumber]!)),
            ),
            Text(
              colorNumber.toString().toUpperCase(),
              style: TextStyle(
                  color: theme.contrastColor(theme.grey[colorNumber]!)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecondaryItem(int colorNumber) {
    var hex = theme.toHex8((theme.secondary[colorNumber]!));
    return Container(
      color: theme.secondary[colorNumber],
      height: 40,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              hex.toUpperCase(),
              style: TextStyle(
                  color: theme.contrastColor(theme.grey[colorNumber]!)),
            ),
            Text(
              colorNumber.toString().toUpperCase(),
              style: TextStyle(
                  color: theme.contrastColor(theme.grey[colorNumber]!)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGreyItem(int colorNumber) {
    var hex = theme.toHex8((theme.grey[colorNumber]!));
    return Container(
      color: theme.grey[colorNumber],
      height: 40,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              hex.toUpperCase(),
              style: TextStyle(
                  color: theme.contrastColor(theme.grey[colorNumber]!)),
            ),
            Text(
              colorNumber.toString().toUpperCase(),
              style: TextStyle(
                  color: theme.contrastColor(theme.grey[colorNumber]!)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const ThemeXDialog();
              });
        },
        label: const Text("Show ThemeX"),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...primaryColors.map((e) => _buildPrimaryItem(e)).toList(),
            ...secondaryColors.map((e) => _buildSecondaryItem(e)).toList(),
            ...greyColors.map((e) => _buildGreyItem(e)).toList(),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.ac_unit),
                  onPressed: () {},
                  label: Text(
                    "Button",
                    style: theme.bodyLarge,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.ac_unit),
                  onPressed: () {},
                  label: Text(
                    "Botão",
                    style: theme.bodyLarge,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(hintText: "Digite um texto"),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Headline 1",
              style: theme.h1,
            ),
            Text(
              "Headline 2",
              style: theme.h2,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Headline 3",
              style: theme.h3,
            ),
            Text(
              "Headline 4",
              style: theme.h4,
            ),
            Text(
              "Headline 5",
              style: theme.h5,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Subtitle Large",
              style: theme.subtitleLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Subtitle Medium",
              style: theme.subtitleMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Body Large",
              style: theme.bodyLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Body Medium",
              style: theme.bodyMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Buttom Large",
              style: theme.buttonLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Buttom Medium",
              style: theme.buttonMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Caption",
              style: theme.caption,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
