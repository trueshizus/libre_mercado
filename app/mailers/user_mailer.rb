class UserMailer < ApplicationMailer
  def new_offer_email(buyer)
    @user = buyer
    mail(to: @user.email, subject: 'Tenes una nueva oferta!')
  end
end
