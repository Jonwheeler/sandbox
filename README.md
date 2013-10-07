# Sandbox CLI

CLI for building and destroying Linux VMs

### Dependencies
 - Terminal Helpers
 - Rest-Client

## Installation

Add this line to your application's Gemfile:

    gem 'sandbox'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sandbox

## Usage

To create a VM

```
$ sandbox create -n foo -m 1000
```

To destroy a VM

```
$ sandbox destroy -n foo
```

To get information and stats about a VM

```
$ sandbox info -n foo
```

### Options
```
  -n, --name                       Name of Sandbox Virtual Server
  -m, --memory                     Memory Requirement for Server (defaults to 512MB)
  -v, --version                    Show version
  -d, --debug                      Enable debugging ( needs implementing)
```

## Testing

```
  rspec spec/
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request



