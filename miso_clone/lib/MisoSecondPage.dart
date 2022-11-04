import 'package:flutter/material.dart';
import 'main.dart';

class MisoSecondPage extends StatelessWidget {
  const MisoSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Tip : 기기 높이의 %로 줘야 각 기기별로 적절한 위치에 배치할 수 있어요.
                    SizedBox(height: MediaQuery.of(context).size.height * 0.15),

                    /// 예약내역
                    Text(
                      "예약내역",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                      ),
                    ),
                    SizedBox(height: 64),

                    Row(
                      children: [
                        /// ! 아이콘
                        Icon(Icons.error, color: misoPrimaryColor),
                        SizedBox(width: 8),

                        /// 예약된 서비스가 아직 없어요. 지금 예약해보세요!
                        /// Tip : 폰의 폭과 관계없이 텍스트를 언제나 한 줄로 보여주기
                        Expanded(
                          // row의 남은 영역을 모두 차지하도록
                          child: FittedBox(
                            // 해당 영역에 적절한 사이즈로 맞추기
                            fit: BoxFit.scaleDown, // child 최소 크기를 존중
                            child: Text(
                              "예약된 서비스가 아직 없어요. 지금 예약해보세요!",
                              style: TextStyle(
                                fontSize: 100, // 아무리 커도 한 줄로 보여요!
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.grey),
                  ],
                ),
              ),

              /// 예약하기
              Positioned(
                bottom: 18,
                left: 24,
                right: 24,
                child: GestureDetector(
                  onTap: () {
                    print("예약하기 클릭 됨");
                  },
                  child: Container(
                    width: double.infinity,
                    height: 58,
                    color: misoPrimaryColor,
                    alignment: Alignment.center,
                    child: Text(
                      "예약하기",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
