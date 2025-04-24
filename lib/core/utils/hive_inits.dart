import 'package:hive_flutter/adapters.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/landmarks/data/models/landmark_model.dart';
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

Future<void> landmarksInit() async {
  
 Hive.registerAdapter(LandmarkResponseAdapter()); // typeId: 35
  Hive.registerAdapter(SearchMetadataLandAdapter()); // typeId: 36
  Hive.registerAdapter(SearchParametersLandAdapter()); // typeId: 37
  Hive.registerAdapter(SearchInformationLandAdapter()); // typeId: 38
  Hive.registerAdapter(LandmarkModelAdapter()); // typeId: 39
  Hive.registerAdapter(DestinationAdapter()); // typeId: 40
  Hive.registerAdapter(ShoppingResultAdapter()); // typeId: 41
  Hive.registerAdapter(KnowledgeGraphAdapter()); // typeId: 42
  Hive.registerAdapter(ShortVideoAdapter()); // typeId: 43
  Hive.registerAdapter(RelatedQuestionAdapter()); // typeId: 44
  Hive.registerAdapter(OrganicResultAdapter()); // typeId: 45
  Hive.registerAdapter(SitelinksAdapter()); // typeId: 46
  Hive.registerAdapter(InlineSitelinkAdapter()); // typeId: 47
  Hive.registerAdapter(RichSnippetAdapter()); // typeId: 48
  Hive.registerAdapter(BottomRichSnippetAdapter()); // typeId: 49
  Hive.registerAdapter(DetectedExtensionsAdapter()); // typeId: 50
  Hive.registerAdapter(RelatedSearchAdapter()); // typeId: 51
  Hive.registerAdapter(SearchItemAdapter()); // typeId: 52
  Hive.registerAdapter(DiscussionAndForumAdapter()); // typeId: 53
  Hive.registerAdapter(AnswerAdapter()); // typeId: 54
  Hive.registerAdapter(PaginationAdapter()); // typeId: 55
  Hive.registerAdapter(SerpapiPaginationLandAdapter()); // typeId: 56
  await Hive.openBox<LandmarkResponse>(kLandmarks);
}
