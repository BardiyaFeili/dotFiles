import re


# Function to convert hex color to RGB
def hex_to_rgb(hex_color):
    hex_color = hex_color.lstrip("#")
    return f"{int(hex_color[0:2], 16)}, {int(hex_color[2:4], 16)}, {int(hex_color[4:6], 16)}"


# Function to process the file
def convert_colors(input_file, output_file):
    with open(input_file, "r") as file:
        lines = file.readlines()

    with open(output_file, "w") as file:
        for line in lines:
            match = re.match(r"(@define-color\s+\w+\s+)#([0-9a-fA-F]{6});", line)
            if match:
                prefix, hex_color = match.groups()
                rgb_color = hex_to_rgb(hex_color)
                file.write(f"{prefix}rgba({rgb_color}, 0.8);\n")
            else:
                file.write(line)


# Specify the input and output file paths
input_file = (
    "/home/bardiya/.cache/wal/colors-waybar.css"  # Replace with your input file path
)
output_file = (
    "/home/bardiya/.cache/wal/hello.css"  # Replace with your desired output file path
)

# Convert the colors
convert_colors(input_file, output_file)

print(f"Conversion complete. Output written to {output_file}.")
