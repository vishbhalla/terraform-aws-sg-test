title "Post deployment tests"

describe aws_security_group(group_name: 'security_group_prod') do
  it { should exist }
end

describe aws_security_group(group_name: 'security_group_prod') do
  it { should allow_in(port: 111, ipv4_range: '1.1.1.1/32') }
end
