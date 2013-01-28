class ToolSuggestionsMailer < ActionMailer::Base
  default from: Settings.email.from, to: Settings.email.to

  def new_suggestion(user, suggestion)
    @suggestion = suggestion

    mail reply_to: user.email, subject: "Tool suggestion from #{user.full_name}"
  end
end