# :pushpin: WeatherWear
>날씨 기반 패션 공유 서비스  

</br>

## 1. 제작 기간 & 참여 인원
- 2023년 6월 1일 ~ 6월 16일
- 팀 프로젝트(5명)

</br>

## 2. 사용 기술
#### `Back-end`
  - Spring Boot
  - JQuery
  - MySQL
#### `Front-end`
  - Java
  - JavaScript
#### `Data-Analysis`
  - YOLO
  - Scikit-learn
#### `Cloud`
  - AWS
  - Google Colab

</br>

## 3. 핵심 기능
이 서비스의 핵심 기능은 사용자가 선택한 날짜와 지역 정보에 적합한 패션 정보를 공유하는 기능입니다. 
이를 위해서 온도와 풍속 등 날씨에 영향을 끼치는 주요 속성들을 활용하여 날씨를 군집화하여 사용자가 사진을 업로드할 때 입력받은 날짜와 지역 정보의 조합과 유사한 군집을 매핑하여 저장합니다
또한 사진 업로드시 YOLO 모델을 사용하여 분류한 카테고리 정보도 함께 저장합니다.
이 후 다른 사용자가 날짜, 지역, 카테고리를 선택하게되면 해당 내용에 해당되는 사진들이 보여지게 됩니다.

</br>

## 4. 핵심 트러블 슈팅
### 4.1. 날씨 군집화 문제
- 날씨 군집화를 위해서 가장 먼저 해야했던 일은 날씨에 영향을 미치는 속성들을 고르는 일이었습니다.
    
</br>

## 6. 회고 / 느낀점
>
