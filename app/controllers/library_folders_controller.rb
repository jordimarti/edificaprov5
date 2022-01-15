class LibraryFoldersController < ApplicationController
  before_action :set_library_folder, only: %i[ show edit update destroy ]

  # GET /library_folders or /library_folders.json
  def index
    @library_folders = LibraryFolder.all
  end

  # GET /library_folders/1 or /library_folders/1.json
  def show
  end

  # GET /library_folders/new
  def new
    @library_folder = LibraryFolder.new
  end

  # GET /library_folders/1/edit
  def edit
  end

  # POST /library_folders or /library_folders.json
  def create
    @library_folder = LibraryFolder.new(library_folder_params)

    respond_to do |format|
      if @library_folder.save
        format.html { redirect_to library_folder_url(@library_folder), notice: "Library folder was successfully created." }
        format.json { render :show, status: :created, location: @library_folder }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @library_folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /library_folders/1 or /library_folders/1.json
  def update
    respond_to do |format|
      if @library_folder.update(library_folder_params)
        format.html { redirect_to library_folder_url(@library_folder), notice: "Library folder was successfully updated." }
        format.json { render :show, status: :ok, location: @library_folder }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @library_folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /library_folders/1 or /library_folders/1.json
  def destroy
    @library_folder.destroy

    respond_to do |format|
      format.html { redirect_to library_folders_url, notice: "Library folder was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_library_folder
      @library_folder = LibraryFolder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def library_folder_params
      params.require(:library_folder).permit(:channel_id, :name)
    end
end
