// To parse this JSON data, do
//
//     final driverRoute = driverRouteFromMap(jsonString);

import 'dart:convert';

import 'package:mobile_app_flutter/drivers/models/route.dart';

class DriverRoutesResponse {
  DriverRoutesResponse({
    required this.route,
    required this.pageable,
    required this.totalPages,
    required this.totalElements,
    required this.last,
    required this.first,
    required this.sort,
    required this.numberOfElements,
    required this.size,
    required this.number,
    required this.empty,
  });

  List<DriverRoute> route;
  Pageable pageable;
  int totalPages;
  int totalElements;
  bool last;
  bool first;
  Sort sort;
  int numberOfElements;
  int size;
  int number;
  bool empty;

  factory DriverRoutesResponse.fromJson(String str) =>
      DriverRoutesResponse.fromMap(json.decode(str));

  factory DriverRoutesResponse.fromMap(Map<String, dynamic> json) =>
      DriverRoutesResponse(
        route: List<DriverRoute>.from(
            json["content"].map((x) => DriverRoute.fromMap(x))),
        pageable: Pageable.fromMap(json["pageable"]),
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        last: json["last"],
        first: json["first"],
        sort: Sort.fromMap(json["sort"]),
        numberOfElements: json["numberOfElements"],
        size: json["size"],
        number: json["number"],
        empty: json["empty"],
      );
}

class Pageable {
  Pageable({
    required this.sort,
    required this.pageNumber,
    required this.pageSize,
    required this.offset,
    required this.unpaged,
    required this.paged,
  });

  Sort sort;
  int pageNumber;
  int pageSize;
  int offset;
  bool unpaged;
  bool paged;

  factory Pageable.fromJson(String str) => Pageable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pageable.fromMap(Map<String, dynamic> json) => Pageable(
        sort: Sort.fromMap(json["sort"]),
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        offset: json["offset"],
        unpaged: json["unpaged"],
        paged: json["paged"],
      );

  Map<String, dynamic> toMap() => {
        "sort": sort.toMap(),
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "offset": offset,
        "unpaged": unpaged,
        "paged": paged,
      };
}

class Sort {
  Sort({
    required this.sorted,
    required this.unsorted,
    required this.empty,
  });

  bool sorted;
  bool unsorted;
  bool empty;

  factory Sort.fromJson(String str) => Sort.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sort.fromMap(Map<String, dynamic> json) => Sort(
        sorted: json["sorted"],
        unsorted: json["unsorted"],
        empty: json["empty"],
      );

  Map<String, dynamic> toMap() => {
        "sorted": sorted,
        "unsorted": unsorted,
        "empty": empty,
      };
}
