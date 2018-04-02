namespace :send_notes do
  desc "This task is called by the Heroku scheduler add-on"
  task send: :environment do
    puts "Start job mailer ..."

    Note.ready_for_schedulеd.includes(:user).each do |note|
      next if note.interval_count.zero?
      puts "* Note Mailer wait until: [#{note.next_time}]"

      NoteMailer.note(note, note.user).deliver_later(wait_until: note.next_time)

      note.update_next_time
    end

    puts "done."
  end
end
