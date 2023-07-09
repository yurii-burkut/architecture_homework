import 'package:architecture_sample/breed_details/models/breed_details.dart';
import 'package:architecture_sample/network/services/breed_details_api_service.dart';

class BreedDetailsSearchRepository {
  const BreedDetailsSearchRepository({required BreedDetailsApiService breedDetailsApiService})
      : _breedDetailsApiService = breedDetailsApiService;

  final BreedDetailsApiService _breedDetailsApiService;

  Future<BreedDetails> loadBreedDetails(String breedId) async {
    final breedDetailsResponse = await _breedDetailsApiService.getBreedDetails(breedId);
    return BreedDetails(
      weight: breedDetailsResponse.weight,
      id: breedDetailsResponse.id,
      name: breedDetailsResponse.name,
      cfaUrl: breedDetailsResponse.cfaUrl,
      vetstreetUrl: breedDetailsResponse.vetstreetUrl,
      vcahospitalsUrl: breedDetailsResponse.vcahospitalsUrl,
      temperament: breedDetailsResponse.temperament,
      origin: breedDetailsResponse.origin,
      countryCodes: breedDetailsResponse.countryCodes,
      countryCode: breedDetailsResponse.countryCode,
      description: breedDetailsResponse.description,
      lifeSpan: breedDetailsResponse.lifeSpan,
      indoor: breedDetailsResponse.indoor,
      lap: breedDetailsResponse.lap,
      adaptability: breedDetailsResponse.adaptability,
      affectionLevel: breedDetailsResponse.affectionLevel,
      childFriendly: breedDetailsResponse.childFriendly,
      catFriendly: breedDetailsResponse.catFriendly,
      dogFriendly: breedDetailsResponse.dogFriendly,
      energyLevel: breedDetailsResponse.energyLevel,
      grooming: breedDetailsResponse.grooming,
      healthIssues: breedDetailsResponse.healthIssues,
      intelligence: breedDetailsResponse.intelligence,
      sheddingLevel: breedDetailsResponse.sheddingLevel,
      socialNeeds: breedDetailsResponse.socialNeeds,
      strangerFriendly: breedDetailsResponse.strangerFriendly,
      vocalisation: breedDetailsResponse.vocalisation,
      bidability: breedDetailsResponse.bidability,
      experimental: breedDetailsResponse.experimental,
      hairless: breedDetailsResponse.hairless,
      natural: breedDetailsResponse.natural,
      rare: breedDetailsResponse.rare,
      rex: breedDetailsResponse.rex,
      suppressedTail: breedDetailsResponse.suppressedTail,
      shortLegs: breedDetailsResponse.shortLegs,
      wikipediaUrl: breedDetailsResponse.wikipediaUrl,
      hypoallergenic: breedDetailsResponse.hypoallergenic,
      referenceImageId: breedDetailsResponse.referenceImageId,
    );
  }
}
