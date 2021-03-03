require 'bundler/setup'
require 'rubygems'
require 'rake'
require 'cucumber'
require 'cucumber/rake/task'
require 'parallel'
require 'fileutils'
require_relative '../AutoTestCats/features/support/run_methods'
require_relative '../AutoTestCats/features/support/run_data'

task :Test3 do |t|
  start_instance_appium("4723", "4710", "60d1ca4d0404")
  ENV["device"] = "Xiaomi_Redmi_Go"
  run_cucumber ('-t @test')
end