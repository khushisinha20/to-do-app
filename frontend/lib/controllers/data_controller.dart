import 'package:frontend/services/service.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get MyData => _myData;
  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData();
    if (response.statusCode == 200) {
      _myData = response.body;
      print("we got the data");
      update();
    } else {
      print("we did not get anydata");
    }
  }

  Future<void> postData(
    String task,
    String taskdetail,
  ) async {
    _isLoading = true;
    Response response =
        await service.postData({"task_name": task, "task_detail": taskdetail});
    if (response.statusCode == 200) {
      update();
      print("data post successful");
    } else {
      print("data post failed");
    }
  }
}
