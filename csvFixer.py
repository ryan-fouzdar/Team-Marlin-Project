import csv

def replace_range_with_right_value(input_file, output_file):
    with open(input_file, 'r', newline='') as infile, open(output_file, 'w', newline='') as outfile:
        reader = csv.reader(infile)
        writer = csv.writer(outfile)

        for row in reader:
            new_row = []
            for cell in row:
                if isinstance(cell, str) and '-' in cell:
                    parts = cell.split('-')
                    if len(parts) == 2 and parts[0].isdigit() and parts[1].isdigit():
                        new_cell = parts[1]
                    else:
                        new_cell = cell
                else:
                    new_cell = cell
                new_row.append(new_cell)
            writer.writerow(new_row)

input_file = 'flutter_application_1/assets/dataset/gdsc_dataset.csv'
output_file = 'ms_annual_data_2022_fixed.csv'

replace_range_with_right_value(input_file, output_file)