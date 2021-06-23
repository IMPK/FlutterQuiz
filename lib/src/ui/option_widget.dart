import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:quiz/src/models/question_model.dart';

typedef didTapOnOptions = Function(bool isOptionCorrect, int index);

class OptionsWidget extends StatefulWidget {
  final Size containerSize;
  final didTapOnOptions tapOption;
  final Question question;
  final double fontSize;
  List<GlobalKey<FlipCardState>> cardKeyList =  [];

  OptionsWidget(
      {Key key,
      this.containerSize,
      this.tapOption,
      this.question,
      this.fontSize})
      : super(key: key);

  @override
  _OptionsWidgetState createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  bool _isCorrectAnswer;
  List<Options> optionString = [];
  List<String> optionsTitle = ['A', 'B', 'C', 'D'];
  List<Color> optionsTitleBackgroundColors = [
    Colors.orangeAccent,
    Colors.lightBlueAccent,
    Colors.lightGreenAccent,
    Colors.pinkAccent
  ];



  @override
  void initState() {
    super.initState();
    for(int i = 0; i < 4;i++) {
      widget.cardKeyList.add(new GlobalKey<FlipCardState>());
    }
    
    optionString = widget.question.data.options;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GridView.builder(
        padding: EdgeInsets.only(left: 40, right: 40, top: 20),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: optionString.length,
        itemBuilder: (context, index) {
          return contentWidget(index, optionString[index]);
        },
      ),
    );
  }

  Widget contentWidget(int itemIndex, Options optionValue) {
    return FlipCard(
      key: widget.cardKeyList.elementAt(itemIndex),
      flipOnTouch: false,
      direction: FlipDirection.HORIZONTAL,
      // default
      front: buildCard(child: buildFront(itemIndex, optionValue)),
      back: buildCard(child: buildBack(optionValue)),
    );
  }

  Widget buildCard({Widget child}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: 20,
        height: 20,
        alignment: Alignment.center,
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(15.0),
        ),
        child: child,
      ),
    );
  }

  Widget buildFront(int itemIndex, Options option) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            circularText(
              optionsTitleBackgroundColors.elementAt(itemIndex),
              optionsTitle.elementAt(itemIndex),
            ),
            Text(
              option.label
                  .replaceAll('<p>', '')
                  .replaceAll('</p>', '')
                  .replaceAll('&nbsp;', ''),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )),
      ),
      onTap: () {
        widget.cardKeyList.elementAt(itemIndex).currentState.toggleCard();
        Future.delayed(Duration(seconds: 1), () {
          // 5 seconds over, navigate to Page2.
          widget.tapOption(option.isCorrect == 1, itemIndex);
        });
      },
    );
  }

  Widget buildBack(Options option) {
    if (option.isCorrect == 1) {
      return Center(
        child: Icon(
          Icons.assignment_turned_in_outlined,
          color: Colors.green,
          size: 50,
        ),
      );
    } else {
      return Center(
        child: Icon(
          Icons.close,
          color: Colors.red,
          size: 50,
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget circularText(Color backgroundColor, String alphabet) {
    return Container(
        width: 38,
        height: 38,
        decoration: new BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Center(
            child: Text(
          alphabet,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        )));
  }
}
