
$as_vagrant   = 'sudo -u vagrant -H bash -l -c'

Exec {
  path => ['/usr/sbin', '/usr/bin', '/sbin', '/bin']
}

# --- Packages -----------------------------------------------------------------

package { 'git':
  ensure => latest
}

package { 'make':
  ensure => installed
}

# --- Node/NPM -----------------------------------------------------------------

package { 'npm':
  ensure => latest
}

exec { "install_deps":
	command => "npm install",
	cwd => "/vagrant",
	logoutput => true,
	require => Package['npm'],
	timeout => 900 # Can take a while to download everything
}