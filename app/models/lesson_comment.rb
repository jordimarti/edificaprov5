class LessonComment < ApplicationRecord
  include ActionView::RecordIdentifier
  belongs_to :user
  belongs_to :lesson

  has_rich_text :content

  after_create_commit do
    lesson = Lesson.find(self.lesson_id)
    broadcast_append_to :lesson_comments, target: "comments_#{dom_id(lesson)}", partial: "lesson_comments/lesson_comment", locals: { lesson_comment: self }
  end
end
