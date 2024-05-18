FROM node:18-buster

# we move to the app folder and run the pip install command
WORKDIR /app

# we copy just the requirements.txt first to leverage Docker cache
COPY . /app

# Install pip requirements + git
RUN npm install

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
RUN adduser -u 5574 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# We run the application
CMD ["node", "register.js", "&&", "node", "index.js"]
