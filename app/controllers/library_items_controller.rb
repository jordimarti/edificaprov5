class LibraryItemsController < ApplicationController
  before_action :set_library_item, only: %i[ show edit update destroy ]

  # GET /library_items or /library_items.json
  def index
    @library_items = LibraryItem.all
  end

  # GET /library_items/1 or /library_items/1.json
  def show
  end

  # GET /library_items/new
  def new
    @library_item = LibraryItem.new
  end

  # GET /library_items/1/edit
  def edit
  end

  # POST /library_items or /library_items.json
  def create
    @library_item = LibraryItem.new(library_item_params)

    respond_to do |format|
      if @library_item.save
        format.html { redirect_to library_item_url(@library_item), notice: "Library item was successfully created." }
        format.json { render :show, status: :created, location: @library_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @library_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /library_items/1 or /library_items/1.json
  def update
    respond_to do |format|
      if @library_item.update(library_item_params)
        format.html { redirect_to library_item_url(@library_item), notice: "Library item was successfully updated." }
        format.json { render :show, status: :ok, location: @library_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @library_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /library_items/1 or /library_items/1.json
  def destroy
    @library_item.destroy

    respond_to do |format|
      format.html { redirect_to library_items_url, notice: "Library item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_library_item
      @library_item = LibraryItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def library_item_params
      params.require(:library_item).permit(:library_folder_id, :category, :itemid)
    end
end
