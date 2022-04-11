class CourseItemsController < ApplicationController
  
  def index
    @course = Course.friendly.find(params[:id])
    puts @course.title
    @course_items = @course.course_items
  end

  def show
    @course_item = CourseItem.find(params[:id])
  end

  def new
    @course_item = CourseItem.new
    @course = Course.find(params[:course_id])
  end

  def edit
    @course_item = CourseItem.find(params[:id])
    @course = @course_item.course_id
  end

  def create
    @course_item = CourseItem.new(course_item_params)
    @course = Course.find(@course_item.course_id)
    
    respond_to do |format|
      if @course_item.save
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(
            "new_course_item",
            partial: "course_items/form",
            locals: { course_item: CourseItem.new, course_id: @course_item.course_id }
          )
        }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @community_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @course_item = GlobalID::Locator.locate_signed(params[:sgid])
    @course_item.insert_at(params[:position])
  end

  private
    def course_item_params
      params.require(:course_item).permit(:user_id, :course_id, :name, :category, :position)
    end
end