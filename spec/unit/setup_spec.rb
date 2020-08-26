require 'bartab/commands/setup'

RSpec.describe Bartab::Commands::Setup do
  it "executes `setup` command successfully" do
    output = StringIO.new
    bartab = nil
    options = {}
    command = Bartab::Commands::Setup.new(bartab, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
