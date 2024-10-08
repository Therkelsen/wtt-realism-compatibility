import json
import sys

def extract_and_save(input_file_path, output_file_path):
    # Open and load the input JSON file
    with open(input_file_path, 'r') as infile:
        data = json.load(infile)

    # Initialize an empty dictionary to store the results
    extracted_data = {}

    # Iterate through the second-level entries
    for entry in data.values():
        # Check if the entry contains the "itemTplToClone" key
        if 'itemTplToClone' in entry:
            # Extract the value of "itemTplToClone"
            item_tpl = entry['itemTplToClone']
            # Create an entry in the result dictionary with the required sub-tags
            extracted_data[item_tpl] = {
                "ItemID": item_tpl,
                "Name": "",
                "TemplateType": "mod",
                "ModType": ""
            }

    # Write the new JSON data to the output file
    with open(output_file_path, 'w') as outfile:
        json.dump(extracted_data, outfile, indent=4)

if __name__ == "__main__":
    # Get input and output file paths from command-line arguments
    if len(sys.argv) != 3:
        print("Usage: python script.py <input_file_path> <output_file_path>")
        sys.exit(1)

    input_file_path = sys.argv[1]
    output_file_path = sys.argv[2]

    # Call the function to extract and save the JSON data
    extract_and_save(input_file_path, output_file_path)
