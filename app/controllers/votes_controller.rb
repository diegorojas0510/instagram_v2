class VotesController < ApplicationController
  # Antes de la opción crear vamos a obtener el pot por medio de la url del metodo privado set_pot
  before_action :set_pot, only: [:create]
  before_action :set_comment, only: [:create]

  before_action :set_votable, only: [:create]


  def create
    Vote.create votable:@votable
    redirect_to @pot, notice: 'Gracias por tus comentarios'
  end

  private

  # Si el comentario existe sera un voto al comentario
  def set_votable
    if @comment
      @votable = @comment
    else
      @votable = @pot # en caso que no exista sera un voto al pots
    end
  end

  def set_comment
    @comment = Comment.find params[:comment_id] if params.has_key? :comment_id # intentamos obtener el comentario siempre y cuando el parametro comment_id se encuentre en los parametros
  end
  # se obtiene el producto mediante el parametro con slug en la url slug da el nombre del producto más no expone el id
  def set_pot
    @pot = Pot.find_by slug: params[:pot_id] # slug: params[:pot_id] para obtner el nombre en la url
  end
end