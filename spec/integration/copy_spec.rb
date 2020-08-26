RSpec.describe "`bartab copy` command", type: :cli do
  it "executes `bartab help copy` command successfully" do
    output = `bartab help copy`
    expected_output = <<-OUT
Usage:
  bartab copy DESCRIPTION SOURCE DESTINATION

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
