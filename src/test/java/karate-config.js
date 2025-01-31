function fn() {
  var config = {};

  if (karate.env == 'docker') {
    config.baseUrl = 'http://demo-app:3100/api';
  } else {
    config.baseUrl = 'http://localhost:3100/api';
  }

  // Return the configuration object
  return config;
}
