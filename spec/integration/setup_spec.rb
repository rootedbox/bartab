RSpec.describe "`bartab setup` command", type: :cli do
  it "executes `bartab help setup` command successfully" do
    output = `bartab help setup`
    expected_output = <<-OUT
Usage:
  bartab setup

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
