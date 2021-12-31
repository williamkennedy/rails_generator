class StimulusGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  class_option :actions, type: :array, default: []

  def create_stimulus_controller
    template 'stimulus_controller.js.erb', "app/javascript/controllers/#{file_path}_controller.js"
  end
end
