class Specie {
  final int id;
  final String description;
  final String evolvesFromSpecie;
  final String generation;
  final String growthRate;
  final String habitat;
  final bool isLegendary;
  final bool isMythical;
  final String name;
  final int order;

  Specie({
    required this.id,
    required this.description,
    required this.evolvesFromSpecie,
    required this.generation,
    required this.growthRate,
    required this.habitat,
    required this.isLegendary,
    required this.isMythical,
    required this.name,
    required this.order,
  });
}
