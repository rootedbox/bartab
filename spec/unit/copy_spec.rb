require 'bartab/commands/copy'

RSpec.describe Bartab::Commands::Copy do
  it "executes `copy` command successfully" do
    output = StringIO.new
    description = nil
    source = nil
    destination = nil
    options = {}
    command = Bartab::Commands::Copy.new(description, source, destination, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
