# Use Node.js LTS as the base image
FROM node:18

# Create app directory
WORKDIR /app

# Copy package manifests
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Build the React app
RUN npm run build

# Install 'serve' to serve the build folder
RUN npm install -g serve

# Expose port 3000 (you can change this if you like)
EXPOSE 3000

# Serve the build directory
CMD ["serve", "-s", "build", "-l", "3000"]
