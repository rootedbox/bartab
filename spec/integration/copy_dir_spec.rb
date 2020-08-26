RSpec.describe "`bartab copy_dir` command", type: :cli do
  it "executes `bartab help copy_dir` command successfully" do
    output = `bartab help copy_dir`
    expected_output = <<-OUT
Usage:
  bartab copy_dir DESCRIPTION SOURCE DESTINATION

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
