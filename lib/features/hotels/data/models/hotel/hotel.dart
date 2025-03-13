import 'dart:convert';

import 'brand.dart';
import 'property.dart';
import 'search_information.dart';
import 'search_metadata.dart';
import 'search_parameters.dart';
import 'serpapi_pagination.dart';

class Hotel {
  SearchMetadata? searchMetadata;
  SearchParameters? searchParameters;
  SearchInformation? searchInformation;
  List<Brand>? brands;
  List<Property>? properties;
  SerpapiPagination? serpapiPagination;

  Hotel({
    this.searchMetadata,
    this.searchParameters,
    this.searchInformation,
    this.brands,
    this.properties,
    this.serpapiPagination,
  });

  factory Hotel.fromMap(Map<String, dynamic> data) => Hotel(
        searchMetadata: data['search_metadata'] == null
            ? null
            : SearchMetadata.fromMap(
                data['search_metadata'] as Map<String, dynamic>),
        searchParameters: data['search_parameters'] == null
            ? null
            : SearchParameters.fromMap(
                data['search_parameters'] as Map<String, dynamic>),
        searchInformation: data['search_information'] == null
            ? null
            : SearchInformation.fromMap(
                data['search_information'] as Map<String, dynamic>),
        brands: (data['brands'] as List<dynamic>?)
            ?.map((e) => Brand.fromMap(e as Map<String, dynamic>))
            .toList(),
        properties: (data['properties'] as List<dynamic>?)
            ?.map((e) => Property.fromMap(e as Map<String, dynamic>))
            .toList(),
        serpapiPagination: data['serpapi_pagination'] == null
            ? null
            : SerpapiPagination.fromMap(
                data['serpapi_pagination'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'search_metadata': searchMetadata?.toMap(),
        'search_parameters': searchParameters?.toMap(),
        'search_information': searchInformation?.toMap(),
        'brands': brands?.map((e) => e.toMap()).toList(),
        'properties': properties?.map((e) => e.toMap()).toList(),
        'serpapi_pagination': serpapiPagination?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Hotel].
  factory Hotel.fromJson(String data) {
    return Hotel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Hotel] to a JSON string.
  String toJson() => json.encode(toMap());
}
