# Use the official Node.js image as a base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install the dependencies for your project
RUN npm install

# Copy the rest of your project files into the container
COPY . .

# Expose the port that Mongo Express will run on
EXPOSE 8081

# Set the environment variable for MongoDB URI (you can override this later)
ENV ME_CONFIG_MONGODB_SERVER=mongo
ENV ME_CONFIG_MONGODB_PORT=27017
ENV ME_CONFIG_MONGODB_ADMINUSERNAME=admin
ENV ME_CONFIG_MONGODB_ADMINPASSWORD=password
ENV ME_CONFIG_MONGODB_AUTH_DATABASE=admin

# Start Mongo Express
CMD ["npm", "start"]
