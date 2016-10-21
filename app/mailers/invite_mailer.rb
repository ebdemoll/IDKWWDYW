class InviteMailer < ApplicationMailer
  def new_user_invite(invite, token)
    @token= token
    @invite = invite
    mail(to: @invite.email, subject: 'New Invite from IDKWDYW')
  end
end
