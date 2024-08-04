class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere

  routing /support@example.com/i => :support

  routing RepliesMailbox::MATCHER => :replies

end
