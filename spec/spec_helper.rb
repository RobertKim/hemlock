require 'hemlock/csv_to_flashcards'
require 'hemlock/turn'
require 'thor'
require 'stringio'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end

def capture_stdout &block
  old_stdout = $stdout
  fake_stdout = StringIO.new
  $stdout = fake_stdout
  block.call
  fake_stdout.string
ensure
  $stdout = old_stdout
end
