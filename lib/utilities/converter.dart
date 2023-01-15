class Converters {
  String type = "";
  String memberId = "";
  String nickname = "";

  untypeConverter(untype) {
    switch (untype) {
      case "지각":
        return type = "00";
      case "결석":
        return type = "01";
      case "미제출":
        return type = "10";
    }
  }

  nicknameConverter(nickname) {
    switch (nickname) {
      case "방예혁":
        return memberId = "yehyeokbang";
      case "임정연":
        return memberId = "yimjeongyeon";
      case "이찬균":
        return memberId = "lgyn10";
      case "김효중":
        return memberId = "khj0426";
      case "오혜성":
        return memberId = "hyeshungoh";
      case "김하은":
        return memberId = "hanni66";
      case "한슬희":
        return memberId = "hanseulhee";
      case "조성우":
        return memberId = "vact19";
      case "이한길":
        return memberId = "hangillee";
      case "한현수":
        return memberId = "hanhyunsoo";
      case "왕서희":
        return memberId = "wangseohee";
      case "서명진":
        return memberId = "myoungjinseo";
      case "김수빈":
        return memberId = "sub101";
      case "주동석":
        return memberId = "mojitobar";
      case "곽성은":
        return memberId = "hyeall";
      case "김재관":
        return memberId = "jaegwans";
      case "이현복":
        return memberId = "leehyunbok";
      case "박현렬":
        return memberId = "devpark435";
      case "김신아":
        return memberId = "sinamong0620";
      case "이지윤":
        return memberId = "dd-jiyun";
      case "이진우":
        return memberId = "yeezinu";
      case "전유진":
        return memberId = "yuj2n";
      case "김자경":
        return memberId = "jkkj0414";
      case "김수연":
        return memberId = "tndusy27";
      case "최재훈":
        return memberId = "zoeyourlife";
      case "김은총":
        return memberId = "rltgjqmtkdydwk";
      case "이은지":
        return memberId = "lee2eunji";
      case "이지선":
        return memberId = "kikingki";
      case "전홍영":
        return memberId = "qwe016";
      case "허지영":
        return memberId = "jiyoungmerong";
      case "박신영":
        return memberId = "ParkSY0919";
      case "박진희":
        return memberId = "parkjinhee53";
      case "김가현":
        return memberId = "negul3";
      case "이예슬":
        return memberId = "yeaseul7";
      case "백세희":
        return memberId = "baeksehee";
      case "김유진":
        return memberId = "yujinkim1";
    }
  }

  memberIdConverter(memberId) {
    switch (memberId) {
      case "yujinkim1":
        return nickname = "김유진";
      case "yehyeokbang":
        return nickname = "방예혁";
      case "yimjeongyeon":
        return nickname = "임정연";
      case "lgyn10":
        return nickname = "이찬균";
      case "khj0426":
        return nickname = "김효중";
      case "wangseohee":
        return nickname = "왕서희";
      case "myoungjinseo":
        return nickname = "서명진";
      case "sub101":
        return nickname = "김수빈";
      case "hyeall":
        return nickname = "곽성은";
      case "jaegwans":
        return nickname = "김재관";
      case "leehyunbok":
        return nickname = "이현복";
      case "devpark435":
        return nickname = "박현렬";
      case "sinamong0620":
        return nickname = "김신아";
      case "dd-jiyun":
        return nickname = "이지윤";
      case "yeezinu":
        return nickname = "이진우";
      case "yuj2n":
        return nickname = "전유진";
      case "jkkj0414":
        return nickname = "김자경";
      case "tndusy27":
        return nickname = "김수연";
      case "zoeyourlife":
        return nickname = "최재훈";
      case "rltgjqmtkdydwk":
        return nickname = "김은총";
      case "lee2eunji":
        return nickname = "이은지";
      case "kikingki":
        return nickname = "이지선";
      case "qwe016":
        return nickname = "전홍영";
      case "jiyoungmerong":
        return nickname = "허지영";
      case "ParkSY0919":
        return nickname = "박신영";
      case "parkjinhee53":
        return nickname = "박진희";
      case "negul3":
        return nickname = "김가현";
      case "yeaseul7":
        return nickname = "이예슬";
      case "baeksehee":
        return nickname = "백세희";
    }
  }
}
