
import '../../network/responses/breed_details_response.dart';

class BreedDetails {
  final String id;
  final String name;
  final String description;
  final String temperament;
  final String origin;
  final String countryCodes;
  final String countryCode;
  final String lifeSpan;
  final String wikipediaUrl;
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
  final int hypoallergenic;
  final String referenceImageId;
  final Weight weight;

  String get imageUrl =>
      'https://cdn2.thecatapi.com/images/$referenceImageId.jpg';

  String getWeightString(BreedDetails breedDetails) {
    final weight = breedDetails.weight;
    return 'Weight: ${weight.imperial} (imperial) / ${weight.metric} (metric)';
  }


  BreedDetails({
    required this.id,
    required this.name,
    required this.description,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.lifeSpan,
    required this.wikipediaUrl,
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
    required this.hypoallergenic,
    required this.referenceImageId,
    required this.weight,
  });

  static BreedDetails fromResponse(BreedDetailsResponse response) {
    return BreedDetails(
      id: response.id ?? '',
      name: response.name ?? '',
      description: response.description ?? '',
      temperament: response.temperament ?? '',
      origin: response.origin ?? '',
      countryCodes: response.countryCodes ?? '',
      countryCode: response.countryCode ?? '',
      lifeSpan: response.lifeSpan ?? '',
      wikipediaUrl: response.wikipediaUrl ?? '',
      indoor: response.indoor ?? 0,
      lap: response.lap ?? 0,
      adaptability: response.adaptability ?? 0,
      affectionLevel: response.affectionLevel ?? 0,
      childFriendly: response.childFriendly ?? 0,
      catFriendly: response.catFriendly ?? 0,
      dogFriendly: response.dogFriendly ?? 0,
      energyLevel: response.energyLevel ?? 0,
      grooming: response.grooming ?? 0,
      healthIssues: response.healthIssues ?? 0,
      intelligence: response.intelligence ?? 0,
      sheddingLevel: response.sheddingLevel ?? 0,
      socialNeeds: response.socialNeeds ?? 0,
      strangerFriendly: response.strangerFriendly ?? 0,
      vocalisation: response.vocalisation ?? 0,
      bidability: response.bidability ?? 0,
      experimental: response.experimental ?? 0,
      hairless: response.hairless ?? 0,
      natural: response.natural ?? 0,
      rare: response.rare ?? 0,
      rex: response.rex ?? 0,
      suppressedTail: response.suppressedTail ?? 0,
      shortLegs: response.shortLegs ?? 0,
      hypoallergenic: response.hypoallergenic ?? 0,
      referenceImageId: response.referenceImageId ?? '',
      weight: response.weight ?? Weight(imperial: '', metric: ''),
    );
  }
}

