class MainController < ApplicationController
  # podemos un layout para todas las vistas por defecto
  # layout 'custome'
  def welcome
    # variable de instancia enviada a la vista main
    # @name = 'cody'
    # Podemos usar el layout renderizando al metodo
    # render layout: 'custome'
    # Podemos utilizar el layout directo al metodo cuando queramos que el metodo muestre una vista diferente
    # render layout: 'application'
    redirect_to pots_path
  end
end