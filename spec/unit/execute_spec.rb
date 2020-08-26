require 'bartab/commands/execute'

RSpec.describe Bartab::Commands::Execute do
  it "executes `execute` command successfully" do
    output = StringIO.new
    description = nil
    command = nil
    options = {}
    command = Bartab::Commands::Execute.new(description, command, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
