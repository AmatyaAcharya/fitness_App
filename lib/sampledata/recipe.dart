class Recipe {
  final String name, imagePath, kiloCaloriesBurnt, timeTaken;

  Recipe({
    this.name,
    this.imagePath,
    this.kiloCaloriesBurnt,
    this.timeTaken,
  });
}

final recipes = [
  Recipe(
    name: "Fruit Granola",
    kiloCaloriesBurnt: "271",
    timeTaken: "10",
    imagePath: "assets/fruit_granola.jpg",
  ),
  Recipe(
    name: "Pesto Pasta",
    kiloCaloriesBurnt: "612",
    timeTaken: "15",
    imagePath: "assets/pesto_pasta.jpg",
  ),
  Recipe( 
    name: "Keto Snack",
    kiloCaloriesBurnt: "414",
    timeTaken: "16",
    imagePath: "assets/keto_snack.jpg",
  ),
];
