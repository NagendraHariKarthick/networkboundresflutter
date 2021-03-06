import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';

import 'resource.dart';

class NetworkBoundResource<ResultType, RequestType> {
  Stream<Resource<ResultType>> asStream({
    @required Future<ResultType> loadFromDb,
    @required Future<RequestType> createCall,
    @required ResultType processResponse(RequestType result),
    @required Future saveCallResult(RequestType item),
  }) async* {
    print("Call loading...");
    yield Resource.loading();
    final localData = await _fetchLocalData(loadFromDb);
    yield Resource.loading(data: localData);
    print("Fetch data and call loading");
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        var result = await _fetchFromNetwork(createCall);
        print("success");
        await saveCallResult(result);
        yield Resource.success(data: processResponse(result));
      } on Exception catch (e) {
        print("Fetching failed " + e.toString());
        yield Resource.failed(data: null, error: e);
      }
    }
  }

  Future<RequestType> _fetchFromNetwork(Future<RequestType> createCall) async {
    return await createCall.then((value) async {
      return value;
    });
  }

  Future<ResultType> _fetchLocalData(Future<ResultType> loadFromDb) async {
    return await loadFromDb.then((value) async {
      return value;
    });
  }
}
