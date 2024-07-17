#!/bin/bash

# Loop through all .modelfile files in the current directory
for modelfile in *.modelfile; do
    # Extract the model name by removing the .modelfile extension
    model_name="${modelfile%.modelfile}"
    
    # Run the ollama create command
    echo "Creating model: $model_name"
    ollama create "$model_name" -f "$modelfile"
    
    # Check if the command was successful
    if [ $? -eq 0 ]; then
        echo "Successfully created model: $model_name"
    else
        echo "Failed to create model: $model_name"
    fi
    
    echo "------------------------"
done

echo "All models have been processed."