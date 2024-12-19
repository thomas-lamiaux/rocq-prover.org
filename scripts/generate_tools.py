import re
from pathlib import Path

def extract_details_from_html(html_content,lifecycle):
    """
    Extract package details from HTML content.
    :param html_content: String containing the HTML content.
    :return: List of dictionaries with package details.
    """
    details_blocks = re.findall(r'<details>.*?</details>', html_content, re.DOTALL)
    packages = []

    for block in details_blocks:
        name_match = re.search(r'<summary><a .*?>(.*?)<', block)
        source_match = re.search(r'<summary><a href=\'(.*?)\'>', block)
        license_match = re.search(r'<dt><b>license</b></dt><dd> <a href=\"(.*?)\"', block)
        synopsis_match = re.search(r'\(.*?\)(.*?)</summary>', block)
        description_match = re.search(r'<dt><b>description</b></dt><dd>(.*?)</dd>', block, re.DOTALL)

        if name_match:
            name = name_match.group(1)
            source = source_match.group(1) if len(source_match.group(1)) > 1 else "https://github.com"
            license = license_match.group(1) if license_match else "Unknown"
            synopsis = synopsis_match.group(1) if len(synopsis_match.group(1)) > 1 else "No synopsis available"
            description = re.sub(r'<[^>]*>', '', description_match.group(1)).replace('<br>', ' ') if description_match else "No description available"

            packages.append({
                "name": name,
                "source": source,
                "license": license,
                "synopsis": synopsis,
                "description": description,
                "lifecycle": lifecycle
            })

    return packages

def write_yaml(packages, output_file):
    """
    Write the extracted package details into a YAML file.
    :param packages: List of package dictionaries.
    :param output_file: Path to the output YAML file.
    """
    with open(output_file, 'w') as yaml_file:
        for package in packages:
            yaml_file.write(f"  - name: {package['name']}\n")
            yaml_file.write(f"    source: {package['source']}\n")
            yaml_file.write(f"    license: {package['license']}\n")
            yaml_file.write(f"    synopsis: {package['synopsis']}\n")
            yaml_file.write(f"    description: >\n")
            yaml_file.write(f"      {package['description']}\n")
            yaml_file.write(f"    lifecycle: {package['lifecycle']}\n")


def main(input_html_file,lifecycle):
    """
    Main function to process the input HTML file and generate a YAML file.
    :param input_html_file: Path to the input HTML file.
    """
    input_path = Path(input_html_file)
    output_path = input_path.with_suffix('.yml')

    if not input_path.is_file():
        print(f"Error: File '{input_html_file}' not found.")
        return

    # Read HTML content
    with open(input_path, 'r', encoding='utf-8') as file:
        html_content = file.read()

    # Extract details and write YAML
    packages = extract_details_from_html(html_content,lifecycle)
    write_yaml(packages, output_path)

    print(f"YAML file generated: {output_path}")

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 3:
        print("Usage: python script.py <input_html_file> <lifecycle>")
    else:
        main(sys.argv[1],sys.argv[2])
