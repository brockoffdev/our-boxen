require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

# watch this package manager
Packagenpm {                        
  provider => 'npm',
  require  => Class['nodejs']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include nginx

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # node versions
  include nodejs::v0_10

  # default ruby versions

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar',
      'nvm',
      'git-flow',
      'httpie',

    ]:
  }

  #Refinery29 Development Specific Apps
  include virtualbox
  include vagrant
  include iterm2::stable
  include sublime_text
  sublime_text::package { 'Emmet':
    source => 'sergeche/emmet-sublime',
  }
  sublime_text::package { 'Alignment':
    source => 'wbond/sublime_alignment',
  }
  sublime_text::package { 'Dayle Rees Color Schemes':
    source => 'daylerees/colour-schemes',
  }
  sublime_text::package { 'Bracket Highligher':
    source => 'facelessuser/BracketHighlighter',
  }

  include dash
  include macvim
  include hipchat
  include github_for_mac
  include sequel_pro
  include skype
  include chrome
  include dropbox
  include diffmerge
  include phpstorm
  include coda2
  include firefox
  include shiftit
  include better_touch_tools
  include gitflow
  include lastpass
  include skitch
  include mou
  include wireshark
  include googledrive

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }
}
