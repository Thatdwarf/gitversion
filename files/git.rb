Facter.add('git') do
  setcode do
    Facter::Core::Execution.exec('/usr/bin/git --version')
  end
end
