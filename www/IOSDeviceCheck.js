var exec = require('cordova/exec');

exports.generateToken = function(success, error) {
    exec(success, error, "NativeGeocoder", "reverseGeocode", []);
};
