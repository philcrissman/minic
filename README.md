# Minic

Minic is a C compiler written in Ruby, based off the book [Writing A C Compiler](https://nostarch.com/writing-c-compiler) by [Nora Sandler](https://norasandler.com/)

### Warning

The book starts with very simple C programs, and progressively adds language features. Depending when you come across this gem, you may find it can't compile very much. At the time of writing this, I'm working through the second chapter; the only program this can _really_ successfully compile is:

```
int main(void) {
  return 2;
}
```

It's probably more interesting (maybe?) as a reference than to _actually_ compile C programs :-)

## Installation

I haven't pushed this to rubygems, yet.

If it _were_ in rubygems, you could install the gem and add to the application's Gemfile by executing:

    $ bundle add minic

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install minic

## Usage

The assembly generated is based on x86 assembly; if running on Apple Silicon, you'll need to open an x86 shell to use it:

`arch -x86_64 zsh`

Once installed and in an x64 shell, you can run against a C file with:

`minic hello.c`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/minic. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/philcrissman/minic/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Minic project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/minic/blob/main/CODE_OF_CONDUCT.md).
