Docker Image for privateGPT
===========================

This Docker image provides an environment to run the privateGPT application, which is a chatbot powered by GPT-3 for answering questions.

Features
--------

-   Uses the latest Python runtime.
-   Pre-installed dependencies specified in the `requirements.txt` file.
-   Supports customization through environment variables.
-   Automatic cloning and setup of the privateGPT repository.
-   Easy integration with source documents and model files through volume mounting.

Usage
-----

To use this Docker image, follow the steps below:

### Pull the Docker Image

Pull the latest version of the Docker image from DockerHub by running the following command:

`docker pull <image_name>:<tag>`

Replace `<image_name>` with the name of the Docker image and `<tag>` with the desired tag.

### Run the Docker Container

To run the Docker container, execute the following command:

`docker run -it -v /path/to/source_documents:/app/source_documents -v /path/to/model_folder:/app/models <image_name>:<tag>`

Replace `/path/to/source_documents` with the absolute path to the folder containing the source documents and `/path/to/model_folder` with the absolute path to the folder where the GPT4 model file is located. `<image_name>` and `<tag>` should match the name and tag of the Docker image you pulled.

### Configuration

The Docker image supports customization through environment variables. The following environment variables are available:

-   `MODEL_TYPE`: Specifies the model type (default: GPT4All).
-   `PERSIST_DIRECTORY`: Sets the folder for the vectorstore (default: db).
-   `MODEL_PATH`: Specifies the path to the GPT4 or LlamaCpp supported LLM model (default: models/ggml-gpt4all-j-v1.3-groovy.bin).
-   `MODEL_N_CTX`: Sets the maximum token limit for the LLM model (default: 2048).
-   `EMBEDDINGS_MODEL_NAME`: Specifies the SentenceTransformers embeddings model name (default: all-MiniLM-L6-v2).
-   `TARGET_SOURCE_CHUNKS`: Sets the number of chunks (sources) used to answer a question (default: 2).

To customize these environment variables, pass them as options to the `docker run` command. For example:

`docker run -it -e MODEL_TYPE=GPT4All -e PERSIST_DIRECTORY=db -e MODEL_PATH=models/ggml-gpt4all-j-v1.3-groovy.bin <image_name>:<tag>`

### Volume Mounting

The Docker container supports volume mounting for source documents and model files. Mount the source documents folder and the model folder to the appropriate locations inside the container using the `-v` option. For example:

`docker run -it -v /path/to/source_documents:/app/source_documents -v /path/to/model_folder:/app/models <image_name>:<tag>`

### Example Usage

Here's an example of how to run the Docker container with volume mounting and customized environment variables:

`docker run -it -v /path/to/source_documents:/app/source_documents -v /path/to/model_folder:/app/models -e MODEL_TYPE=GPT4All -e PERSIST_DIRECTORY=db <image_name>:<tag>`

More informations [here](MANUAL.md)

### Interactive Mode

When running the Docker container, you will be in an interactive mode where you can interact with the privateGPT chatbot. Enter your queries and receive responses directly in the terminal.

### Stopping the Container

To stop the container and exit the interactive mode, use the `exit` command.

Repository and Source Code
--------------------------

The Dockerfile and source code for this Docker image can be found in the GitHub repository:

[Link to GitHub Repository](https://github.com/your/repo)

Issues and Contributions
------------------------

If you encounter any issues or have suggestions for improvement, please create an issue in the GitHub repository.

License
-------

This Docker image and its associated source code are licensed under the [MIT License](https://opensource.org/licenses/MIT).

About the Author
----------------

This Docker image is maintained by [Your Name].