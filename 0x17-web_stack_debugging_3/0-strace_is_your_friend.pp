# This puppet manuscript replaces a line in a file on a server
$file_to_edit = '/var/www/html/wp-settings.php'

# Replace line containing "php" with "php"
exec { 'replace_line_in_file':
  command => 'sed -i "s/php/php/g" ${file_to_edit}',
  path    => ['/bin','/usr/bin']
}
