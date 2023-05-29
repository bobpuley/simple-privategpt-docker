#!/bin/sh

# Check if the source documents folder argument is provided
if [ $# -lt 2 ]; then
    echo "ERROR: Please provide the path to the folder containing the source documents and the model folder."
    echo "Usage: ./rundocker.sh /path/to/source_documents /path/to/model_folder"
    exit 1
fi

# Get the absolute path of the source documents folder and model folder
source_documents_folder=$(realpath "$1")
model_folder=$(realpath "$2")

# Check if the model file exists in the model folder
model_file="$model_folder/ggml-gpt4all-j-v1.3-groovy.bin"
if [ ! -f "$model_file" ]; then
    echo "Model file not found in the model folder. Downloading..."
    # Download the model file using curl
    curl -o "$model_file" "https://gpt4all.io/models/ggml-gpt4all-j-v1.3-groovy.bin"
fi

# Run the Docker container interactively with the mounted source documents and model folders
docker run -it -v "$source_documents_folder:/app/source_documents" -v "$model_folder:/app/models" my-private-gpt /bin/bash -c "python3 ingest.py && python3 privateGPT.py"
