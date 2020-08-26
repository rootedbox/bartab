require 'bartab/commands/chmod'

RSpec.describe Bartab::Commands::Chmod do
  it "executes `chmod` command successfully" do
    output = StringIO.new
    description = nil
    file = nil
    permissions = nil
    options = {}
    command = Bartab::Commands::Chmod.new(description, file, permissions, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
