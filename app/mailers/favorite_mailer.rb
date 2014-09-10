class FavoriteMailer < ActionMailer::Base
  default from: "youremail@example.com"

  def new_comment(user, post, comment)
    @user = user
    @post = post
    @comment = comment

    headers["Message-ID"] = "<comments/#{@comment.id}@devtheory-bloccit.com>"
    headers["In-Reply-To"] = "<post/#{@post.id}@devtheory-bloccit.com>"
    headers["References"] = "<post/#{@post.id}@devtheory-bloccit.com>"

    mail(to: user.email, subject: "New comment on #{@post.title}")
  end
end
