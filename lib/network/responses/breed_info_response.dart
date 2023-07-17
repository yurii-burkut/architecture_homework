import 'package:json_annotation/json_annotation.dart';
part 'breed_info_response.g.dart';
@JsonSerializable()
class BreedInfoResponse {
  final Weight? weight;
  final String id;
  final String name;
  final String? vetstreetUrl;
  final String? temperament;
  final String? origin;
  final String? countryCodes;
  final String? countryCode;
  final String description;
  final String? lifeSpan;
  final int? indoor;
  final String? altNames;
  final int? adaptability;
  final int? affectionLevel;
  final int? childFriendly;
  final int? dogFriendly;
  final int? energyLevel;
  final int? grooming;
  final int? healthIssues;
  final int? intelligence;
  final int? sheddingLevel;
  final int? socialNeeds;
  final int? strangerFriendly;
  final int? vocalisation;
  final int? experimental;
  final int? hairless;
  final int? natural;
  final int? rare;
  final int? rex;
  final int? suppressedTail;
  final int? shortLegs;
  final String? wikipediaUrl;
  final int? hypoallergenic;
  final String? referenceImageId;

  const BreedInfoResponse({
    required this.weight,
    required this.id,
    required this.name,
    required this.vetstreetUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    required this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.wikipediaUrl,
    required this.hypoallergenic,
    required this.referenceImageId});

  factory BreedInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$BreedInfoResponseFromJson(json);

  // BreedInfoResponse.fromJson(Map<String, dynamic> json) {
  //   weight =
  //   json['weight'] != null ? new Weight.fromJson(json['weight']) : null;
  //   id = json['id'];
  //   name = json['name'];
  //   vetstreetUrl = json['vetstreet_url'];
  //   temperament = json['temperament'];
  //   origin = json['origin'];
  //   countryCodes = json['country_codes'];
  //   countryCode = json['country_code'];
  //   description = json['description'];
  //   lifeSpan = json['life_span'];
  //   indoor = json['indoor'];
  //   altNames = json['alt_names'];
  //   adaptability = json['adaptability'];
  //   affectionLevel = json['affection_level'];
  //   childFriendly = json['child_friendly'];
  //   dogFriendly = json['dog_friendly'];
  //   energyLevel = json['energy_level'];
  //   grooming = json['grooming'];
  //   healthIssues = json['health_issues'];
  //   intelligence = json['intelligence'];
  //   sheddingLevel = json['shedding_level'];
  //   socialNeeds = json['social_needs'];
  //   strangerFriendly = json['stranger_friendly'];
  //   vocalisation = json['vocalisation'];
  //   experimental = json['experimental'];
  //   hairless = json['hairless'];
  //   natural = json['natural'];
  //   rare = json['rare'];
  //   rex = json['rex'];
  //   suppressedTail = json['suppressed_tail'];
  //   shortLegs = json['short_legs'];
  //   wikipediaUrl = json['wikipedia_url'];
  //   hypoallergenic = json['hypoallergenic'];
  //   referenceImageId = json['reference_image_id'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.weight != null) {
  //     data['weight'] = this.weight!.toJson();
  //   }
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['vetstreet_url'] = this.vetstreetUrl;
  //   data['temperament'] = this.temperament;
  //   data['origin'] = this.origin;
  //   data['country_codes'] = this.countryCodes;
  //   data['country_code'] = this.countryCode;
  //   data['description'] = this.description;
  //   data['life_span'] = this.lifeSpan;
  //   data['indoor'] = this.indoor;
  //   data['alt_names'] = this.altNames;
  //   data['adaptability'] = this.adaptability;
  //   data['affection_level'] = this.affectionLevel;
  //   data['child_friendly'] = this.childFriendly;
  //   data['dog_friendly'] = this.dogFriendly;
  //   data['energy_level'] = this.energyLevel;
  //   data['grooming'] = this.grooming;
  //   data['health_issues'] = this.healthIssues;
  //   data['intelligence'] = this.intelligence;
  //   data['shedding_level'] = this.sheddingLevel;
  //   data['social_needs'] = this.socialNeeds;
  //   data['stranger_friendly'] = this.strangerFriendly;
  //   data['vocalisation'] = this.vocalisation;
  //   data['experimental'] = this.experimental;
  //   data['hairless'] = this.hairless;
  //   data['natural'] = this.natural;
  //   data['rare'] = this.rare;
  //   data['rex'] = this.rex;
  //   data['suppressed_tail'] = this.suppressedTail;
  //   data['short_legs'] = this.shortLegs;
  //   data['wikipedia_url'] = this.wikipediaUrl;
  //   data['hypoallergenic'] = this.hypoallergenic;
  //   data['reference_image_id'] = this.referenceImageId;
  //   return data;
  // }
  //Map<String, dynamic> toJson() => _$BreedInfoResponseToJson(this);
}

@JsonSerializable()
class Weight {
  final String? imperial;
  final String? metric;

  const Weight({required this.imperial, required this.metric});

  factory Weight.fromJson(Map<String, dynamic> json) =>
    _$WeightFromJson(json);

  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['imperial'] = this.imperial;
  //   data['metric'] = this.metric;
  //   return data;
  // }
}
