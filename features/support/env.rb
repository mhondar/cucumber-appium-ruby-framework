require 'rubygems'
require "appium_lib"
require 'report_builder'
require 'time'
require 'csv'
require 'json'
require 'yaml'
require 'fileutils'
require 'base64'
require 'aws-sdk-s3'
require './features/support/tools.rb'
require './features/support/log.rb'

def caps
{ caps: {
    deviceName: "TabletAutoAtencion_API_24_2",
    platformName: "Android",
    app: (File.join(File.dirname(__FILE__), "app-tablet-automatizar.apk")),
    platformVersion:"7.0",
    autoGrantPermissions: true,
    newCommandTimeout: "3600",
    # appPackage: "cl.ripley.autoatencion",
    # appWaitPackage: "cl.ripley.autoatencion",
    #appWaitActivity: "cl.ripley.autoatencion.MainActivity"
    # appWaitActivity:"cl.ripley.autoatencion.view.activity.Config"
}}
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object

