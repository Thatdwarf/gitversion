class gitversion {
	
	file {'/etc/puppetlabs/facts':
		ensure => directory,
	}

	file { 'git.rb':
	ensure => present,
	
	path => '/etc/puppetlabs/facts/git.rb',
	source => 'puppet:///modules/gitversion/git.rb',
#	require => File["/etc/puppetlabs/facts"],	
	}

	file { '/etc/environment':
		content => inline_template('FACTERLIB="/etc/puppetlabs/facts/"'),
	}

	exec { 'source' :
		command => 'source /etc/environment',
		user => root,
		path => ['/usr/bin', '/bin'],

	}

	#file { 'shell.sh':
	#ensure => present,
	#path => '/etc/puppetlabs/facts/shell.sh',
	#source => 'puppet:///modules/gitversion/shell.sh',
	#}

	#exec { 'chmod' :
	#	command => 'chmod +x /etc/puppetlabs/facts/shell.sh',
	#	user => root,
	#	path => ['/usr/bin', '/bin'],
	#	require => [File["git.rb"], File["shell.sh"] ]
	#}

	#exec { 'export' :
	#	command => '/etc/puppetlabs/facts/shell.sh',
	#	user => root,
	#}
}
