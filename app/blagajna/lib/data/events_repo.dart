import 'package:blagajna/data/login_repo.dart';
import 'package:blagajna/data/models/event_model.dart';
import 'package:blagajna/data/url_constants.dart';
import 'package:dio/dio.dart';

class EventsRepo {

  Future<List<EventModel>> getEvents() async {
    try {
      var dio = Dio();

      var response = await Dio().get(UrlConstants.baseUrl + UrlConstants.eventsUrl,
          options: Options(
            contentType: "application/json",
            headers: {
              'WorkerUsername': LoginRepo.username
            }
          ));
      var responseBody = response.data;
      return [];
    } catch (e) {
      rethrow;
    }
  }
}