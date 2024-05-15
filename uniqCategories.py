import pandas as pd

# Load the CSV file
file_path = 'flutter_application_1/assets/dataset/gdsc_dataset.csv'  # Replace this with the path to your CSV file
df = pd.read_csv(file_path)

# Specify the column from which you want to extract unique entries
column_name = 'food_category'  # Replace this with your column name

# Get unique values from the column
unique_values = df[column_name].unique()

# Print or process the unique values
print(unique_values)