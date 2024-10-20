import os


def create_description_file(root_dir):
    # Walk through the directory tree
    for dirpath, dirnames, filenames in os.walk(root_dir):
        # Get the current directory name (without the full path)
        current_dir_name = os.path.basename(dirpath)
        
        # Define the file path for the description.txt file
        description_file_path = os.path.join(dirpath, 'doc.txt')
        
        # Prepare the content for the description file
        content = (
            f"{current_dir_name}\n"
            "description:\n"
            "dev comments:"
        )
        
        # Write the content to the description.txt file
        with open(description_file_path, 'w') as f:
            f.write(content)

        print(f"Created {description_file_path}")
        
def remove_description_files(root_dir):
    # Walk through the directory tree
    for dirpath, dirnames, filenames in os.walk(root_dir):
        for filename in filenames:
            # Check if the file is named 'description.txt'
            if filename == 'doc.txt':
                # Construct the full path to the file
                file_path = os.path.join(dirpath, filename)
                try:
                    # Remove the file
                    os.remove(file_path)
                    print(f"Removed {file_path}")
                except Exception as e:
                    print(f"Error removing {file_path}: {e}")
        
        
# remove_description_files("../")
# create_description_file("../")
    
