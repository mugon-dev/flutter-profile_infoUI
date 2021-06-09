import 'package:flutter/material.dart';
import 'package:profile_info/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: kColor1),
        ),
      ),
      home: Profile(),
    );
  }
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Container(
        width: 200,
        height: double.infinity,
        color: kColor1,
      ),
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            buildProfileInfo(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildPostInfo("50", "Posts"),
                buildLine(),
                buildPostInfo("10", "Likes"),
                buildLine(),
                buildPostInfo("3", "Share"),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildButton(false),
                buildButton(true),
              ],
            ),
            SizedBox(height: 20),
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Image.network(
                          "https://picsum.photos/id/${index + 1}/200/200");
                    },
                  ),
                  Image.asset("assets/tab1.jpeg"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton(bool isBorder) {
    return InkWell(
      onTap: () {
        print("클릭된");
      },
      child: Container(
        width: 150,
        height: 45,
        child: Align(
          child: Text(
            isBorder ? "Message" : "Follow",
            style: TextStyle(color: isBorder ? Colors.black : Colors.white),
          ),
        ),
        decoration: BoxDecoration(
            color: isBorder ? Colors.white : kColor1,
            borderRadius: BorderRadius.circular(10),
            border: isBorder ? Border.all() : null),
      ),
    );
  }

  Widget buildLine() {
    return Opacity(
      opacity: 0.3,
      child: Container(
        color: kColor1,
        width: 2,
        height: 60,
      ),
    );
  }

  Widget buildPostInfo(String num, String title) {
    return Column(
      children: [
        Text(
          num,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        SizedBox(height: 2),
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget buildProfileInfo() {
    return Row(
      children: [
        SizedBox(width: 20),
        Container(
          width: 100,
          height: 100,
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/avatar.png"),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "GetinThere",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 5),
            Text("프로그래머/작가/강사",
                style: TextStyle(
                  fontSize: 20,
                )),
            SizedBox(height: 5),
            Text("데어프로그래",
                style: TextStyle(
                  fontSize: 15,
                )),
          ],
        )
      ],
    );
  }
}
