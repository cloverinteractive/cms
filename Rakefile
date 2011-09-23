# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

Clover::Application.load_tasks

begin
  require 'metric_fu'

  MetricFu::Configuration.run do |config|
    config.metrics  = [:churn, :saikuro, :stats, :flog, :flay]
    config.graphs   = [:flog, :flay, :stats]
    config.rcov[:test_files] = ['spec/**/*_spec.rb']
    config.rcov[:rcov_opts] << '-Ispec'
  end
rescue LoadError
  puts "No metric_fu available"
end
