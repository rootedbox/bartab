require 'bartab/commands/copy_dir'

RSpec.describe Bartab::Commands::CopyDir do
  it "executes `copy_dir` command successfully" do
    output = StringIO.new
    description = nil
    source = nil
    destination = nil
    options = {}
    command = Bartab::Commands::CopyDir.new(description, source, destination, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
