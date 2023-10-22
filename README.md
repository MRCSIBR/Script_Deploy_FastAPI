## Crear un docker para deploy de FastAPI

1. **Crear entorno virtual**

 `$python3 -m venv (nombre_entorno)`

   Activar el entorno virtual

   `$source (nombre_entorno)/bin/activate`

   Entrar al directorio creado   
    
    `$touch .gitignore`

1. **Create a FastAPI App:**
   - First, make sure you have your FastAPI application code ready. If not, create your FastAPI app, including all the necessary routes, models, and dependencies.

2. **Install Dependencies:**
   - Ensure you have FastAPI and Uvicorn installed in your Python environment. You can install them using pip:

   ```bash
   pip install fastapi uvicorn
   ```

3. **Create a `main.py` File:**

   - Create a Python file (e.g., `main.py`) that will serve as the entry point to your FastAPI application. In this file, you'll import your FastAPI app instance and define your routes. Here's a sample `main.py`:

   ```python
   from fastapi import FastAPI

   app = FastAPI()

   @app.get("/")
   def read_root():
       return {"message": "Hello, FastAPI!"}
   ```

5. **Generate a `requirements.txt` File:**

    - To generate a `requirements.txt` file that lists your project's dependencies, you can use the `pip freeze` command. Run this command in your project directory:

   ```bash
   pip freeze > requirements.txt
   ```

   This will create a `requirements.txt` file with a list of your project's Python dependencies.

7. **Install Docker:**

   - Install Docker on your system if you haven't already. You can download Docker Desktop for Windows or macOS, or install Docker Engine on Linux.

9. **Create a `Dockerfile`:**

   - Create a `Dockerfile` in the same directory as your FastAPI app code. The `Dockerfile` defines how your application will be containerized. Here's a basic example:

   ```Dockerfile
   # Use an official Python runtime as a parent image
   FROM python:3.9-slim

   # Set the working directory in the container
   WORKDIR /app

   # Copy the current directory contents into the container at /app
   COPY . /app

   # Install any needed packages specified in requirements.txt
   RUN pip install -r requirements.txt

   # Make port 80 available to the world outside this container
   EXPOSE 80

   # Define environment variable
   ENV NAME World

   # Run the FastAPI application with Uvicorn when the container launches
   CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
   ```

   Ensure you have a `requirements.txt` file listing your Python dependencies alongside the `Dockerfile`.

11. **Build the Docker Image:**
   - In the same directory as your `Dockerfile`, run the following command to build the Docker image:

   ```bash
   docker build -t my-fastapi-app .
   ```

   Replace `my-fastapi-app` with your desired image name.

11. **Run the Docker Container:**
   - Once the image is built, you can run it as a Docker container:

   ```bash
   docker run -p 80:80 my-fastapi-app
   ```

   This command maps port 80 in the container to port 80 on your host machine. Adjust the ports as needed.

9. **Access Your FastAPI App:**
   - Your FastAPI app should now be running inside a Docker container. You can access it by opening a web browser or making HTTP requests to `http://localhost` (or your server's IP address) on port 80.

These steps include generating a `requirements.txt` file using `pip freeze` and provide a sample `main.py` code for your FastAPI application. Make sure to replace the sample code in `main.py` with your actual FastAPI application code.


## Automatizar con Bash Script

Podemos crear un script bash para automatizar el proceso de construir y correr tu aplicación FastAPI usando Docker. Aqui hay un script basico que encapsula los pasos anteriores:

```bash
#!/bin/bash

# Step 1: Build Docker image
echo "Step 1: Building Docker image..."
docker build -t my-fastapi-app .

# Step 2: Run Docker container
echo "Step 2: Running Docker container..."
docker run -d -p 80:80 my-fastapi-app

# Step 3: Access your FastAPI app
echo "Step 3: Access your FastAPI app at http://localhost:80"
```

Save this script as, for example, `deploy.sh`, and make it executable by running `chmod +x deploy.sh` in your terminal.

Now, you can simply run `./deploy.sh` in your project directory to build and run your FastAPI application inside a Docker container. The script will also provide you with the URL to access your application.

Feel free to customize the script further to suit your specific needs, such as adding error handling or additional commands for cleaning up containers and images.
