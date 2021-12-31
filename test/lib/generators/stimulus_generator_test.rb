require "test_helper"
require "generators/stimulus/stimulus_generator"

class StimulusGeneratorTest < Rails::Generators::TestCase
 tests StimulusGenerator
 destination Rails.root.join("tmp/generators")
 setup :prepare_destination

 test 'should add thing controller file' do
  run_generator ['Thing']

  assert_file 'app/javascript/controllers/thing_controller.js'
 end

 test 'should add stimulusjs boilerplate' do
  run_generator ['Thing']
  assert_file "app/javascript/controllers/thing_controller.js" do |content|
   assert_match /Controller/, content
   assert_match /connect()/, content
   assert_match /@hotwired/, content
  end
 end

 test 'should generate actions' do
  run_generator ["toggle", "--actions", "toggle hide"]
  assert_file "app/javascript/controllers/toggle_controller.js" do |content|
   assert_match /toggle()/, content
   assert_match /hide()/, content
  end
 end
end
