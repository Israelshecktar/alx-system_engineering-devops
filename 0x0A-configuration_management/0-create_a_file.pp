# This manifest creates a file at /tmp/school with specified content, owner, group, and permissions.

file { '/tmp/school':
  ensure  => file,
  content => "I love Puppet\n", # Ensure there's a newline at the end of the file content
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0744', # The mode should be a string, not an unquoted number
}
