# install and configure fpm for the building of RPMS
class packagebuild {

  $ruby_pkgs = [ 'ruby1.9.1-dev', 'ruby1.9.1', 'rubygems' ]

  package { $ruby_pkgs:
    ensure => latest,
  }

  package { 'fpm':
    ensure   => latest,
    provider => gem,
    require  => Package[$ruby_pkgs],
  }

  $build_utils = [ 'build-essential', 'libpcre3-dev', 'unzip', 'libxml2-dev', 'libxslt1-dev', 'libgd2-xpm-dev', 'libgeoip-dev' ]

  package { $build_utils:
    ensure  => latest,
    require => Package['fpm'],
  }

}
