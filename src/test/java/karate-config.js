function fn() {
  var config = {};

  if (karate.env == 'docker') {
    // Set the base URL for the "docker" environment
    config.baseUrl = 'http://demo-app:3100/api';
  } else {
    // Default to localhost if not in "docker" environment
    config.baseUrl = 'http://localhost:3100/api';
  }

  // Return the configuration object
  return config;
}
