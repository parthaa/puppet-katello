# Katello Install
class katello::install {
  package { $katello::package_names:
    ensure => installed,
  }

  if $katello::enable_ostree {
    package { $katello::rubygem_katello_ostree:
      ensure => installed,
      notify => [Service['foreman-tasks', 'httpd'], Exec['foreman-rake-apipie:cache:index']],
    }
  }
}
