class Recipe {
  final String name, imagePath, kiloCaloriesBurnt, timeTaken, preparation;
  var ingredients;
  final String protein, carbs, fats;
  var image;
  String imageingre;
  Recipe({
    this.name,
    this.imagePath,
    this.kiloCaloriesBurnt,
    this.timeTaken,
    this.ingredients,
    this.preparation,
    this.carbs,
    this.protein,
    this.fats,
    this.image,
    this.imageingre
  });
}

// final recipes = [
//   Recipe(
//       name: "Fruit Granola",
//       kiloCaloriesBurnt: "200",
//       fats: "10",
//       protein: "20",
//       carbs: "30",
//       timeTaken: "10",
//       imagePath:
//           "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/7.jpg",
//       ingredients: [
//         "1 cup of granola",
//         "1 banana",
//         "1/2 cup of raisins",
//         "1 tbsp of honey",
//       ],
//       imageingre:'https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/0.jpg',
//       preparation:
//           "Cut eggplants into 12 thin slices, coat with olive oil and season with 1 teaspoon salt. Roast in the oven at 464°F (240°C) grill setting for 7 minutes or until the tops begin to brown. Turn them over and grill for another 7 minute.Separate cauliflower into individual florets, steam or boil it for 15 minutes - or until it becomes soft. A fork should easily go through it.Mash the cauliflower, dice sun-dried tomatoes and finely cut spinach. Add mashed cauliflower, sun dried tomatoes, garlic, hummus, spinach and lemon juice to a bowl and mix to combine. You’ve got your filling! Alternatively, use a food processor and blend everything on pulse until combined but not yet smooth.Top each eggplant slice with 2 tablespoons of filling and roll it up. Can be served hot or cold.",
      
//       image: [
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/1.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/2.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/3.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/4.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/5.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/6.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/7.jpg"
//       ]),
//   Recipe(
//       name: "Butter chicken",
//       kiloCaloriesBurnt: "450",
//       fats: "40",
//       protein: "60",
//       carbs: "90",
//       timeTaken: "25",
//       imagePath:
//           "https://darebee.com/images/recipes/lentil-loaf/lentil-loaf.jpg",
//       ingredients: [
//         "1 cup of granola",
//         "1 banana",
//         "1/2 cup of raisins",
//         "1 tbsp of honey",
//       ],
//       imageingre:"https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/0.jpg",
//       preparation:
//           '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum tempus egestas sed sed risus pretium quam. Platea dictumst quisque sagittis purus sit. Senectus et netus et malesuada fames ac turpis egestas sed. Nibh cras pulvinar mattis nunc. Amet consectetur adipiscing elit duis tristique. Interdum velit euismod in pellentesque massa placerat duis ultricies lacus. Lectus proin nibh nisl condimentum id venenatis. Sit amet massa vitae tortor condimentum lacinia quis vel eros. Sed adipiscing diam donec adipiscing tristique risus nec feugiat in. Enim tortor at auctor urna. In dictum non consectetur a.
// Sit amet risus nullam eget. Viverra adipiscing at in tellus integer feugiat scelerisque varius morbi. Quis risus sed vulputate odio ut enim blandit volutpat maecenas. Turpis cursus in hac habitasse platea dictumst quisque sagittis. Eget mi proin sed libero. Non diam phasellus vestibulum lorem sed risus ultricies tristique. Neque viverra justo nec ultrices dui. Gravida neque convallis a cras semper. Morbi tempus iaculis urna id volutpat lacus laoreet non. Pretium vulputate sapien nec sagittis aliquam malesuada bibendum. Amet mattis vulputate enim nulla aliquet. Lectus urna duis convallis convallis tellus. Porta non pulvinar neque laoreet suspendisse interdum consectetur libero id. Diam ut venenatis tellus in metus vulputate eu scelerisque felis. Adipiscing vitae proin sagittis nisl. Sed libero enim sed faucibus turpis in. Pulvinar mattis nunc sed blandit. Nisi scelerisque eu ultrices vitae auctor eu augue ut. Diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Sed id semper risus in hendrerit.
//   ''',
      
//       image: [
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/1.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/2.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/3.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/4.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/5.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/6.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/7.jpg"
//       ]),
//       Recipe(
//       name: "rotten cheese",
//       kiloCaloriesBurnt: "900",
//       fats: "60",
//       protein: "120",
//       carbs: "300",
//       timeTaken: "45",
//       imagePath:
//           "https://darebee.com/images/recipes/teriyaki-tofu/teriyaki-tofu.jpg",
//       ingredients: [
//         "1 cup of granola",
//         "1 banana",
//         "1/2 cup of raisins",
//         "1 tbsp of honey",
//       ],
//       imageingre:"https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/0.jpg",
//       preparation:
//           '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum tempus egestas sed sed risus pretium quam. Platea dictumst quisque sagittis purus sit. Senectus et netus et malesuada fames ac turpis egestas sed. Nibh cras pulvinar mattis nunc. Amet consectetur adipiscing elit duis tristique. Interdum velit euismod in pellentesque massa placerat duis ultricies lacus. Lectus proin nibh nisl condimentum id venenatis. Sit amet massa vitae tortor condimentum lacinia quis vel eros. Sed adipiscing diam donec adipiscing tristique risus nec feugiat in. Enim tortor at auctor urna. In dictum non consectetur a.
// Sit amet risus nullam eget. Viverra adipiscing at in tellus integer feugiat scelerisque varius morbi. Quis risus sed vulputate odio ut enim blandit volutpat maecenas. Turpis cursus in hac habitasse platea dictumst quisque sagittis. Eget mi proin sed libero. Non diam phasellus vestibulum lorem sed risus ultricies tristique. Neque viverra justo nec ultrices dui. Gravida neque convallis a cras semper. Morbi tempus iaculis urna id volutpat lacus laoreet non. Pretium vulputate sapien nec sagittis aliquam malesuada bibendum. Amet mattis vulputate enim nulla aliquet. Lectus urna duis convallis convallis tellus. Porta non pulvinar neque laoreet suspendisse interdum consectetur libero id. Diam ut venenatis tellus in metus vulputate eu scelerisque felis. Adipiscing vitae proin sagittis nisl. Sed libero enim sed faucibus turpis in. Pulvinar mattis nunc sed blandit. Nisi scelerisque eu ultrices vitae auctor eu augue ut. Diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Sed id semper risus in hendrerit.
//   ''',
      
//       image: [
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/1.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/2.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/3.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/4.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/5.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/6.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/7.jpg"
//       ]),
//       Recipe(
//       name: "Red Pasta",
//       kiloCaloriesBurnt: "650",
//       fats: "20",
//       protein: "40",
//       carbs: "70",
//       timeTaken: "60",
//       imagePath:
//           "https://darebee.com/images/recipes/sushi-rolls/sushi-rolls.jpg",
//       ingredients: [
//         "1 cup of granola",
//         "1 banana",
//         "1/2 cup of raisins",
//         "1 tbsp of honey",
//       ],
//       imageingre:'https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/0.jpg',
//       preparation:
//           '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum tempus egestas sed sed risus pretium quam. Platea dictumst quisque sagittis purus sit. Senectus et netus et malesuada fames ac turpis egestas sed. Nibh cras pulvinar mattis nunc. Amet consectetur adipiscing elit duis tristique. Interdum velit euismod in pellentesque massa placerat duis ultricies lacus. Lectus proin nibh nisl condimentum id venenatis. Sit amet massa vitae tortor condimentum lacinia quis vel eros. Sed adipiscing diam donec adipiscing tristique risus nec feugiat in. Enim tortor at auctor urna. In dictum non consectetur a.
// Sit amet risus nullam eget. Viverra adipiscing at in tellus integer feugiat scelerisque varius morbi. Quis risus sed vulputate odio ut enim blandit volutpat maecenas. Turpis cursus in hac habitasse platea dictumst quisque sagittis. Eget mi proin sed libero. Non diam phasellus vestibulum lorem sed risus ultricies tristique. Neque viverra justo nec ultrices dui. Gravida neque convallis a cras semper. Morbi tempus iaculis urna id volutpat lacus laoreet non. Pretium vulputate sapien nec sagittis aliquam malesuada bibendum. Amet mattis vulputate enim nulla aliquet. Lectus urna duis convallis convallis tellus. Porta non pulvinar neque laoreet suspendisse interdum consectetur libero id. Diam ut venenatis tellus in metus vulputate eu scelerisque felis. Adipiscing vitae proin sagittis nisl. Sed libero enim sed faucibus turpis in. Pulvinar mattis nunc sed blandit. Nisi scelerisque eu ultrices vitae auctor eu augue ut. Diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Sed id semper risus in hendrerit.
//   ''',
      
//       image: [
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/1.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/2.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/3.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/4.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/5.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/6.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/7.jpg"
//       ]),
//       Recipe(
//       name: "Paneer tikka",
//       kiloCaloriesBurnt: "500",
//       fats: "40",
//       protein: "90",
//       carbs: "100",
//       timeTaken: "30",
//       imagePath:
//           "https://darebee.com/images/recipes/cauliflower-eggplant-rolls/cauliflower-eggplant-rolls.jpg",
//       ingredients: [
//         "1 cup of granola",
//         "1 banana",
//         "1/2 cup of raisins",
//         "1 tbsp of honey",
//       ],
//       imageingre:'https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/0.jpg',
//       preparation:
//           '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum tempus egestas sed sed risus pretium quam. Platea dictumst quisque sagittis purus sit. Senectus et netus et malesuada fames ac turpis egestas sed. Nibh cras pulvinar mattis nunc. Amet consectetur adipiscing elit duis tristique. Interdum velit euismod in pellentesque massa placerat duis ultricies lacus. Lectus proin nibh nisl condimentum id venenatis. Sit amet massa vitae tortor condimentum lacinia quis vel eros. Sed adipiscing diam donec adipiscing tristique risus nec feugiat in. Enim tortor at auctor urna. In dictum non consectetur a.
// Sit amet risus nullam eget. Viverra adipiscing at in tellus integer feugiat scelerisque varius morbi. Quis risus sed vulputate odio ut enim blandit volutpat maecenas. Turpis cursus in hac habitasse platea dictumst quisque sagittis. Eget mi proin sed libero. Non diam phasellus vestibulum lorem sed risus ultricies tristique. Neque viverra justo nec ultrices dui. Gravida neque convallis a cras semper. Morbi tempus iaculis urna id volutpat lacus laoreet non. Pretium vulputate sapien nec sagittis aliquam malesuada bibendum. Amet mattis vulputate enim nulla aliquet. Lectus urna duis convallis convallis tellus. Porta non pulvinar neque laoreet suspendisse interdum consectetur libero id. Diam ut venenatis tellus in metus vulputate eu scelerisque felis. Adipiscing vitae proin sagittis nisl. Sed libero enim sed faucibus turpis in. Pulvinar mattis nunc sed blandit. Nisi scelerisque eu ultrices vitae auctor eu augue ut. Diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Sed id semper risus in hendrerit.
//   ''',
      
//       image: [
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/1.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/2.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/3.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/4.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/5.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/6.jpg",
//         "https://darebee.com/images/recipes/sweet-potato-chickpea-burgers/7.jpg"
//       ]),
  
// ];
