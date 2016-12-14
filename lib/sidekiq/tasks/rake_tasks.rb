# frozen_string_literal: true
namespace :sidekiq do
  Dir[File.join(Rails.root, %w(app workers *_worker.rb))].each do |file_path|
    require file_path
    task_name = File.basename(file_path).gsub(/\_worker.rb$/, '')

    klazz = [task_name, 'worker'].join('_').camelize.constantize
    task_args = klazz.expected_arg_names.map(&:to_sym)
    desc task_name.tr('_', ' ').capitalize
    task task_name.to_sym, task_args => :environment do |_t, args|
      klazz.new.perform(args.to_hash.stringify_keys)
    end
  end
end
