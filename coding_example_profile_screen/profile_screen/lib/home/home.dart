import 'package:flutter/material.dart';

import 'horizontal_image_list.dart';

const followingButtonColor = const Color(0xFFDFD8C8);
const followingTextButtonColor = const Color(0xFF41444B);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("@jennyxyz"),
        leading: _buildIconMenu(),
        actions: [_buildIconMore()],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Image(
          image: AssetImage('images/img_profile.png'),
        ),
        Container(
          color: Color.fromRGBO(0, 0, 0, 0.55),
        ),
        _buildBodyData()
      ],
    );
  }

  Widget _buildBodyData() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildUSerName(),
          SizedBox(height: 20),
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              HorizontalImageList(),
              _buildPostData()
            ],
          ),
          _buildSocialRow(),
        ],
      ),
    );
  }

  Widget _buildUSerName(){
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          children: [
            Text("Jennifer",
                style: TextStyle(color: Colors.white, fontSize: 40.00)),
            Text("Ajax developer",
                style: TextStyle(color: followingButtonColor, fontSize: 20.00)),
          ],
        ),
      ),
    );
  }

  Widget _buildPostData(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.00),
          bottomRight: Radius.circular(10.00)
        )
      ),
      width: 70,
      height: 110.00,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("36",
              style: TextStyle(color: followingButtonColor, fontSize: 40.00)),
          Text("POST",
              style: TextStyle(color: followingTextButtonColor, fontSize: 15.00))
        ],
      ),
    );
  }

  Widget _buildIconMenu() {
    return GestureDetector(
      onTap: () {
        print("Menu touched");
      },
      child: Icon(Icons.menu),
    );
  }

  Widget _buildIconMore() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: () {
          print("More touched");
        },
        child: Icon(Icons.more_vert),
      ),
    );
  }

  Widget _buildSocialRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildFollowingData(),
          _buildFollowerData(),
          _followingButton(),
          _buildIconMessage(),
        ],
      ),
    );
  }

  Widget _buildFollowingData() {
    return _buildSocialMetaData("2041", "Following");
  }

  Widget _buildFollowerData() {
    return _buildSocialMetaData("2041K", "Followers");
  }

  Widget _buildSocialMetaData(String socialNumber, String socialText) {
    return Column(
      children: [
        Text(socialNumber,
            style: TextStyle(color: Colors.white, fontSize: 30.00)),
        Text(socialText,
            style: TextStyle(color: followingButtonColor, fontSize: 15.00))
      ],
    );
  }

  Widget _followingButton() {
    return RaisedButton(
      onPressed: () {},
      color: followingButtonColor,
      textColor: followingTextButtonColor,
      child: Text("Following"),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.00)),
    );
  }

  Widget _buildIconMessage() {
    return GestureDetector(
      onTap: () {
        print("Message touched");
      },
      child: Icon(
        Icons.message,
        color: Colors.white,
      ),
    );
  }
}
