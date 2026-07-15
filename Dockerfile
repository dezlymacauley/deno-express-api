# This sets the base image to use for the Docker container
FROM dhi.io/deno:2-debian-dev

# This will create a directory called `app` at the root 
# of the Docker container, and set the `app` directory as the WORKDIR of
# the container.
# After setting this line, you can refer to the WORKDIR using `./`
WORKDIR /app

# Copy the these three files from this directory, into the Docker container
COPY deno.json deno.lock package.json ./

# https://docs.deno.com/runtime/reference/cli/ci/
# Uses Deno to perform a reproducible install for CI environments
RUN deno ci

# Copy the source code from this directory into the Docker container
COPY src/main.ts ./src/main.ts

# This line does not perform any actions. It is documentation for the user
# of this Dockerfile. 
# It tells the user what ports the application requires to function.
EXPOSE 3000

# Reset the entry point command. Sometimes a base image will set something
# and it will cause CMD to fail. Setting ENTRYPOINT to an empty arrow will
# help eliminate hidden control flow and reduce bugs when trying to create
# a container instance from an image created from this Dockerfile
ENTRYPOINT []

# Run the `start` task from deno.json to start the API
CMD [ "deno", "task", "start" ]
