require 'test_helper'

class ZombieMailerTest < ActionMailer::TestCase
  test "name_change" do
    mail = ZombieMailer.name_change
    assert_equal "Name change", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "deleted_tweet" do
    mail = ZombieMailer.deleted_tweet
    assert_equal "Deleted tweet", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
