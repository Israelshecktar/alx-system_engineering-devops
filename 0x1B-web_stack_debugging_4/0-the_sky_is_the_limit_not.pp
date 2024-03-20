# Define a class to manage Nginx configuration
class nginx_config {
  # Set the desired ULIMIT value
  $ulimit_value = 4096

  # Define the file resource to manage /etc/default/nginx
  file { '/etc/default/nginx':
    ensure  => 'file',
    content => "ULIMIT=\"-n ${ulimit_value}\"\n",
    notify  => Service['nginx'],
  }

  # Define the service resource to manage Nginx service
  service { 'nginx':
    ensure => 'running',
    enable => true,
  }
}

# Apply the nginx_config class
include nginx_config
