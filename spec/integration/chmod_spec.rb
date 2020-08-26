RSpec.describe "`bartab chmod` command", type: :cli do
  it "executes `bartab help chmod` command successfully" do
    output = `bartab help chmod`
    expected_output = <<-OUT
Usage:
  bartab chmod DESCRIPTION FILE PERMISSIONS

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
