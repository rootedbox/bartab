require 'bartab/commands/insert'

RSpec.describe Bartab::Commands::Insert do
  it "executes `insert` command successfully" do
    output = StringIO.new
    description = nil
    file = nil
    text = nil
    options = {}

    command = Bartab::Commands::Insert.new(description, file, text, options)

    allow_any_instance_of(Bartab::Commands::Insert).to receive(:create_file)
    allow_any_instance_of(Bartab::Commands::Insert).to receive(:line_exists?).and_return(true)
    expect_any_instance_of(Bartab::Commands::Insert).to receive(:success_spinner)

    command.execute(output: output)
  end

  it "executes `insert` command unsuccessfully" do
    output = StringIO.new
    description = nil
    file = nil
    text = nil
    options = {}

    command = Bartab::Commands::Insert.new(description, file, text, options)

    allow_any_instance_of(Bartab::Commands::Insert).to receive(:create_file)
    allow_any_instance_of(Bartab::Commands::Insert).to receive(:line_exists?).and_return(false)
    allow_any_instance_of(Bartab::Commands::Insert).to receive(:append_file).and_return(false)
    expect_any_instance_of(Bartab::Commands::Insert).to receive(:error_spinner)

    command.execute(output: output)
  end
end
