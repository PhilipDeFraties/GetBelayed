# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

require 'graphql/rake_task'

Rails.application.load_tasks

# Now you can use rails graphql:schema:dump to generate a graphql and json representation of your schema, schema.graphql and schema.json in the root of you rails project by default
GraphQL::RakeTask.new(
  schema_name: 'GetBelayedSchema' # this needs to be your generated schema class name
)
