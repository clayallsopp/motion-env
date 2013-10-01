class Person
  attr_accessor :name, :age
end

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    puts ENV['hello world']

    expected = [
      ['string', "Sup dog"],
      ['int', 3],
      ['bool', false],
      ['hash', {:herp=>"derp"}],
      ['array', [1,2,3]],
      ['complex', [{:hello=>"world", :array=>[1, 2, 3]}, {:something=>:else}]]
    ]

    expected.each do |key, value|
      real_value = ENV[key]
      raise "Incorrect! Key: #{key} Expected: #{value} Actual: #{real_value}" if value != real_value
    end

    person = ENV['object']
    raise "Incorrect object unmarshal" if !person.is_a?(Person) || person.name != 'clay' || person.age != 3

    true
  end
end
