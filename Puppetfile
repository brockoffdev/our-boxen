# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.6.1"

# Support for default hiera data in modules

github "module-data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",               "1.0.1"
github "foreman",               "1.2.0"
github "gcc",                   "2.0.101"
github "git",                   "2.4.0"
github "go",                    "1.1.0"
github "homebrew",              "1.9.4"
github "hub",                   "1.3.0"
github "inifile",               "1.0.3", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",                 "1.4.3"
github "nodejs",                "3.7.0"
github "openssl",               "1.0.0"
github "phantomjs",             "2.3.0"
github "pkgconfig",             "1.0.0"
github "repository",            "2.3.0"
# github "ruby",                  "8.0.4"
github "stdlib",                "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",                  "1.0.0"
github "xquartz",               "1.1.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

# NOTE:  REPOSITORIES MARKED WITH TWO HASHES ARE CURRENTLY BEING DISTRIBUTED THROUGH 
# CASPER, AND WILL NOT BE UPDATED/CONFIGURED VIA BOXEN.  PLEASE CONTACT IT FOR MORE INFO.  

# github "virtualbox",            "1.0.12"
github "vagrant",               "3.1.1"
## github "iterm2",                "1.1.2"
github "sublime_text",          "1.0.1"
## github "dash",                  "1.0.0"
## github "macvim",                "1.0.0"
## github "hipchat",               "1.1.3"
## github "github_for_mac",        "1.0.3"
## github "sequel_pro",            "1.0.1"
## github "skype",                 "1.0.8"
## github "chrome",                "1.1.2"
## github "dropbox",               "1.2.0"
## github "diffmerge",             "1.1.0", :repo => "brockoffdev/puppet-diffmerge"
## github "phpstorm",              "1.0.4"
## github "coda2",                 "1.0.1", :repo => "brockoffdev/puppet-coda2" 
## github "firefox",               "1.2.1"
## github "shiftit",               "0.0.2"
## github "better_touch_tools",    "2.0.0"
github "gitflow",               "1.0.0", :repo => "brockoffdev/puppet-gitflow"
## github "lastpass",              "1.0.2", :repo => "brockoffdev/puppet-lastpass"
## github "skitch",                "1.0.2"
## github "mou",                   "1.1"
github "wireshark",             "1.0.0", :repo => "brockoffdev/puppet-wireshark"
## github "googledrive",		    "1.0.2"
