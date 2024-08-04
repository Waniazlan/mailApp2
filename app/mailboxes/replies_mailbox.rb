class RepliesMailbox < ApplicationMailbox

  MATCHER = /support+(.+)@example.com/i
  def process

    
    return unless user.present?
    ticket.comments.create(user: user, body: mail.decoded)
  end

  def ticket 
    user.tickets.find_ticket_id
  end

  def ticket_id 
   recipient =  mail_recipients.find {|r| MATCHER.match?(r)}
    recipient[MATCHER,1]
  end


  

  
  def user
    @user ||= User.find_by email:mail.from
  end
end
