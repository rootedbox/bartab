RSpec.describe "`bartab install` command", type: :cli do
  it "executes `bartab help install` command successfully" do
    output = `bartab help install`
    expected_output = <<-OUT
Usage:
  bartab install

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
