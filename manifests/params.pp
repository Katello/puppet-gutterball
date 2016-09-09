# Gutterball Params
class gutterball::params {
  $amqp_broker_host = 'localhost'
  $amqp_broker_port = '5671'

  $gutterball_conf_file = '/etc/gutterball/gutterball.conf'
  $dbname = 'gutterball'
  $dbuser = 'gutterball'
  $dbpassword = 'gutterball'
  $keystore_file = '/etc/gutterball/certs/amqp/gutterball.jks'
  $keystore_password = undef
  $truststore_file = '/etc/gutterball/certs/amqp/gutterball.truststore'
  $truststore_password = undef

  $tomcat = $::osfamily ? {
    /^(RedHat|Linux)/ => $::operatingsystem ? {
      'Fedora'  => 'tomcat',
      default   => $::operatingsystemrelease ? {
        /^7\./  => 'tomcat',
        default => 'tomcat6'
      }
    }
  }
}
