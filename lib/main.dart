import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Food Recipe",
            style: TextStyle(
              color: Colors.black,
            ),
            textAlign: TextAlign.start,
          ),
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.view_headline,
                color: Colors.black,
              ),
            );
          }),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
          ],
        ),
        // https://www.youtube.com/watch?v=m0nEbAEnt9g
        drawer: Drawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: "상품을 검색해주세요.",
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search, color: Colors.grey),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              Divider(),
              Expanded(
                child: listViewBuilder(dataList),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> dataList = [
  {
    "category": "수제버거",
    "imgUrl":
        "https://cdn.pixabay.com/photo/2014/10/19/20/59/hamburger-494706_960_720.jpg",
  },
  {
    "category": "샐러드",
    "imgUrl":
        "https://cdn.pixabay.com/photo/2017/09/16/19/21/salad-2756467_960_720.jpg",
  },
  {
    "category": "한식",
    "imgUrl":
        "https://cdn.pixabay.com/photo/2018/12/10/00/27/tang-fish-cakes-3866061_960_720.jpg",
  },
  {
    "category": "디저트",
    "imgUrl":
        "https://cdn.pixabay.com/photo/2018/05/01/18/21/eclair-3366430_960_720.jpg",
  },
  {
    "category": "피자",
    "imgUrl":
        "https://cdn.pixabay.com/photo/2014/04/22/02/56/pizza-329523_960_720.jpg",
  },
  {
    "category": "볶음밥",
    "imgUrl":
        "https://cdn.pixabay.com/photo/2016/10/23/09/37/fried-rice-1762493_960_720.jpg",
  },
];

Widget listViewBuilder(List<Map<String, dynamic>> dataList) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: dataList.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(dataList[index]["imgUrl"]),
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.dstATop,
                  ),
                  fit: BoxFit.cover,
                ),
                color: Colors.black),
            child: Center(
              child: Text(
                dataList[index]["category"],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        );
      });
}
