FROM node:15

# Create app directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY . ./

# Install dependencies
RUN npm install

# Run the app
CMD [ "ls" ]
