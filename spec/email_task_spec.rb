require 'spec_helper'

Rails.application.load_tasks

describe "#send_to_dearabby" do
  it "sends letters from past 24 hours to dearabby" do
    Letter.create(message: "hi")
    Letter.create(created_at: 5.days.ago)
    mail = double(ApplicationMailer)
    expect(ApplicationMailer).to receive(:dear_abby_submission).and_return(mail)
    expect(mail).to receive(:deliver).once
    Rake::Task["email:send_to_dearabby"].invoke
  end
end