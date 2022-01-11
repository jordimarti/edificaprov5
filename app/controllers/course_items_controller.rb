class CourseItemsController < ApplicationController
  def update
    @course_item = GlobalID::Locator.locate_signed(params[:sgid])
    @course_item.insert_at(params[:position])
  end
end