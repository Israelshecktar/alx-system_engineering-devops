# This manifest installs Flask 2.1.0 using pip3.

package { 'Flask':
  ensure   => '2.1.0', # Specify the version of the package.
  provider => 'pip3',  # Specify the provider to use pip3 for Python 3.
  require  => Package['python3-pip'], # Ensure pip3 is installed before trying to install Flask.
}

# Ensure pip3 is available on the system.
package { 'python3-pip':
  ensure => installed,
}
