# Preview all emails at http://localhost:3000/rails/mailers/note
class NotePreview < ActionMailer::Preview
  def note
    user = User.first
    note = user.notes.first
    NoteMailer.note(note, user)#.deliver_later(wait_until: note.send_time)
  end
end