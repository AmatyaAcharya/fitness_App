import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterdev/Models/datamod.dart';

import 'package:flutterdev/Models/workout.dart';
import 'package:flutterdev/sampledata/recipe.dart';

class DatabaseService {
  final CollectionReference userdetailCollection =
      Firestore.instance.collection('userspecifics');
  final CollectionReference recipedetailCollection =
      Firestore.instance.collection('recipes');
      final CollectionReference workoutdetailCollection =
      Firestore.instance.collection('workouts');
  final String uid;
  static String ud = '';
  DatabaseService({this.uid});

  Future updateUserData(
      {String name,
      String age,
      String height,
      String weight,
      String gender,
      String activelevel,
      String caloriesdone,
      String protein,
      String fat,
      String carbs}) async {
    double bmi = (int.parse(weight) /
        ((int.parse(height) / 100) * (int.parse(height) / 100)));
    double calories;
    if (gender == 'M' || gender == 'm')
      calories = 66.47 +
          (13.75 * (int.parse(weight))) +
          (5 * (int.parse(height))) -
          (6.8 * (int.parse(age)));
    else
      calories = 665 +
          (9.6 * (int.parse(weight))) +
          (1.8 * (int.parse(height))) -
          (4.7 * (int.parse(age)));

    if (int.parse(activelevel) == 1 || int.parse(activelevel) == 2)
      calories = calories * 1.2;
    else if (int.parse(activelevel) == 6 || int.parse(activelevel) == 7)
      calories = calories * 1.7;
    else
      calories = calories * 1.5;
    int cal = calories.round();
    return await userdetailCollection.document(ud).setData({
      'uid': ud,
      'name': name,
      'age': age,
      'height': height,
      'weight': weight,
      'gender': gender,
      'activelevel': activelevel,
      'bmi': "${bmi.toStringAsFixed(1)}",
      'calories': "$cal",
      'caloriesdone': caloriesdone,
      'protein': protein,
      'fat': fat,
      'carbs': carbs,
    });
  }

//easy way to get user data
  Datamod userDataFromSnapshot(DocumentSnapshot snapshot) {
    return Datamod(
      uid: snapshot.data['uid'],
      name: snapshot.data['name'],
      weight: snapshot.data['weight'],
      height: snapshot.data['height'],
      age: snapshot.data['age'],
      activelevel: snapshot.data['activelevel'],
      bmi: snapshot.data['bmi'],
      calories: snapshot.data['calories'],
      caloriesdone: snapshot.data['caloriesdone'],
      carbs: snapshot.data['carbs'],
      fat: snapshot.data['fat'],
      gender: snapshot.data['gender'],
      protein: snapshot.data['protein'],
    );
  }

  //dataobject from the snapshot, lengthy way
  List<Recipe> recipeDataFromSnapshot(QuerySnapshot snapshot) {
    //print("This is it $ud");
    return snapshot.documents.map((doc) {
      return Recipe(
        carbs: doc.data['carbs'],
        fats: doc.data['fats'],
        image: doc.data['image'],
        imagePath: doc.data['imagePath'],
        imageingre: doc.data['imageingre'],
        ingredients: doc.data['ingredients'],
        kiloCaloriesBurnt: doc.data['kiloCaloriesBurnt'],
        name: doc.data['name'],
        preparation: doc.data['preparation'],
        protein: doc.data['protein'],
        timeTaken: doc.data['timeTaken'],
      );
    }).toList();
  }
  List<Workouts> workoutDataFromSnapshot(QuerySnapshot snapshot) {
    //print("This is it $ud");
    return snapshot.documents.map((doc) {
      return Workouts(
        workouts: doc.data['image'],
      );
    }).toList();
  }
  //data object from document snapchot

//length user data fetching stream, all data
  Stream<List<Recipe>> get recipespecfics {
    return recipedetailCollection.snapshots().map(recipeDataFromSnapshot);
  }
  Stream<List<Workouts>> get workoutspecfics {
    return workoutdetailCollection.snapshots().map(workoutDataFromSnapshot);
  }
  //user document stream
  Stream<Datamod> get userspecfics {
    return userdetailCollection
        .document(uid)
        .snapshots()
        .map(userDataFromSnapshot);
  }
}
