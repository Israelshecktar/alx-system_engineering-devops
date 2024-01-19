# File: 1-install_a_package.pp
# This manifest installs Flask 2.0.2 and Werkzeug 2.2.2 using pip3.

package { 'Flask':
 ensure  => '2.0.2', # Specify the version of the package.
 provider => 'pip3', # Specify the provider to use pip3 for Python 3.
 require => Package['python3-pip'], # Ensure pip3 is installed before trying to install Flask.
}

package { 'Werkzeug':
 ensure  => '2.2.2', # Specify the version of the package.
 provider => 'pip3', # Specify the provider to use pip3 for Python 3.
 require => Package['python3-pip'], # Ensure pip3 is installed before trying to install Werkzeug.
}
