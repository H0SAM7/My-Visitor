// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landmark_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LandmarkResponseAdapter extends TypeAdapter<LandmarkResponse> {
  @override
  final int typeId = 35;

  @override
  LandmarkResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LandmarkResponse(
      searchMetadata: fields[0] as SearchMetadataLand?,
      searchParameters: fields[1] as SearchParametersLand?,
      searchInformation: fields[2] as SearchInformationLand?,
      landmarkModel: fields[3] as LandmarkModel?,
      shoppingResults: (fields[4] as List?)?.cast<ShoppingResult>(),
      knowledgeGraph: fields[5] as KnowledgeGraph?,
      shortVideos: (fields[6] as List?)?.cast<ShortVideo>(),
      relatedQuestions: (fields[7] as List?)?.cast<RelatedQuestion>(),
      organicResults: (fields[8] as List?)?.cast<OrganicResult>(),
      topStoriesLink: fields[9] as String?,
      topStoriesSerpapiLink: fields[10] as String?,
      relatedSearches: (fields[11] as List?)?.cast<RelatedSearch>(),
      discussionsAndForums: (fields[12] as List?)?.cast<DiscussionAndForum>(),
      pagination: fields[13] as Pagination?,
      serpapiPagination: fields[14] as SerpapiPaginationLand?,
    );
  }

  @override
  void write(BinaryWriter writer, LandmarkResponse obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.searchMetadata)
      ..writeByte(1)
      ..write(obj.searchParameters)
      ..writeByte(2)
      ..write(obj.searchInformation)
      ..writeByte(3)
      ..write(obj.landmarkModel)
      ..writeByte(4)
      ..write(obj.shoppingResults)
      ..writeByte(5)
      ..write(obj.knowledgeGraph)
      ..writeByte(6)
      ..write(obj.shortVideos)
      ..writeByte(7)
      ..write(obj.relatedQuestions)
      ..writeByte(8)
      ..write(obj.organicResults)
      ..writeByte(9)
      ..write(obj.topStoriesLink)
      ..writeByte(10)
      ..write(obj.topStoriesSerpapiLink)
      ..writeByte(11)
      ..write(obj.relatedSearches)
      ..writeByte(12)
      ..write(obj.discussionsAndForums)
      ..writeByte(13)
      ..write(obj.pagination)
      ..writeByte(14)
      ..write(obj.serpapiPagination);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LandmarkResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SearchMetadataLandAdapter extends TypeAdapter<SearchMetadataLand> {
  @override
  final int typeId = 36;

  @override
  SearchMetadataLand read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchMetadataLand(
      id: fields[0] as String?,
      status: fields[1] as String?,
      jsonEndpoint: fields[2] as String?,
      createdAt: fields[3] as String?,
      processedAt: fields[4] as String?,
      googleUrl: fields[5] as String?,
      rawHtmlFile: fields[6] as String?,
      totalTimeTaken: fields[7] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, SearchMetadataLand obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.jsonEndpoint)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.processedAt)
      ..writeByte(5)
      ..write(obj.googleUrl)
      ..writeByte(6)
      ..write(obj.rawHtmlFile)
      ..writeByte(7)
      ..write(obj.totalTimeTaken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchMetadataLandAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SearchParametersLandAdapter extends TypeAdapter<SearchParametersLand> {
  @override
  final int typeId = 37;

  @override
  SearchParametersLand read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchParametersLand(
      engine: fields[0] as String?,
      q: fields[1] as String?,
      googleDomain: fields[2] as String?,
      device: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SearchParametersLand obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.engine)
      ..writeByte(1)
      ..write(obj.q)
      ..writeByte(2)
      ..write(obj.googleDomain)
      ..writeByte(3)
      ..write(obj.device);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchParametersLandAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SearchInformationLandAdapter extends TypeAdapter<SearchInformationLand> {
  @override
  final int typeId = 38;

  @override
  SearchInformationLand read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchInformationLand(
      queryDisplayed: fields[0] as String?,
      totalResults: fields[1] as int?,
      timeTakenDisplayed: fields[2] as double?,
      organicResultsState: fields[3] as String?,
      resultsFor: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SearchInformationLand obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.queryDisplayed)
      ..writeByte(1)
      ..write(obj.totalResults)
      ..writeByte(2)
      ..write(obj.timeTakenDisplayed)
      ..writeByte(3)
      ..write(obj.organicResultsState)
      ..writeByte(4)
      ..write(obj.resultsFor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchInformationLandAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LandmarkModelAdapter extends TypeAdapter<LandmarkModel> {
  @override
  final int typeId = 39;

  @override
  LandmarkModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LandmarkModel(
      destinations: (fields[0] as List?)?.cast<Destination>(),
    );
  }

  @override
  void write(BinaryWriter writer, LandmarkModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.destinations);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LandmarkModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DestinationAdapter extends TypeAdapter<Destination> {
  @override
  final int typeId = 40;

  @override
  Destination read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Destination(
      title: fields[0] as String?,
      link: fields[1] as String?,
      description: fields[2] as String?,
      flightPrice: fields[3] as String?,
      extractedFlightPrice: fields[4] as int?,
      hotelPrice: fields[5] as String?,
      extractedHotelPrice: fields[6] as int?,
      driveDuration: fields[7] as String?,
      thumbnail: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Destination obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.link)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.flightPrice)
      ..writeByte(4)
      ..write(obj.extractedFlightPrice)
      ..writeByte(5)
      ..write(obj.hotelPrice)
      ..writeByte(6)
      ..write(obj.extractedHotelPrice)
      ..writeByte(7)
      ..write(obj.driveDuration)
      ..writeByte(8)
      ..write(obj.thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DestinationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ShoppingResultAdapter extends TypeAdapter<ShoppingResult> {
  @override
  final int typeId = 41;

  @override
  ShoppingResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShoppingResult(
      position: fields[0] as int?,
      blockPosition: fields[1] as String?,
      title: fields[2] as String?,
      price: fields[3] as String?,
      extractedPrice: fields[4] as int?,
      link: fields[5] as String?,
      source: fields[6] as String?,
      rating: fields[7] as double?,
      reviews: fields[8] as int?,
      reviewsOriginal: fields[9] as String?,
      thumbnail: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ShoppingResult obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.position)
      ..writeByte(1)
      ..write(obj.blockPosition)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.extractedPrice)
      ..writeByte(5)
      ..write(obj.link)
      ..writeByte(6)
      ..write(obj.source)
      ..writeByte(7)
      ..write(obj.rating)
      ..writeByte(8)
      ..write(obj.reviews)
      ..writeByte(9)
      ..write(obj.reviewsOriginal)
      ..writeByte(10)
      ..write(obj.thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShoppingResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class KnowledgeGraphAdapter extends TypeAdapter<KnowledgeGraph> {
  @override
  final int typeId = 42;

  @override
  KnowledgeGraph read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KnowledgeGraph(
      entityType: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, KnowledgeGraph obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.entityType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KnowledgeGraphAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ShortVideoAdapter extends TypeAdapter<ShortVideo> {
  @override
  final int typeId = 43;

  @override
  ShortVideo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShortVideo(
      position: fields[0] as int?,
      title: fields[1] as String?,
      source: fields[2] as String?,
      profileName: fields[3] as String?,
      extensions: (fields[4] as List?)?.cast<String>(),
      sourceLogo: fields[5] as String?,
      clip: fields[6] as String?,
      date: fields[7] as String?,
      thumbnail: fields[8] as String?,
      link: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ShortVideo obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.position)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.source)
      ..writeByte(3)
      ..write(obj.profileName)
      ..writeByte(4)
      ..write(obj.extensions)
      ..writeByte(5)
      ..write(obj.sourceLogo)
      ..writeByte(6)
      ..write(obj.clip)
      ..writeByte(7)
      ..write(obj.date)
      ..writeByte(8)
      ..write(obj.thumbnail)
      ..writeByte(9)
      ..write(obj.link);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShortVideoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RelatedQuestionAdapter extends TypeAdapter<RelatedQuestion> {
  @override
  final int typeId = 44;

  @override
  RelatedQuestion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RelatedQuestion(
      question: fields[0] as String?,
      snippet: fields[1] as String?,
      title: fields[2] as String?,
      link: fields[3] as String?,
      displayedLink: fields[4] as String?,
      sourceLogo: fields[5] as String?,
      nextPageToken: fields[6] as String?,
      serpapiLink: fields[7] as String?,
      list: (fields[8] as List?)?.cast<String>(),
      thumbnail: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RelatedQuestion obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.question)
      ..writeByte(1)
      ..write(obj.snippet)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.link)
      ..writeByte(4)
      ..write(obj.displayedLink)
      ..writeByte(5)
      ..write(obj.sourceLogo)
      ..writeByte(6)
      ..write(obj.nextPageToken)
      ..writeByte(7)
      ..write(obj.serpapiLink)
      ..writeByte(8)
      ..write(obj.list)
      ..writeByte(9)
      ..write(obj.thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RelatedQuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrganicResultAdapter extends TypeAdapter<OrganicResult> {
  @override
  final int typeId = 45;

  @override
  OrganicResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrganicResult(
      position: fields[0] as int?,
      title: fields[1] as String?,
      link: fields[2] as String?,
      redirectLink: fields[3] as String?,
      displayedLink: fields[4] as String?,
      thumbnail: fields[5] as String?,
      favicon: fields[6] as String?,
      snippet: fields[7] as String?,
      snippetHighlightedWords: (fields[8] as List?)?.cast<String>(),
      sitelinks: fields[9] as Sitelinks?,
      richSnippet: fields[10] as RichSnippet?,
      source: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OrganicResult obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.position)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.link)
      ..writeByte(3)
      ..write(obj.redirectLink)
      ..writeByte(4)
      ..write(obj.displayedLink)
      ..writeByte(5)
      ..write(obj.thumbnail)
      ..writeByte(6)
      ..write(obj.favicon)
      ..writeByte(7)
      ..write(obj.snippet)
      ..writeByte(8)
      ..write(obj.snippetHighlightedWords)
      ..writeByte(9)
      ..write(obj.sitelinks)
      ..writeByte(10)
      ..write(obj.richSnippet)
      ..writeByte(11)
      ..write(obj.source);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrganicResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SitelinksAdapter extends TypeAdapter<Sitelinks> {
  @override
  final int typeId = 46;

  @override
  Sitelinks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sitelinks(
      inline: (fields[0] as List?)?.cast<InlineSitelink>(),
    );
  }

  @override
  void write(BinaryWriter writer, Sitelinks obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.inline);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SitelinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InlineSitelinkAdapter extends TypeAdapter<InlineSitelink> {
  @override
  final int typeId = 47;

  @override
  InlineSitelink read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InlineSitelink(
      title: fields[0] as String?,
      link: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, InlineSitelink obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.link);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InlineSitelinkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RichSnippetAdapter extends TypeAdapter<RichSnippet> {
  @override
  final int typeId = 48;

  @override
  RichSnippet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RichSnippet(
      bottom: fields[0] as BottomRichSnippet?,
    );
  }

  @override
  void write(BinaryWriter writer, RichSnippet obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.bottom);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RichSnippetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BottomRichSnippetAdapter extends TypeAdapter<BottomRichSnippet> {
  @override
  final int typeId = 49;

  @override
  BottomRichSnippet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BottomRichSnippet(
      detectedExtensions: fields[0] as DetectedExtensions?,
      extensions: (fields[1] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, BottomRichSnippet obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.detectedExtensions)
      ..writeByte(1)
      ..write(obj.extensions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BottomRichSnippetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DetectedExtensionsAdapter extends TypeAdapter<DetectedExtensions> {
  @override
  final int typeId = 50;

  @override
  DetectedExtensions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DetectedExtensions(
      priceFrom: fields[0] as double?,
      priceTo: fields[1] as double?,
      currency: fields[2] as String?,
      rating: fields[3] as double?,
      reviews: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, DetectedExtensions obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.priceFrom)
      ..writeByte(1)
      ..write(obj.priceTo)
      ..writeByte(2)
      ..write(obj.currency)
      ..writeByte(3)
      ..write(obj.rating)
      ..writeByte(4)
      ..write(obj.reviews);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetectedExtensionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RelatedSearchAdapter extends TypeAdapter<RelatedSearch> {
  @override
  final int typeId = 51;

  @override
  RelatedSearch read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RelatedSearch(
      blockPosition: fields[0] as int?,
      query: fields[1] as String?,
      link: fields[2] as String?,
      serpapiLink: fields[3] as String?,
      items: (fields[4] as List?)?.cast<SearchItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, RelatedSearch obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.blockPosition)
      ..writeByte(1)
      ..write(obj.query)
      ..writeByte(2)
      ..write(obj.link)
      ..writeByte(3)
      ..write(obj.serpapiLink)
      ..writeByte(4)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RelatedSearchAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SearchItemAdapter extends TypeAdapter<SearchItem> {
  @override
  final int typeId = 52;

  @override
  SearchItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchItem(
      name: fields[0] as String?,
      image: fields[1] as String?,
      link: fields[2] as String?,
      serpapiLink: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SearchItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.link)
      ..writeByte(3)
      ..write(obj.serpapiLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DiscussionAndForumAdapter extends TypeAdapter<DiscussionAndForum> {
  @override
  final int typeId = 53;

  @override
  DiscussionAndForum read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DiscussionAndForum(
      title: fields[0] as String?,
      link: fields[1] as String?,
      date: fields[2] as String?,
      extensions: (fields[3] as List?)?.cast<String>(),
      source: fields[4] as String?,
      answers: (fields[5] as List?)?.cast<Answer>(),
    );
  }

  @override
  void write(BinaryWriter writer, DiscussionAndForum obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.link)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.extensions)
      ..writeByte(4)
      ..write(obj.source)
      ..writeByte(5)
      ..write(obj.answers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiscussionAndForumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AnswerAdapter extends TypeAdapter<Answer> {
  @override
  final int typeId = 54;

  @override
  Answer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Answer(
      snippet: fields[0] as String?,
      link: fields[1] as String?,
      extensions: (fields[2] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Answer obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.snippet)
      ..writeByte(1)
      ..write(obj.link)
      ..writeByte(2)
      ..write(obj.extensions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnswerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PaginationAdapter extends TypeAdapter<Pagination> {
  @override
  final int typeId = 55;

  @override
  Pagination read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pagination(
      current: fields[0] as int?,
      next: fields[1] as String?,
      otherPages: (fields[2] as Map?)?.cast<String, String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Pagination obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.current)
      ..writeByte(1)
      ..write(obj.next)
      ..writeByte(2)
      ..write(obj.otherPages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaginationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SerpapiPaginationLandAdapter extends TypeAdapter<SerpapiPaginationLand> {
  @override
  final int typeId = 56;

  @override
  SerpapiPaginationLand read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SerpapiPaginationLand(
      current: fields[0] as int?,
      nextLink: fields[1] as String?,
      next: fields[2] as String?,
      otherPages: (fields[3] as Map?)?.cast<String, String>(),
    );
  }

  @override
  void write(BinaryWriter writer, SerpapiPaginationLand obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.current)
      ..writeByte(1)
      ..write(obj.nextLink)
      ..writeByte(2)
      ..write(obj.next)
      ..writeByte(3)
      ..write(obj.otherPages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SerpapiPaginationLandAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
