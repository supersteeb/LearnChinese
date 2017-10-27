class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]

  helper_method :sort_column, :sort_direction

  # GET /words
  # GET /words.json
  def index
    @words = Word.all.order(sort_column + " " + sort_direction)
    if params[:search]
      @words = Word.search(params[:search]).order("created_at DESC")
    else
      @recipes = Word.all.order("created_at DESC")
    end
  end

  def english
    @words = Word.all.order(sort_column + " " + sort_direction)
  end

  def characters
    @words = Word.all
  end

  def pinyin
    @words = Word.all
  end

  # GET /words/1
  # GET /words/1.json
  def show
  end

  # GET /words/new
  def new
    @word = Word.new
  end

  # GET /words/1/edit
  def edit
  end

  # POST /words
  # POST /words.json
  def create
    @word = Word.new(word_params)

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'Word was successfully created.' }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    respond_to do |format|
      if @word.update(word_params)
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to words_url, notice: 'Word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit(:character, :meaning, :pinyin, :part_of_speech, :mnemonic)
    end

    def sort_column
      Word.column_names.include?(params[:sort]) ? params[:sort] : "meaning"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
