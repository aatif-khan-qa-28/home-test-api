function fn() {
  var env = karate.env;
  if (!env) {
    env = "dev";
  }
  var config = {
    env: env,
    baseUrl: "http://localhost:3100/api",
  };
  if (env == "dev") {
  } else if (env == "e2e") {
  }
  return config;
}
