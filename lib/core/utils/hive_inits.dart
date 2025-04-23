import 'package:hive_flutter/adapters.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/resturants/data/models/resturant_model/resturant_model.dart';
import 'package:my_visitor/keys/hive_keys.dart';

Future<void> hotelsInit() async {
  Hive.registerAdapter(HotelModelAdapter());
  Hive.registerAdapter(SearchMetadataAdapter());
  Hive.registerAdapter(SearchParametersAdapter());
  Hive.registerAdapter(SearchInformationAdapter());
  Hive.registerAdapter(BrandsAdapter());
  Hive.registerAdapter(PropertiesAdapter());
  Hive.registerAdapter(SerpapiPaginationAdapter());
  Hive.registerAdapter(ReviewsBreakdownAdapter());
  Hive.registerAdapter(RatingsAdapter());
  Hive.registerAdapter(ImagesAdapter());
  Hive.registerAdapter(NearbyPlacesAdapter());
  Hive.registerAdapter(TransportationsAdapter());
  Hive.registerAdapter(TotalRateAdapter());
  Hive.registerAdapter(RatePerNightAdapter());
  Hive.registerAdapter(GpsCoordinatesAdapter());
  Hive.registerAdapter(ChildrenAdapter());
  await Hive.openBox<HotelModel>(kHotelsBox);
}

Future<void> resturantInit() async {
  Hive.registerAdapter(RestaurantResponseAdapter()); // typeId: 20
    Hive.registerAdapter(RestaurantModelAdapter());   // typeId: 21
    Hive.registerAdapter(AwardInfoAdapter());         // typeId: 22
    Hive.registerAdapter(OffersAdapter());            // typeId: 23
    Hive.registerAdapter(SlotOfferAdapter());         // typeId: 24
    Hive.registerAdapter(ThumbnailAdapter());         // typeId: 25
    Hive.registerAdapter(PhotoAdapter());             // typeId: 26
    Hive.registerAdapter(PhotoSizeDynamicAdapter());  // typeId: 27
    Hive.registerAdapter(ReviewSnippetsAdapter());    // typeId: 28
    Hive.registerAdapter(ReviewSnippetAdapter());     // typeId: 29
  await Hive.openBox<RestaurantModel>(kResturantsBox);
}
