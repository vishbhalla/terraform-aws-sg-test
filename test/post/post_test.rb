title "Post deployment tests"

describe aws_security_group(group_name: 'vish-sg-1') do
  it { should exist }
end

describe aws_security_group(group_name: 'vish-sg-1') do
  it { should allow_in(port: 111, ipv4_range: '1.1.1.3/32') }
end
