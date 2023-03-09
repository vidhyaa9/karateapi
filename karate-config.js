function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
	apiUrl: 'https://conduit.productionready.io/api/',
    
  }
  if (env == 'dev') {
	config.email = "vid@karate.com"
	config.password = "karate123"
    
  } else if (env == 'qa') {
    // customize
  }
  
  var accessToken = karate.callSingle('classpath:features/createToken.feature', config).authToken
  karate.configure('headers', {Authorization: 'Token ' + accessToken})
  return config;
}