import 'dart:async';

import 'package:flutter/foundation.dart';

import 'resource.dart';

class NetworkOnlyResource<ResultType, RequestType> {
  Stream<Resource<ResultType>> asStream({
    @required Future<RequestType> createCall,
    @required ResultType processResponse(RequestType result),
    Future saveCallResult(RequestType item),
  }) async* {
    print("Call loading...");

    yield Resource.loading();
    print("Fetch data and call loading");

    try {
      var result = await _fetchFromNetwork(createCall);
      print("success");
      if (saveCallResult != null) await saveCallResult(result);
      yield Resource.success(data: processResponse(result));
    } on Exception catch (e) {
      print("Fetching failed " + e.toString());
      yield Resource.failed(data: null, error: e);
    }
  }

  Future<RequestType> _fetchFromNetwork(Future<RequestType> createCall) async {
    return await createCall.then((value) async {
      return value;
    });
  }
}
