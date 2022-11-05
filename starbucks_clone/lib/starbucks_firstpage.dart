import 'package:flutter/material.dart';
import 'model.dart';

class StarbucksFirstPage extends StatelessWidget {
  const StarbucksFirstPage({super.key});

  /// 배경 이미지 URL
  final String backImg =
      "https://i.ibb.co/2Pz33q7/2021-12-16-12-21-42-cleanup.png";

  /// Frequency 이미지 URL
  final String frequencyImg = "https://i.ibb.co/QcVn97y/2021-12-16-1-33-11.png";

  /// 추천 메뉴
  final List<Map<String, String>> recommendMenu = const [
    {
      "name": "돌체쿠키라떼",
      "imgUrl": "https://i.ibb.co/SwGPpzR/9200000003687-20211118142543832.jpg",
    },
    {
      "name": "아이스 홀리데이 돌체 쿠키 라떼",
      "imgUrl": "https://i.ibb.co/JHVXZ72/9200000003690-20211118142702357.jpg",
    },
    {
      "name": "스노우 민트 초콜릿",
      "imgUrl": "https://i.ibb.co/M91G17c/9200000003693-20211118142933650.jpg",
    },
    {
      "name": "아이스 스노우 민트 초콜릿",
      "imgUrl": "https://i.ibb.co/jyZK4C9/9200000003696-20211118143125337.jpg",
    },
    {
      "name": "스노우 민트 초콜릿 블렌디드",
      "imgUrl": "https://i.ibb.co/DKkV0rw/9200000003699-20211118143249044.jpg",
    },
  ];

  /// 크리스마스 이벤트 이미지 URL
  final String eventImg = "https://i.ibb.co/Fb0q43T/IMG-F9-BA5-CBCB476-1.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                snap: false,
                floating: true,
                expandedHeight: 252,
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Stack(children: [
                    Positioned.fill(
                      bottom: 60,
                      child: Image.network(
                        backImg,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      left: 24,
                      right: 24,
                      bottom: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "한 해의 마무리 , 수고 많았어요.",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "11 ★ until next Reward",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: StarbucksColor()
                                            .starbucksAccentColor,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      child: LinearProgressIndicator(
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.2),
                                        value: 0.083,
                                        minHeight: 10,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                StarbucksColor()
                                                    .starbucksAccentColor),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
