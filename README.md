# motion-env

`gem install motion-env`

In your `Rakefile`:

```ruby
require 'motion-env'

Motion::Project::App.setup do |app|
  app.env['string'] = "Sup dog"
  app.env["int"] = 3
  app.env["bool"] = false
  app.env['hash'] = {herp: "derp"}
  app.env["array"] = [1,2,3]
  app.env["complex"] = [{hello: "world", array: [1,2,3]}, {something: :else}]
end
```

(`app.ENV` will also work, if you prefer symmetry)

In your app:

```irb
> ENV['string']
=> "Sup dog"
> ENV['int']
=> 3
> ENV['bool']
=> false
(main)> ENV['hash']
=> {:herp=>"derp"}
> ENV['array']
=> [1, 2, 3]
> ENV['complex']
=> [{:hello=>"world", :array=>[1, 2, 3]}, {:something=>:else}]
```

# How?

![wtf](http://i.imgur.com/e0nv2G9.gif)

motion-env takes whatever you put in `app.env` and `Marshal`'s the contents into `ENV` via code generation. At the same time, it swizzles `[](key)` to un-marshal the value (if appropriate). See [builder.rb](lib/motion-env/builder.rb) for implementation.

That means you can also Marshal POROs, assuming the class exists on both sides of the compilation:

```ruby
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

Motion::Project::App.setup do |app|
  app.env["object"] = Person.new("clay", 3)
end
```

```ruby
> ENV["object"] # assumes you have Person defined somewhere
=> #<Person:0x8e62da0 @name="clay" @age=3>
```

# Support

Big thanks to [motion-my_env](https://github.com/ainame/motion-my_env) and [@ainame](https://twitter.com/ainame) for the inspiration.

[Clay Allsopp](http://clayallsopp.com/)
- [clay@usepropeller.com](mailto:clay@usepropeller.com)
- [@clayallsopp](https://twitter.com/clayallsopp)