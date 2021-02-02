import 'package:flutter/material.dart';

class Tank extends StatelessWidget {
  static String route = "tank";

  final Future<int> index;

  const Tank({Key key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Hero(
            tag: "DemoTag$index",
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("https://picsum.photos/250?image=9"),
                ),
              ),
            )),
        Title(
          color: Colors.black,
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Tank Demo Animation $index",
                  style: Theme.of(context).textTheme.headline5)),
        ),
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ut risus a libero accumsan dignissim sit amet a purus. Integer purus lorem, fringilla in sem nec, commodo porta orci. Morbi id imperdiet arcu, vel sollicitudin felis. Morbi sagittis ex justo, in pulvinar neque cursus sed. Morbi commodo mattis quam, sed facilisis augue egestas eget. Curabitur ornare in turpis ac posuere. Cras semper lorem leo, quis lacinia diam feugiat vel. Nullam consequat tellus at diam blandit consequat. Vestibulum eu purus et diam viverra consequat. Cras cursus, quam eget tincidunt tempus, orci purus congue tortor, euismod lacinia nibh urna a mauris. Fusce lacus justo, consequat eu tellus sed, posuere porttitor tortor. Nam cursus leo at enim accumsan hendrerit.",
                style: Theme.of(context).textTheme.bodyText1)),
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ut risus a libero accumsan dignissim sit amet a purus. Integer purus lorem, fringilla in sem nec, commodo porta orci. Morbi id imperdiet arcu, vel sollicitudin felis. Morbi sagittis ex justo, in pulvinar neque cursus sed. Morbi commodo mattis quam, sed facilisis augue egestas eget. Curabitur ornare in turpis ac posuere. Cras semper lorem leo, quis lacinia diam feugiat vel. Nullam consequat tellus at diam blandit consequat. Vestibulum eu purus et diam viverra consequat. Cras cursus, quam eget tincidunt tempus, orci purus congue tortor, euismod lacinia nibh urna a mauris. Fusce lacus justo, consequat eu tellus sed, posuere porttitor tortor. Nam cursus leo at enim accumsan hendrerit.",
                style: Theme.of(context).textTheme.bodyText1)),
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ut risus a libero accumsan dignissim sit amet a purus. Integer purus lorem, fringilla in sem nec, commodo porta orci. Morbi id imperdiet arcu, vel sollicitudin felis. Morbi sagittis ex justo, in pulvinar neque cursus sed. Morbi commodo mattis quam, sed facilisis augue egestas eget. Curabitur ornare in turpis ac posuere. Cras semper lorem leo, quis lacinia diam feugiat vel. Nullam consequat tellus at diam blandit consequat. Vestibulum eu purus et diam viverra consequat. Cras cursus, quam eget tincidunt tempus, orci purus congue tortor, euismod lacinia nibh urna a mauris. Fusce lacus justo, consequat eu tellus sed, posuere porttitor tortor. Nam cursus leo at enim accumsan hendrerit.",
                style: Theme.of(context).textTheme.bodyText1)),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.popUntil(
                context,
                (route) => route.isFirst,
              );
            },
            child: const Text(
              "Back to Login",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    ))));
  }
}
