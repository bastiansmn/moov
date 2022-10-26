FROM node:15

# Create app directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY . ./

# Install dependencies
RUN npm install

RUN ls -la
RUN ls -la /app

# Run the app
CMD [ "node", "server.js" ]
