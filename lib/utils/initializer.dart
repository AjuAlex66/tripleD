import 'package:tripled/model/profilelistmodel.dart';
import 'package:tripled/model/profilemodel.dart';

class Initializer {
  static String? tripleDropValue = 'View', tripleCountry = 'IN';
  static List<String> tripleDropList = ['View', 'Edit', 'Send', 'Delete'];
  static ProfileListModel profileListModel = ProfileListModel();
  static List<Map<String, dynamic>> tripleCountryList = [
    {"country": "IN", "states": "KA, KL, TN and MH", "selected": true},
    {"country": "US", "states": "AL, DE and GA", "selected": false},
    {"country": "CA", "states": "ON, QC and BC", "selected": false},
  ];
  static ProfileModel profileModel = ProfileModel();
  
}
