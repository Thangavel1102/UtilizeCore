class UserMailer < ApplicationMailer
  default from: 'velthangavelcse@gmail.com'

  def status_email
    @parcel = params[:parcel]
    @sender = @parcel.sender
    @receiver = @parcel.receiver
    @url  = 'http://localhost:3000/search'
    mail(to: @receiver.email, cc: @sender.email,  subject: 'New Parcel Information')
  end

  def parcel_status_change
    @parcel = params[:parcel]
    @sender = @parcel.sender
    @receiver = @parcel.receiver
    @url  = 'http://localhost:3000/search'
    mail(to: @receiver.email, cc: @sender.email,  subject: 'Update Parcel Information')
  end
end
