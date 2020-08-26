RSpec.describe "`bartab download` command", type: :cli do
  it "executes `bartab help download` command successfully" do
    output = `bartab help download`
    expected_output = <<-OUT
Usage:
  bartab download DESCRIPTION SOURCE DESTINATION

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
