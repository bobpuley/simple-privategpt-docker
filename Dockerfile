# Use the latest Python runtime as a parent image
FROM python:3.11.3-bullseye

# Install build-essential and git
RUN apt-get update && apt-get install -y build-essential git

# Upgrade pip
RUN pip install --upgrade pip

# Set the working directory in the container to /app
WORKDIR /app

# Define environment variables with default values
# MODEL_TYPE: supports LlamaCpp or GPT4All
ENV MODEL_TYPE=GPT4All
# PERSIST_DIRECTORY: is the folder you want your vectorstore in
ENV PERSIST_DIRECTORY=db
# MODEL_PATH: Path to your GPT4All or LlamaCpp supported LLM
ARG MODEL_PATH=models/ggml-gpt4all-j-v1.3-groovy.bin
ENV MODEL_N_CTX=2048
# EMBEDDINGS_MODEL_NAME: SentenceTransformers embeddings model name
ENV EMBEDDINGS_MODEL_NAME=all-MiniLM-L6-v2
# TARGET_SOURCE_CHUNKS: The amount of chunks (sources) that will be used to answer a question
ENV TARGET_SOURCE_CHUNKS=2

# Clone the privateGPT repository and unpack it
RUN git clone https://github.com/imartinez/privateGPT.git && \
    mv privateGPT/* ./ && \
    rm -rf privateGPT

# Create the "models" and "db" folders if they don't exist
RUN mkdir -p models && \
    mkdir -p db

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Update the example.env file and rename it to .env
RUN sed -i "s|MODEL_TYPE=.*|MODEL_TYPE=${MODEL_TYPE}|" example.env && \
    sed -i "s|PERSIST_DIRECTORY=.*|PERSIST_DIRECTORY=${PERSIST_DIRECTORY}|" example.env && \
    sed -i "s|MODEL_PATH=.*|MODEL_PATH=${MODEL_PATH}|" example.env && \
    sed -i "s|MODEL_N_CTX=.*|MODEL_N_CTX=${MODEL_N_CTX}|" example.env && \
    sed -i "s|EMBEDDINGS_MODEL_NAME=.*|EMBEDDINGS_MODEL_NAME=${EMBEDDINGS_MODEL_NAME}|" example.env && \
    sed -i "s|TARGET_SOURCE_CHUNKS=.*|TARGET_SOURCE_CHUNKS=${TARGET_SOURCE_CHUNKS}|" example.env && \
    mv example.env .env && \
    rm source_documents/*