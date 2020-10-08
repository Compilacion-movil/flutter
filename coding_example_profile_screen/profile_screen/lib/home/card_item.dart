import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  final String _imageName;
  final Function _onTap;

  CardItem({@required String imageName, @required Function onTap})
      : _imageName = imageName,
        _onTap = onTap;

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _growAnimation;

  double _initialHeight = 155;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100))
          ..addListener(() {
            setState(() {});
          });

    _growAnimation =
        Tween<double>(begin: _initialHeight, end: _initialHeight * 1.1)
            .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget._onTap();
        _playAnimation();
        print("${widget._imageName}");
      },
      child: _buildCard(widget._imageName),
    );
  }

  Widget _buildCard(String imageName) {
    return SizedBox(
      width: 185,
      child: UnconstrainedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.00),
          child: Image(
            width: _growAnimation.value,
            height: _growAnimation.value,
            fit: BoxFit.cover,
            image: AssetImage("images/$imageName"),
          ),
        ),
      ),
    );
  }

  Future<void> _playAnimation() async {
    try {
      await _animationController.forward().orCancel;
      await _animationController.reverse().orCancel;
    } on TickerCanceled {
      print("Ticker canceled");
    }
  }
}
