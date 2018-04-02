class NoteMailer < ApplicationMailer

  def note(note, user)
    @note = note
    mail(to: user.email, subject: 'Your notice!')
  end
end
