import 'package:flutter/material.dart';

import 'data.dart';

QuestionList _questionList = QuestionList();

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

List<Widget> stars = [];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd8cdfc),
      body: _body(),
    );
  }

  _body() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_scoreContainer(), _question(), _buttonGroup()],
        ),
      ),
    );
  }

  Widget _scoreContainer() {
    return Container(
      height: 120,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xff6158E0),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: CircularProgressIndicator(
              value: 0.2,
              strokeWidth: 8,
              color: Colors.deepOrangeAccent,
              backgroundColor: Colors.white.withOpacity(.2),
            ),
          ),
          const SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Score',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(children: stars
                  // <Widget>[
                  //   stars
                  // Icon(Icons.star,
                  //     size: 38, color: Colors.white.withOpacity(.2)),
                  // Icon(Icons.star,
                  //     size: 38, color: Colors.white.withOpacity(.2)),
                  // Icon(Icons.star,
                  //     size: 38, color: Colors.white.withOpacity(.2)),
                  // Icon(Icons.star,
                  //     size: 38, color: Colors.white.withOpacity(.2)),
                  // Icon(Icons.star,
                  //     size: 38, color: Colors.white.withOpacity(.2)),
                  // ],
                  )
            ],
          ),
        ],
      ),
    );
  }

  Widget _question() {
    return Card(
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: Text(
          textAlign: TextAlign.center,
          _questionList.getQuestion(),
          style: const TextStyle(
            fontSize: 28,
            color: Color(0xff343434),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buttonGroup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _button('True', Icons.thumb_up_alt),
        const SizedBox(height: 12),
        _button('False', Icons.thumb_down)
      ],
    );
  }

  Widget _button(String title, IconData icon) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (title.toLowerCase() == _questionList.getAnswer().toString()) {
            stars.add(
              const Icon(Icons.star, size: 38, color: Colors.yellowAccent),
            );
          } else {
            stars.add(
              Icon(Icons.star, size: 38, color: Colors.black.withOpacity(.2)),
            );
          }

          _questionList.nextQuestion();
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff6158E0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Icon(icon, color: Colors.white.withOpacity(.6)),
          ],
        ),
      ),
    );
  }
}
