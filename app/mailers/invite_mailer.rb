class InviteMailer < ApplicationMailer
  default from: 'idkwdywmailer@gmail.com'
  layout 'mailer'
  def new_user_invite(invite, token)
    @token= token
    @invite = invite
    mail(to: @invite.email, subject: 'New Invite from IDKWDYW')
  end

  def notification_email(user, invite)
    @user = user
    @invite = invite
    mail(to: @user.email, subject: 'New Invite from IDKWDYW')
  end
end
