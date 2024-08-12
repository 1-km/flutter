import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:military1km/data/entity/misson/vo_mission.dart';

class MissionProviders {
  List<Mission> postList = [];
  Future<List<Mission>> getGather() async {
    Uri uri = Uri.parse(
        "https://openapi.gg.go.kr/ServicPartcptnInfo?KEY=122b3ef436584e419458421f94de4ddf&Type=json&pSize=1000");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      postList = jsonDecode(response.body).map<Mission>((row) {
        return Mission.fromMap(row);
      }).toList();
    }
    return postList;
  }
}
