import 'dart:convert';
import 'package:my_visitor/features/hotels/domain/entities/hotel_entity.dart';
import 'brand.dart';
import 'property.dart';
import 'search_information.dart';
import 'search_metadata.dart';
import 'search_parameters.dart';
import 'serpapi_pagination.dart';

class HotelModel extends HotelEntity {
  final SearchMetadata? searchMetadata; // Nullable as it might not always be present
  final SearchParameters? searchParameters; // Nullable
  final SearchInformation? searchInformation; // Nullable
  final List<Brand> brands; // Non-nullable with empty list default
  final List<Property> properties; // Non-nullable with empty list default
  final SerpapiPagination? serpapiPagination; // Nullable

  HotelModel({
    this.searchMetadata,
    this.searchParameters,
    this.searchInformation,
    List<Brand>? brands,
    List<Property>? properties,
    this.serpapiPagination,
  })  : brands = brands ?? [],
        properties = properties ?? [],
        super(hotels: null); // Call super with null since hotels is handled in HotelEntity

  factory HotelModel.fromMap(Map<String, dynamic> data) => HotelModel(
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
                .toList() ??
            [],
        properties: (data['properties'] as List<dynamic>?)
                ?.map((e) => Property.fromMap(e as Map<String, dynamic>))
                .toList() ??
            [],
        serpapiPagination: data['serpapi_pagination'] == null
            ? null
            : SerpapiPagination.fromMap(
                data['serpapi_pagination'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'search_metadata': searchMetadata?.toMap(),
        'search_parameters': searchParameters?.toMap(),
        'search_information': searchInformation?.toMap(),
        'brands': brands.map((e) => e.toMap()).toList(),
        'properties': properties.map((e) => e.toMap()).toList(),
        'serpapi_pagination': serpapiPagination?.toMap(),
      };

  factory HotelModel.fromJson(String data) {
    return HotelModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}