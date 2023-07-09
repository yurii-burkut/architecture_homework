import '../../network/responses/breed_details_response.dart';

class BreedDetails {
  const BreedDetails({
    required this.weight,
    required this.id,
    required this.name,
    required this.cfaUrl,
    required this.vetstreetUrl,
    required this.vcahospitalsUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    required this.lap,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.catFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.bidability,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.wikipediaUrl,
    required this.hypoallergenic,
    required this.referenceImageId,
  });

  final Weight weight;
  final String id;
  final String name;
  final String cfaUrl;
  final String vetstreetUrl;
  final String vcahospitalsUrl;
  final String temperament;
  final String origin;
  final String countryCodes;
  final String countryCode;
  final String description;
  final String lifeSpan;
  final int indoor;
  final int lap;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int catFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final int bidability;
  final int experimental;
  final int hairless;
  final int natural;
  final int rare;
  final int rex;
  final int suppressedTail;
  final int shortLegs;
  final String? wikipediaUrl;
  final int? hypoallergenic;
  final String? referenceImageId;


  factory BreedDetails.fromBreedDetailsResponse(BreedDetailsResponse response) {
    return BreedDetails(
      weight: Weight(
        imperial: response.weight.imperial,
        metric: response.weight.metric,
      ),
      id: response.id,
      name: response.name,
      cfaUrl: response.cfaUrl,
      vetstreetUrl: response.vetstreetUrl,
      vcahospitalsUrl: response.vcahospitalsUrl,
      temperament: response.temperament,
      origin: response.origin,
      countryCodes: response.countryCodes,
      countryCode: response.countryCode,
      description: response.description,
      lifeSpan: response.lifeSpan,
      indoor: response.indoor,
      lap: response.lap,
      adaptability: response.adaptability,
      affectionLevel: response.affectionLevel,
      childFriendly: response.childFriendly,
      catFriendly: response.catFriendly,
      dogFriendly: response.dogFriendly,
      energyLevel: response.energyLevel,
      grooming: response.grooming,
      healthIssues: response.healthIssues,
      intelligence: response.intelligence,
      sheddingLevel: response.sheddingLevel,
      socialNeeds: response.socialNeeds,
      strangerFriendly: response.strangerFriendly,
      vocalisation: response.vocalisation,
      bidability: response.bidability,
      experimental: response.experimental,
      hairless: response.hairless,
      natural: response.natural,
      rare: response.rare,
      rex: response.rex,
      suppressedTail: response.suppressedTail,
      shortLegs: response.shortLegs,
      wikipediaUrl: response.wikipediaUrl,
      hypoallergenic: response.hypoallergenic,
      referenceImageId: response.referenceImageId,
    );
  }
}

extension BreedDetailsResponseExtensions on BreedDetailsResponse {
  BreedDetails toBreedDetails() {
    return BreedDetails.fromBreedDetailsResponse(this);
  }
}


class Weight {
  final String imperial;
  final String metric;

  Weight({
    required this.imperial,
    required this.metric,
  });

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(
      imperial: json['imperial'],
      metric: json['metric'],
    );
  }
}
