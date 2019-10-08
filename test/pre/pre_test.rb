title "Pre deployment tests"

#describe aws_vpc(vpc_id: 'vpc-12def674') do
describe aws_vpc(vpc_id: 'vpc-12def67') do
  it { should exist }
end
