# 100-puppet_ssh_config.pp

class ssh_client_config {
  file_line { 'Declare identity file':
    path => '/etc/ssh/ssh_config',
    line => 'IdentityFile ~/.ssh/school',
    match => '^IdentityFile',
    replace => true,
  }

  file_line { 'Turn off passwd auth':
    path => '/etc/ssh/ssh_config',
    line => 'PasswordAuthentication no',
    match => '^PasswordAuthentication',
    replace => true,
  }
}

include ssh_client_config
