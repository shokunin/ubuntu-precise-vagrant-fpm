# install and configure fpm for the building of RPMS
class packagebuild {

  $ruby_pkgs = [ 'ruby1.9.1-dev', 'ruby1.9.1', 'rubygems', 'ruby-rvm' ]

  package { $ruby_pkgs:
    ensure => latest,
  }

  package { 'fpm':
    ensure   => latest,
    provider => gem,
    require  => Package[$ruby_pkgs],
  }

  package { 'bundler':
    ensure   => latest,
    provider => gem,
    require  => Package[$ruby_pkgs],
  }


  $build_utils = [ 'build-essential', 'libpcre3-dev', 'unzip', 'libxml2-dev', 'libxslt1-dev', 'libgd2-xpm-dev', 'libgeoip-dev', 'python-setuptools' ]

  package { $build_utils:
    ensure  => latest,
    require => Package['fpm'],
  }

  $java_pkgs = [ 'tzdata-java', 'openjdk-7-jre-headless', 'openjdk-7-jre', 'openjdk-7-jdk' ]

  package { $java_pkgs:
    ensure  => latest,
  }

}
