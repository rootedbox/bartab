require 'bartab/commands/install'

RSpec.describe Bartab::Commands::Install do
  it "executes `install` command successfully" do
    output = StringIO.new
    options = {}
    command = Bartab::Commands::Install.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
