import 'base_network.dart';

class ApiDataSource{
  static ApiDataSource instance = ApiDataSource();
  
  Future<List<dynamic>> loadMatch() {
    return BaseNetwork.getList("matches");
  }

  Future<Map<String, dynamic>> loadDetail(int idAcc){
    String id = idAcc.toString();
    return BaseNetwork.get("matches/$id");
  }
}