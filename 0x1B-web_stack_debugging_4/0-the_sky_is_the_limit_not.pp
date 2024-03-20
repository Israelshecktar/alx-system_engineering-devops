# Define a class to manage Nginx configuration
exec { 'fix--for-nginx':
  command => '/bin/sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/',
}

# Define the service resource to manage Nginx service
exec { 'nginx-restart':
  command => '/etc/init.d/nginx restart',
  path    => '/etc/init.d/',
}
