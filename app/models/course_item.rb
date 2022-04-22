class CourseItem < ApplicationRecord
  include ActionView::RecordIdentifier
  belongs_to :course
  acts_as_list scope: :course

  enum category: [:section, :lesson, :quizz]

  after_create_commit do
    course = Course.find(self.course_id)
    broadcast_append_to :course_items, target: "existing_items_#{dom_id(course)}", partial: "course_items/course_item", locals: { course_item: self }
  end
end
