var exec = require('cordova/exec');

var IOSDeviceCheck = {
    generateToken: function (success, error) {
        exec(success, error, "IOSDeviceCheck", "generateToken", []);
    }
}

module.exports = IOSDeviceCheck;
