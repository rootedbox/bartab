require 'bartab/commands/download'

RSpec.describe Bartab::Commands::Download do
  it "executes `download` command successfully" do
    output = StringIO.new
    description = nil
    source = nil
    destination = nil
    options = {}
    command = Bartab::Commands::Download.new(description, source, destination, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
