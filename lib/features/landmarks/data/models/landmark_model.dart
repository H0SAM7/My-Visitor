import 'package:hive/hive.dart';

part 'landmark_model.g.dart';

@HiveType(typeId: 35)
class LandmarkResponse extends HiveObject {
  @HiveField(0)
  final SearchMetadataLand? searchMetadata;

  @HiveField(1)
  final SearchParametersLand? searchParameters;

  @HiveField(2)
  final SearchInformationLand? searchInformation;

  @HiveField(3)
  final LandmarkModel? landmarkModel;

  @HiveField(4)
  final List<ShoppingResult>? shoppingResults;

  @HiveField(5)
  final KnowledgeGraph? knowledgeGraph;

  @HiveField(6)
  final List<ShortVideo>? shortVideos;

  @HiveField(7)
  final List<RelatedQuestion>? relatedQuestions;

  @HiveField(8)
  final List<OrganicResult>? organicResults;

  @HiveField(9)
  final String? topStoriesLink;

  @HiveField(10)
  final String? topStoriesSerpapiLink;

  @HiveField(11)
  final List<RelatedSearch>? relatedSearches;

  @HiveField(12)
  final List<DiscussionAndForum>? discussionsAndForums;

  @HiveField(13)
  final Pagination? pagination;

  @HiveField(14)
  final SerpapiPaginationLand? serpapiPagination;

  LandmarkResponse({
    this.searchMetadata,
    this.searchParameters,
    this.searchInformation,
    this.landmarkModel,
    this.shoppingResults,
    this.knowledgeGraph,
    this.shortVideos,
    this.relatedQuestions,
    this.organicResults,
    this.topStoriesLink,
    this.topStoriesSerpapiLink,
    this.relatedSearches,
    this.discussionsAndForums,
    this.pagination,
    this.serpapiPagination,
  });

  factory LandmarkResponse.fromJson(Map<String, dynamic> json) {
    return LandmarkResponse(
      searchMetadata: json['search_metadata'] != null
          ? SearchMetadataLand.fromJson(json['search_metadata'])
          : null,
      searchParameters: json['search_parameters'] != null
          ? SearchParametersLand.fromJson(json['search_parameters'])
          : null,
      searchInformation: json['search_information'] != null
          ? SearchInformationLand.fromJson(json['search_information'])
          : null,
      landmarkModel: json['popular_destinations'] != null
          ? LandmarkModel.fromJson(json['popular_destinations'])
          : null,
      shoppingResults: json['shopping_results'] != null
          ? (json['shopping_results'] as List)
              .map((i) => ShoppingResult.fromJson(i))
              .toList()
          : null,
      knowledgeGraph: json['knowledge_graph'] != null
          ? KnowledgeGraph.fromJson(json['knowledge_graph'])
          : null,
      shortVideos: json['short_videos'] != null
          ? (json['short_videos'] as List)
              .map((i) => ShortVideo.fromJson(i))
              .toList()
          : null,
      relatedQuestions: json['related_questions'] != null
          ? (json['related_questions'] as List)
              .map((i) => RelatedQuestion.fromJson(i))
              .toList()
          : null,
      organicResults: json['organic_results'] != null
          ? (json['organic_results'] as List)
              .map((i) => OrganicResult.fromJson(i))
              .toList()
          : null,
      topStoriesLink: json['top_stories_link'],
      topStoriesSerpapiLink: json['top_stories_serpapi_link'],
      relatedSearches: json['related_searches'] != null
          ? (json['related_searches'] as List)
              .map((i) => RelatedSearch.fromJson(i))
              .toList()
          : null,
      discussionsAndForums: json['discussions_and_forums'] != null
          ? (json['discussions_and_forums'] as List)
              .map((i) => DiscussionAndForum.fromJson(i))
              .toList()
          : null,
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'])
          : null,
      serpapiPagination: json['serpapi_pagination'] != null
          ? SerpapiPaginationLand.fromJson(json['serpapi_pagination'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'search_metadata': searchMetadata?.toJson(),
      'search_parameters': searchParameters?.toJson(),
      'search_information': searchInformation?.toJson(),
      'popular_destinations': landmarkModel?.toJson(),
      'shopping_results': shoppingResults?.map((i) => i.toJson()).toList(),
      'knowledge_graph': knowledgeGraph?.toJson(),
      'short_videos': shortVideos?.map((i) => i.toJson()).toList(),
      'related_questions': relatedQuestions?.map((i) => i.toJson()).toList(),
      'organic_results': organicResults?.map((i) => i.toJson()).toList(),
      'top_stories_link': topStoriesLink,
      'top_stories_serpapi_link': topStoriesSerpapiLink,
      'related_searches': relatedSearches?.map((i) => i.toJson()).toList(),
      'discussions_and_forums':
          discussionsAndForums?.map((i) => i.toJson()).toList(),
      'pagination': pagination?.toJson(),
      'serpapi_pagination': serpapiPagination?.toJson(),
    };
  }
}

@HiveType(typeId: 36)
class SearchMetadataLand extends HiveObject {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? status;

  @HiveField(2)
  final String? jsonEndpoint;

  @HiveField(3)
  final String? createdAt;

  @HiveField(4)
  final String? processedAt;

  @HiveField(5)
  final String? googleUrl;

  @HiveField(6)
  final String? rawHtmlFile;

  @HiveField(7)
  final double? totalTimeTaken;

  SearchMetadataLand({
    this.id,
    this.status,
    this.jsonEndpoint,
    this.createdAt,
    this.processedAt,
    this.googleUrl,
    this.rawHtmlFile,
    this.totalTimeTaken,
  });

  factory SearchMetadataLand.fromJson(Map<String, dynamic> json) {
    return SearchMetadataLand(
      id: json['id'],
      status: json['status'],
      jsonEndpoint: json['json_endpoint'],
      createdAt: json['created_at'],
      processedAt: json['processed_at'],
      googleUrl: json['google_url'],
      rawHtmlFile: json['raw_html_file'],
      totalTimeTaken: json['total_time_taken']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'json_endpoint': jsonEndpoint,
      'created_at': createdAt,
      'processed_at': processedAt,
      'google_url': googleUrl,
      'raw_html_file': rawHtmlFile,
      'total_time_taken': totalTimeTaken,
    };
  }
}

@HiveType(typeId: 37)
class SearchParametersLand extends HiveObject {
  @HiveField(0)
  final String? engine;

  @HiveField(1)
  final String? q;

  @HiveField(2)
  final String? googleDomain;

  @HiveField(3)
  final String? device;

  SearchParametersLand({
    this.engine,
    this.q,
    this.googleDomain,
    this.device,
  });

  factory SearchParametersLand.fromJson(Map<String, dynamic> json) {
    return SearchParametersLand(
      engine: json['engine'],
      q: json['q'],
      googleDomain: json['google_domain'],
      device: json['device'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'engine': engine,
      'q': q,
      'google_domain': googleDomain,
      'device': device,
    };
  }
}

@HiveType(typeId: 38)
class SearchInformationLand extends HiveObject {
  @HiveField(0)
  final String? queryDisplayed;

  @HiveField(1)
  final int? totalResults;

  @HiveField(2)
  final double? timeTakenDisplayed;

  @HiveField(3)
  final String? organicResultsState;

  @HiveField(4)
  final String? resultsFor;

  SearchInformationLand({
    this.queryDisplayed,
    this.totalResults,
    this.timeTakenDisplayed,
    this.organicResultsState,
    this.resultsFor,
  });

  factory SearchInformationLand.fromJson(Map<String, dynamic> json) {
    return SearchInformationLand(
      queryDisplayed: json['query_displayed'],
      totalResults: json['total_results'],
      timeTakenDisplayed: json['time_taken_displayed']?.toDouble(),
      organicResultsState: json['organic_results_state'],
      resultsFor: json['results_for'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'query_displayed': queryDisplayed,
      'total_results': totalResults,
      'time_taken_displayed': timeTakenDisplayed,
      'organic_results_state': organicResultsState,
      'results_for': resultsFor,
    };
  }
}

@HiveType(typeId: 39)
class LandmarkModel extends HiveObject {
  @HiveField(0)
  final List<Destination>? destinations;

  LandmarkModel({this.destinations});

  factory LandmarkModel.fromJson(Map<String, dynamic> json) {
    return LandmarkModel(
      destinations: json['destinations'] != null
          ? (json['destinations'] as List)
              .map((i) => Destination.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'destinations': destinations?.map((i) => i.toJson()).toList(),
    };
  }
}

@HiveType(typeId: 40)
class Destination extends HiveObject {
  @HiveField(0)
  final String? title;

  @HiveField(1)
  final String? link;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final String? flightPrice;

  @HiveField(4)
  final int? extractedFlightPrice;

  @HiveField(5)
  final String? hotelPrice;

  @HiveField(6)
  final int? extractedHotelPrice;

  @HiveField(7)
  final String? driveDuration;

  @HiveField(8)
  final String? thumbnail;

  Destination({
    this.title,
    this.link,
    this.description,
    this.flightPrice,
    this.extractedFlightPrice,
    this.hotelPrice,
    this.extractedHotelPrice,
    this.driveDuration,
    this.thumbnail,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      title: json['title'],
      link: json['link'],
      description: json['description'],
      flightPrice: json['flight_price'],
      extractedFlightPrice: json['extracted_flight_price'],
      hotelPrice: json['hotel_price'],
      extractedHotelPrice: json['extracted_hotel_price'],
      driveDuration: json['drive_duration'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'link': link,
      'description': description,
      'flight_price': flightPrice,
      'extracted_flight_price': extractedFlightPrice,
      'hotel_price': hotelPrice,
      'extracted_hotel_price': extractedHotelPrice,
      'drive_duration': driveDuration,
      'thumbnail': thumbnail,
    };
  }
}

@HiveType(typeId: 41)
class ShoppingResult extends HiveObject {
  @HiveField(0)
  final int? position;

  @HiveField(1)
  final String? blockPosition;

  @HiveField(2)
  final String? title;

  @HiveField(3)
  final String? price;

  @HiveField(4)
  final int? extractedPrice;

  @HiveField(5)
  final String? link;

  @HiveField(6)
  final String? source;

  @HiveField(7)
  final double? rating;

  @HiveField(8)
  final int? reviews;

  @HiveField(9)
  final String? reviewsOriginal;

  @HiveField(10)
  final String? thumbnail;

  ShoppingResult({
    this.position,
    this.blockPosition,
    this.title,
    this.price,
    this.extractedPrice,
    this.link,
    this.source,
    this.rating,
    this.reviews,
    this.reviewsOriginal,
    this.thumbnail,
  });

  factory ShoppingResult.fromJson(Map<String, dynamic> json) {
    return ShoppingResult(
      position: json['position'],
      blockPosition: json['block_position'],
      title: json['title'],
      price: json['price'],
      extractedPrice: json['extracted_price'],
      link: json['link'],
      source: json['source'],
      rating: json['rating']?.toDouble(),
      reviews: json['reviews'],
      reviewsOriginal: json['reviews_original'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'position': position,
      'block_position': blockPosition,
      'title': title,
      'price': price,
      'extracted_price': extractedPrice,
      'link': link,
      'source': source,
      'rating': rating,
      'reviews': reviews,
      'reviews_original': reviewsOriginal,
      'thumbnail': thumbnail,
    };
  }
}

@HiveType(typeId: 42)
class KnowledgeGraph extends HiveObject {
  @HiveField(0)
  final String? entityType;

  KnowledgeGraph({this.entityType});

  factory KnowledgeGraph.fromJson(Map<String, dynamic> json) {
    return KnowledgeGraph(
      entityType: json['entity_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'entity_type': entityType,
    };
  }
}

@HiveType(typeId: 43)
class ShortVideo extends HiveObject {
  @HiveField(0)
  final int? position;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final String? source;

  @HiveField(3)
  final String? profileName;

  @HiveField(4)
  final List<String>? extensions;

  @HiveField(5)
  final String? sourceLogo;

  @HiveField(6)
  final String? clip;

  @HiveField(7)
  final String? date;

  @HiveField(8)
  final String? thumbnail;

  @HiveField(9)
  final String? link;

  ShortVideo({
    this.position,
    this.title,
    this.source,
    this.profileName,
    this.extensions,
    this.sourceLogo,
    this.clip,
    this.date,
    this.thumbnail,
    this.link,
  });

  factory ShortVideo.fromJson(Map<String, dynamic> json) {
    return ShortVideo(
      position: json['position'],
      title: json['title'],
      source: json['source'],
      profileName: json['profile_name'],
      extensions: json['extensions'] != null
          ? List<String>.from(json['extensions'])
          : null,
      sourceLogo: json['source_logo'],
      clip: json['clip'],
      date: json['date'],
      thumbnail: json['thumbnail'],
      link: json['link'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'position': position,
      'title': title,
      'source': source,
      'profile_name': profileName,
      'extensions': extensions,
      'source_logo': sourceLogo,
      'clip': clip,
      'date': date,
      'thumbnail': thumbnail,
      'link': link,
    };
  }
}

@HiveType(typeId: 44)
class RelatedQuestion extends HiveObject {
  @HiveField(0)
  final String? question;

  @HiveField(1)
  final String? snippet;

  @HiveField(2)
  final String? title;

  @HiveField(3)
  final String? link;

  @HiveField(4)
  final String? displayedLink;

  @HiveField(5)
  final String? sourceLogo;

  @HiveField(6)
  final String? nextPageToken;

  @HiveField(7)
  final String? serpapiLink;

  @HiveField(8)
  final List<String>? list;

  @HiveField(9)
  final String? thumbnail;

  RelatedQuestion({
    this.question,
    this.snippet,
    this.title,
    this.link,
    this.displayedLink,
    this.sourceLogo,
    this.nextPageToken,
    this.serpapiLink,
    this.list,
    this.thumbnail,
  });

  factory RelatedQuestion.fromJson(Map<String, dynamic> json) {
    return RelatedQuestion(
      question: json['question'],
      snippet: json['snippet'],
      title: json['title'],
      link: json['link'],
      displayedLink: json['displayed_link'],
      sourceLogo: json['source_logo'],
      nextPageToken: json['next_page_token'],
      serpapiLink: json['serpapi_link'],
      list: json['list'] != null ? List<String>.from(json['list']) : null,
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'snippet': snippet,
      'title': title,
      'link': link,
      'displayed_link': displayedLink,
      'source_logo': sourceLogo,
      'next_page_token': nextPageToken,
      'serpapi_link': serpapiLink,
      'list': list,
      'thumbnail': thumbnail,
    };
  }
}

@HiveType(typeId: 45)
class OrganicResult extends HiveObject {
  @HiveField(0)
  final int? position;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final String? link;

  @HiveField(3)
  final String? redirectLink;

  @HiveField(4)
  final String? displayedLink;

  @HiveField(5)
  final String? thumbnail;

  @HiveField(6)
  final String? favicon;

  @HiveField(7)
  final String? snippet;

  @HiveField(8)
  final List<String>? snippetHighlightedWords;

  @HiveField(9)
  final Sitelinks? sitelinks;

  @HiveField(10)
  final RichSnippet? richSnippet;

  @HiveField(11)
  final String? source;

  OrganicResult({
    this.position,
    this.title,
    this.link,
    this.redirectLink,
    this.displayedLink,
    this.thumbnail,
    this.favicon,
    this.snippet,
    this.snippetHighlightedWords,
    this.sitelinks,
    this.richSnippet,
    this.source,
  });

  factory OrganicResult.fromJson(Map<String, dynamic> json) {
    return OrganicResult(
      position: json['position'],
      title: json['title'],
      link: json['link'],
      redirectLink: json['redirect_link'],
      displayedLink: json['displayed_link'],
      thumbnail: json['thumbnail'],
      favicon: json['favicon'],
      snippet: json['snippet'],
      snippetHighlightedWords: json['snippet_highlighted_words'] != null
          ? List<String>.from(json['snippet_highlighted_words'])
          : null,
      sitelinks: json['sitelinks'] != null
          ? Sitelinks.fromJson(json['sitelinks'])
          : null,
      richSnippet: json['rich_snippet'] != null
          ? RichSnippet.fromJson(json['rich_snippet'])
          : null,
      source: json['source'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'position': position,
      'title': title,
      'link': link,
      'redirect_link': redirectLink,
      'displayed_link': displayedLink,
      'thumbnail': thumbnail,
      'favicon': favicon,
      'snippet': snippet,
      'snippet_highlighted_words': snippetHighlightedWords,
      'sitelinks': sitelinks?.toJson(),
      'rich_snippet': richSnippet?.toJson(),
      'source': source,
    };
  }
}

@HiveType(typeId: 46)
class Sitelinks extends HiveObject {
  @HiveField(0)
  final List<InlineSitelink>? inline;

  Sitelinks({this.inline});

  factory Sitelinks.fromJson(Map<String, dynamic> json) {
    return Sitelinks(
      inline: json['inline'] != null
          ? (json['inline'] as List)
              .map((i) => InlineSitelink.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'inline': inline?.map((i) => i.toJson()).toList(),
    };
  }
}

@HiveType(typeId: 47)
class InlineSitelink extends HiveObject {
  @HiveField(0)
  final String? title;

  @HiveField(1)
  final String? link;

  InlineSitelink({this.title, this.link});

  factory InlineSitelink.fromJson(Map<String, dynamic> json) {
    return InlineSitelink(
      title: json['title'],
      link: json['link'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'link': link,
    };
  }
}

@HiveType(typeId: 48)
class RichSnippet extends HiveObject {
  @HiveField(0)
  final BottomRichSnippet? bottom;

  RichSnippet({this.bottom});

  factory RichSnippet.fromJson(Map<String, dynamic> json) {
    return RichSnippet(
      bottom: json['bottom'] != null
          ? BottomRichSnippet.fromJson(json['bottom'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bottom': bottom?.toJson(),
    };
  }
}

@HiveType(typeId: 49)
class BottomRichSnippet extends HiveObject {
  @HiveField(0)
  final DetectedExtensions? detectedExtensions;

  @HiveField(1)
  final List<String>? extensions;

  BottomRichSnippet({this.detectedExtensions, this.extensions});

  factory BottomRichSnippet.fromJson(Map<String, dynamic> json) {
    return BottomRichSnippet(
      detectedExtensions: json['detected_extensions'] != null
          ? DetectedExtensions.fromJson(json['detected_extensions'])
          : null,
      extensions: json['extensions'] != null
          ? List<String>.from(json['extensions'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'detected_extensions': detectedExtensions?.toJson(),
      'extensions': extensions,
    };
  }
}

@HiveType(typeId: 50)
class DetectedExtensions extends HiveObject {
  @HiveField(0)
  final double? priceFrom;

  @HiveField(1)
  final double? priceTo;

  @HiveField(2)
  final String? currency;

  @HiveField(3)
  final double? rating;

  @HiveField(4)
  final int? reviews;

  DetectedExtensions({
    this.priceFrom,
    this.priceTo,
    this.currency,
    this.rating,
    this.reviews,
  });

  factory DetectedExtensions.fromJson(Map<String, dynamic> json) {
    return DetectedExtensions(
      priceFrom: json['price_from']?.toDouble(),
      priceTo: json['price_to']?.toDouble(),
      currency: json['currency'],
      rating: json['rating']?.toDouble(),
      reviews: json['reviews'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'price_from': priceFrom,
      'price_to': priceTo,
      'currency': currency,
      'rating': rating,
      'reviews': reviews,
    };
  }
}

@HiveType(typeId: 51)
class RelatedSearch extends HiveObject {
  @HiveField(0)
  final int? blockPosition;

  @HiveField(1)
  final String? query;

  @HiveField(2)
  final String? link;

  @HiveField(3)
  final String? serpapiLink;

  @HiveField(4)
  final List<SearchItem>? items;

  RelatedSearch({
    this.blockPosition,
    this.query,
    this.link,
    this.serpapiLink,
    this.items,
  });

  factory RelatedSearch.fromJson(Map<String, dynamic> json) {
    return RelatedSearch(
      blockPosition: json['block_position'],
      query: json['query'],
      link: json['link'],
      serpapiLink: json['serpapi_link'],
      items: json['items'] != null
          ? (json['items'] as List).map((i) => SearchItem.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'block_position': blockPosition,
      'query': query,
      'link': link,
      'serpapi_link': serpapiLink,
      'items': items?.map((i) => i.toJson()).toList(),
    };
  }
}

@HiveType(typeId: 52)
class SearchItem extends HiveObject {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? image;

  @HiveField(2)
  final String? link;

  @HiveField(3)
  final String? serpapiLink;

  SearchItem({
    this.name,
    this.image,
    this.link,
    this.serpapiLink,
  });

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(
      name: json['name'],
      image: json['image'],
      link: json['link'],
      serpapiLink: json['serpapi_link'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'link': link,
      'serpapi_link': serpapiLink,
    };
  }
}

@HiveType(typeId: 53)
class DiscussionAndForum extends HiveObject {
  @HiveField(0)
  final String? title;

  @HiveField(1)
  final String? link;

  @HiveField(2)
  final String? date;

  @HiveField(3)
  final List<String>? extensions;

  @HiveField(4)
  final String? source;

  @HiveField(5)
  final List<Answer>? answers;

  DiscussionAndForum({
    this.title,
    this.link,
    this.date,
    this.extensions,
    this.source,
    this.answers,
  });

  factory DiscussionAndForum.fromJson(Map<String, dynamic> json) {
    return DiscussionAndForum(
      title: json['title'],
      link: json['link'],
      date: json['date'],
      extensions: json['extensions'] != null
          ? List<String>.from(json['extensions'])
          : null,
      source: json['source'],
      answers: json['answers'] != null
          ? (json['answers'] as List).map((i) => Answer.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'link': link,
      'date': date,
      'extensions': extensions,
      'source': source,
      'answers': answers?.map((i) => i.toJson()).toList(),
    };
  }
}

@HiveType(typeId: 54)
class Answer extends HiveObject {
  @HiveField(0)
  final String? snippet;

  @HiveField(1)
  final String? link;

  @HiveField(2)
  final List<String>? extensions;

  Answer({
    this.snippet,
    this.link,
    this.extensions,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      snippet: json['snippet'],
      link: json['link'],
      extensions: json['extensions'] != null
          ? List<String>.from(json['extensions'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'snippet': snippet,
      'link': link,
      'extensions': extensions,
    };
  }
}

@HiveType(typeId: 55)
class Pagination extends HiveObject {
  @HiveField(0)
  final int? current;

  @HiveField(1)
  final String? next;

  @HiveField(2)
  final Map<String, String>? otherPages;

  Pagination({
    this.current,
    this.next,
    this.otherPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      current: json['current'],
      next: json['next'],
      otherPages: json['other_pages'] != null
          ? Map<String, String>.from(json['other_pages'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current': current,
      'next': next,
      'other_pages': otherPages,
    };
  }
}

@HiveType(typeId: 56)
class SerpapiPaginationLand extends HiveObject {
  @HiveField(0)
  final int? current;

  @HiveField(1)
  final String? nextLink;

  @HiveField(2)
  final String? next;

  @HiveField(3)
  final Map<String, String>? otherPages;

  SerpapiPaginationLand({
    this.current,
    this.nextLink,
    this.next,
    this.otherPages,
  });

  factory SerpapiPaginationLand.fromJson(Map<String, dynamic> json) {
    return SerpapiPaginationLand(
      current: json['current'],
      nextLink: json['next_link'],
      next: json['next'],
      otherPages: json['other_pages'] != null
          ? Map<String, String>.from(json['other_pages'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current': current,
      'next_link': nextLink,
      'next': next,
      'other_pages': otherPages,
    };
  }
}