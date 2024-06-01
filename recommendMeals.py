import math
import pandas as pd

# userData = {calorieGoal: 2280, proteinGoal: 190, fatGoal: 80, carbGoal: 200, mealsEaten: 0};
class User:
    def __init__(self, calorieGoal, proteinGoal, fatGoal, carbGoal, mealsEaten):
        self.calorieGoal = calorieGoal
        self.proteinGoal = proteinGoal
        self.fatGoal = fatGoal
        self.carbGoal = carbGoal
        self.mealsEaten = mealsEaten
        self.totalMeals = 3  # Assuming this is fixed for all users

# (it should return a weighted distance metric based on the values)
def euclideanDistanceMetric(user, meal):
    weight_calories = 1
    weight_protein = 2
    weight_fats = 2
    weight_carbs = 1.5
    distance = math.sqrt(
        weight_calories * ((user.calorieGoal / (user.totalMeals - user.mealsEaten)) - meal['calories'])**2 +
        weight_protein * ((user.proteinGoal / (user.totalMeals - user.mealsEaten)) - meal['protein'])**2 +
        weight_fats * ((user.fatGoal / (user.totalMeals - user.mealsEaten)) - meal['total_fat'])**2 +
        weight_carbs * ((user.carbGoal / (user.totalMeals - user.mealsEaten)) - meal['carbohydrates'])**2
    )
    return distance

# load meals into an array of sorts
def load_meals(filename):
    df = pd.read_csv(filename)
    # Convert necessary columns to numeric types explicitly
    numeric_columns = ['calories', 'total_fat', 'saturated_fat', 'trans_fat', 'cholesterol', 'sodium', 'carbohydrates', 'dietary_fiber', 'sugar', 'protein']
    df[numeric_columns] = df[numeric_columns].apply(pd.to_numeric, errors='coerce')
    meals = df.to_dict('records')
    return meals

# sort meals based on euclideanDistanceMetric
def recommend_meals(user, meals, num_recommendations):
    # Calculate distances for each meal
    for meal in meals:
        meal['distance'] = euclideanDistanceMetric(user, meal)
    
    # Sort meals by distance
    sorted_meals = sorted(meals, key=lambda x: x['distance'])
    
    # Return the top recommendations
    return sorted_meals[:num_recommendations]

# print first (numRecommendations) meals from the sorted array/list

curUser = User(calorieGoal=2280, proteinGoal=190, fatGoal=80, carbGoal=200, mealsEaten=0)
numRecommendations = 3

meals = load_meals("AggieBites/assets/dataset/gdsc_dataset.csv")
sortedMeals = recommend_meals(curUser, meals, numRecommendations)
for meal in sortedMeals:
	print(meal)