import 'package:waffle/providers/fines.dart';

class FineList {
  List<Fines>? fineList;

  FineList({required this.fineList});

  factory FineList.fromJson(List<dynamic> json) {
    List<Fines> fineList = <Fines>[];
    fineList = json.map((v) => Fines.fromJson(v)).toList();
    return FineList(fineList: fineList);
  }
}
