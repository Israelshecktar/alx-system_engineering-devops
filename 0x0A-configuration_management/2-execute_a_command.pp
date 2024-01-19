# This manifest executes the pkill command to terminate the 'killmenow' process.

exec { 'killmenow':
 command    => '/usr/bin/pkill -f killmenow',
 refreshonly => true,
}
