# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'motion-env'

  app.ENV['hash'] = {herp: "derp"}
  app.env['string'] = "Sup dog"
  app.env["int"] = 3
  app.env["bool"] = false
  app.env["array"] = [1,2,3]
  app.env["complex"] = [{hello: "world", array: [1,2,3]}, {something: :else}]

  class Person
    attr_accessor :name, :age

    def initialize(name, age)
      @name = name
      @age = age
    end
  end

  app.env["object"] = Person.new("clay", 3)
end
