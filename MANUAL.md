Building the Docker Image
-------------------------

1.  Build the Docker image using the provided Dockerfile:\
    `docker build -t my-private-gpt .`

Running the Docker Container
----------------------------

1.  Create a folder containing the source documents that you want to parse with privateGPT.

2.  Make sure you have the model file `ggml-gpt4all-j-v1.3-groovy.bin` or provide a valid file for the `MODEL_PATH` environment variable.

3.  Run the Docker container using the built image, mounting the source documents folder and specifying the model folder as environment variables:


    `docker run -it\
      -v /path/to/source_documents:/app/source_documents\
      -v /path/to/model_folder:/app/models\
      -e MODEL_PATH=/app/models/ggml-gpt4all-j-v1.3-groovy.bin\
      my-private-gpt`

    Replace `/path/to/source_documents` with the absolute path to the folder containing the source documents, and `/path/to/model_folder` with the absolute path to the folder containing the model file.

    Note: If the model file is not present in the specified model folder, it will be downloaded automatically.

4.  Inside the container, you can perform the following actions:

    -   Execute the `ingest.py` script to ingest the source documents:\
        `python3 ingest.py`

    -   Execute the `privateGPT.py` script to perform analysis and generate responses based on the ingested documents:\
        `python3 privateGPT.py`

    -   Interact with the privateGPT chatbot:\
        Once the `privateGPT.py` script is running, you can interact with the privateGPT chatbot by providing queries and receiving responses.

5.  To exit the container, you can use the `exit` command.

Please adjust the paths and commands according to your specific setup and requirements.

Running the Docker Container with rundocker.sh
----------------------------------------------

The `run.sh` script provides a convenient way to run the Docker container for the privateGPT application. It requires the path to the folder containing the source documents and the model folder as mandatory parameters.

### Prerequisites

Make sure you have Docker installed on your system before using the `rundocker.sh` script. You can install Docker by following the official Docker documentation: [Get Docker](https://docs.docker.com/get-docker/).

### Usage

To run the Docker container using the `run.sh` script, follow these steps:

1.  Save the `run.sh` script to a desired location.

2.  Open a terminal and navigate to the directory where the `run.sh` script is located.

3.  Make the script executable by running the following command:


    `chmod +x run.sh`

4.  Run the script with the path to the folder containing the source documents and the model folder as parameters. For example:


    `./run.sh /path/to/source_documents /path/to/model_folder`

    Replace `/path/to/source_documents` with the absolute path to the folder containing the source documents, and `/path/to/model_folder` with the absolute path to the folder where you have or want to store the GPT4 model file.

    Note: Ensure that the source documents folder exists and contains the necessary files.

5.  The script will check if the model file exists in the model folder. If not, it will download the model file from the internet.

6.  The script will mount the source documents folder and the model folder inside the Docker container and execute the necessary commands to ingest the documents and start the privateGPT application.

7.  You can interact with the privateGPT chatbot by providing queries and receiving responses in the terminal.

8.  To exit the container and stop the application, use the `exit` command.

Please adjust the paths and commands according to your specific setup and requirements.

Remember to have the Docker container built using the provided Dockerfile and the privateGPT repository cloned and set up properly before running the `run.sh` script.
