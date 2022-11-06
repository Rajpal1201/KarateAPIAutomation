function fn() {
    var env = karate.env; //get system property
    karate.log('karate.env system property was:', env);
    if(!env){
        env= 'dev';
    }
    var config = {
    env : env,
    myVarName: 'someValue',
    username: 'admin1',
    password: 'welcome',
    _url: 'https://jobapplicationjwt.herokuapp.com/'
    }
    if(env == 'dev'){
        //customize
        config.username = 'author';
        config.password = 'authorPassword';
        _url: 'https://jobapplicationjwt.herokuapp.com/';
    }
    else if(env == 'staging'){
        config.username = 'user';
        config.password = 'userPassword';
        _url: 'https://jobapplicationjwt.herokuapp.com/'
    }
    else if(env == 'preprod'){
        config.username = 'user';
        config.password = 'userPassword';
        _url: 'https://jobapplicationjwt.herokuapp.com/'
    }
    else if(env == 'prod'){
        config.username = 'user';
        config.password = 'userPassword';
        _url: 'https://jobapplicationjwt.herokuapp.com/'
    }
    return config;
}