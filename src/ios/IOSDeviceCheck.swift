import DeviceCheck


@objc(IOSDeviceCheck) class IOSDeviceCheck : CDVPlugin {

    // MARK: - REVERSE GEOCODE
    @objc(generateToken:) func generateToken(_ command: CDVInvokedUrlCommand) {
        var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)

        let curDevice = DCDevice.current

        var deviceToken = ""

        if curDevice.isSupported {
            DCDevice.current.generateToken { (data, error) in
                if let data = data {
                    deviceToken = data.base64EncodedString()
                    pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: deviceToken)
                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                }

                if let error = error {
                    print(error.localizedDescription)
                    pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "")
                    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
                }
            }
        } else {
            print("Platform is not supported. Make sure you aren't running in an emulator.")
            pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "")
            self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
        }
    }
}
