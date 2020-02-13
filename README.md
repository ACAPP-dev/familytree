# Domain Search Using GoDaddy API

This Ruby Gem will search [godaddy.com](https://godaddy.com) for website domain availability and pricing using the GoDaddy Developer API.  You can search for a specific domain name or get a list of domains related to any keyword.  If you search for a specific domain and it is not available for purchase, a list of similar domain names will automatically appear.

Please see the following link to see an overview of the program on YouTube: https://youtu.be/sNQJ21qADlw

My blog also talks about this project here: https://acapp-dev.github.io/finishing_my_first_class_ruby_cli_project

Note that you cannot make purchases from this Gem, but you can purchase available domains directly on [godaddy.com](https://godaddy.com).

## Installation

Download the code for this project using:

    $ git clone https://github.com/ACAPP-dev/domain_project.git

This Gem uses HTTParty for the API interface.  Please install this Gem prior to running the Domain Search Gem. Install using:

    $ gem install httparty

Next be sure to run:

    $ bundle install

Finally, you can start the program using:

    $ bin/domain_search

You can use this Domain Project Gem to see examples of how the GoDaddy API works.  Getting the API to work properly was the most challenging part of the project.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'acapp909'/domain_project. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

Written by **Andrew Capp** in conjunction with _Flatiron Academy_ - November 2019

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DomainProject project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'acapp909'/domain_project/blob/master/CODE_OF_CONDUCT.md).