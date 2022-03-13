import DeviceCheck


@objc(IOSDeviceCheck) class IOSDeviceCheck : CDVPlugin {
    let curDevice = DCDevice.current

    // MARK: - REVERSE GEOCODE
    @objc(generateToken:) func generateToken(_ command: CDVInvokedUrlCommand) {
        var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)

         if (true) {
             let result = 'generatedToken'
             pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: result)
         }
         else {
             pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Expected a non-empty string argument.")
         }
        self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
    }
}
