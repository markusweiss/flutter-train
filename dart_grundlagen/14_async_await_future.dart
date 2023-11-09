import 'dart:io';

void main() async {
  DataFetcher fetcher = DataFetcher();

  String data = await fetcher.getData();

  print(data);
}

class DataFetcher {
  Future<String> _getDataFromCloud() async {
    sleep(Duration(seconds: 3));
    return Future.value("Data from Cloud");
  }

  Future<String> _parseDataFromCloud({required String cloudData}) async {
    sleep(Duration(seconds: 2));
    print("parsing finished");
    return Future.value("Data parsed");
  }

  Future<String> getData() async {
    //String _cloudDataRaw = await _getDataFromCloud();
    //String _parsedData = await _parseDataFromCloud(cloudData: _cloudDataRaw);

    String _parsedData = await _getDataFromCloud().then((_cloudDataRaw) async {
      return await _parseDataFromCloud(cloudData: _cloudDataRaw);
    });

    return _parsedData;
  }
}
