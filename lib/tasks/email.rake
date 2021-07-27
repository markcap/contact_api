namespace :email do
  desc "Send today's submissions to dearabby email"
  task :send_to_dearabby => :environment do
    ARGV.each { |a| task a.to_sym do ; end }
    number_of_days = ARGV[2] ? ARGV[2].to_i : 1
    submissions = Letter.where("created_at > ?", number_of_days.days.ago)
    submissions.each_with_index do |submission, index|
      ApplicationMailer.dear_abby_submission(ARGV[1], submission, (index + 1)).deliver
    end
    puts "Sending #{submissions.size} submissions to #{ARGV[1] || '' }"
  end
  
  task :send_polls_to_dearabby => :environment do
    ARGV.each { |a| task a.to_sym do ; end }
    number_of_days = ARGV[2] ? ARGV[2].to_i : 1
    submissions = Poll.where("created_at > ?", number_of_days.days.ago)
    submissions.each_with_index do |submission, index|
      ApplicationMailer.dear_abby_poll_submission(ARGV[1], submission, (index + 1)).deliver
    end
    puts "Sending #{submissions.size} polls to #{ARGV[1] || '' }"
  end
  
  desc "Test"
  task :test => :environment do
    puts "Testing"
  end
end
