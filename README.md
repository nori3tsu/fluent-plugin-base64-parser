# Fluent::Plugin::Base64::Parser

Fluentd plugin to suppor Base64 format for parsing logs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fluent-plugin-base64-parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fluent-plugin-base64-parser

## Configuration

You can use it wherever you used the format parameter to parse texts. In the following example, it encode logs to base64.

```
<source>
  type tail
  path /path/to/log
  format base64
  base64_encode true
  tag base64_log
</source>
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/fluent-plugin-base64-parser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
