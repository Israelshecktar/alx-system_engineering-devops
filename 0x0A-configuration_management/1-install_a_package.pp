# This manifest installs Flask 2.1.0 using pip3.
package { 'flask':
  ensure   => '2.1.0', # Specify the version of the package.
  provider => 'pip3',  # Specify the provider to use pip3 for Python 3.
}
