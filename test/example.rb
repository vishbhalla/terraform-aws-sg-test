title "basic tests"

describe aws_security_group(group_name: 'vish-sg-1') do
  it { should exist }
end
