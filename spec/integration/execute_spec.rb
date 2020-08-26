RSpec.describe "`bartab execute` command", type: :cli do
  it "executes `bartab help execute` command successfully" do
    output = `bartab help execute`
    expected_output = <<-OUT
Usage:
  bartab execute DESCRIPTION COMMAND

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
