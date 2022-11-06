function auth(cred) {
var info = cred.username + ':' + cred.password;
var base64 = Java.type('java.util.Base64');
var enCodedStr = base64.getEncoder().enCodeToString(info.bytes );
return 'Basic ' + enCodedStr;
};