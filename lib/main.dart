import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final tabs=[
    screen1(),
    screen2(),
    screen3(),
    screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("1.mp3"));
    return MaterialApp(
      title: '我的自傳',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                       useMaterial3: true,),
      home: Scaffold(
        appBar: AppBar(title: Text('我的自傳'),),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18,
          unselectedFontSize: 14,
          iconSize: 30,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: currentIndex==0? Image.asset('images/f1.jpg',width:40,height:40): Image.asset('images/f1.jpg',width:20,height:20), label:'自我介紹',),
            BottomNavigationBarItem(icon: Icon(Icons.school), label:'學習歷程',),
            BottomNavigationBarItem(icon: Icon(Icons.schedule_outlined), label:'學習計畫',),
            BottomNavigationBarItem(icon: Icon(Icons.engineering), label:'專業方向',),
          ],
          onTap: (index) {
            setState(() {
              previousIndex=currentIndex;
              currentIndex=index;
              if (index==0) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('1.mp3'));
              }
              if (index==1) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('2.mp3'));
              }
              if (index==2) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('3.mp3'));
              }
              if (index==3) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('4.mp3'));
              }
            });
          },
        ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {

  final String s1='        我是一名資訊工程系的大學生，一個擁有良好家庭環境的獨生子，我的父母會隨時關心我的情況，並與我討論相關事宜，所以我才能夠一直追求自己的興趣與夢想。'
                  '從國小到國中，透過不斷努力的學習，我的成績始終保持在班級中的最前端，也在這段時間慢慢愛上了數學。'
                  '國中畢業後，我成功考上了地方的第一學府，那是個強者雲集的地方，我也明顯感受到自己實力的不足，所以我更應該奮發向上，努力學習。'
                  '而我之所以會就讀資訊工程系，一切源於我在高中時期參加的資訊研究社，在那裡，我第一次接觸到寫程式的魅力，透過一行一行的代碼，實現心中所想的功能，所帶來的成就感令我著迷。';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('Who am I', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          //自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 10,),
          //放一張照片
          Container(
            color: Colors.redAccent,
            child:Image.asset('images/f1.jpg'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/f1.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/f1.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {
  @override

  final String s21 = '    在一、二年級的課程中，我深入研究了計算機基礎知識，包括程式設計、資料結構和演算法等。隨著學習的深入，我逐漸掌握了不同的編程語言，並參與了一些實際的程式製作項目，提升了我的實踐能力。\n'
                     '    而到了三年級，我選擇了一些專業化的方向，如網路爬蟲、資料庫管理等。這些課程不僅加深了我的專業知識，還讓我更好地理解了整個資訊系統的運作原理。\n'
                     '    在這段學習歷程中，我不斷挑戰自己，追求創新和解難的樂趣。未來，我期待在資訊工程領域中不斷深耕，為科技進步和社會發展做出更多貢獻。';

  Widget build(BuildContext context) {
    return Center(
      child: Container(child: Text(s21, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大一時期'),
          ],
        ),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:150,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 學習英文'),
                  Text('2. 基礎程式能力'),
                  Text('3. 人際關係'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大二時期'),
          ],
        ),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:150,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 物件導向程式'),
                  Text('2. 資料庫'),
                  Text('3. 網頁製作'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大三時期'),
          ],
        ),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:150,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 專題製作'),
                  Text('2. 人工智慧'),
                  Text('3. 資訊安全'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大四時期'),
          ],
        ),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:150,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 實習'),
                  Text('2. 考研究所'),
                ],
              ),
            ),
          ],
        ),
      ],),
    );
  }
}
class screen4 extends StatelessWidget {
  @override
  final String s4 = '    我的學習和實踐主要圍繞著設計和開發高效、穩定的軟體系統。透過深入學習程式語言、資料結構和演算法，我建立了堅實的基礎，使我能夠設計具有良好結構和可擴展性的軟體。\n'
                    '    未來，我期望將所學應用於複雜的軟體系統開發，並深入探索新興技術，如人工智慧和區塊鏈，以推動科技創新，並為社會帶來更多價值。';
  Widget build(BuildContext context) {
    return Center(
      child: Container(child: Text(s4, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}