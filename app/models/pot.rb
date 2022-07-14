# == Schema Information
#
# Table name: pots
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  visible     :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#
class Pot < ApplicationRecord
  # Filas para los slug
  extend FriendlyId
  friendly_id :name, use: :slugged # generamos el campo slug a partir del nombre


  # Se crean las validaciones para nuestro modelo y se cambian los mensajes para ver en la base de datos
  # para crear la validación iniciamos con el metodo validate pasamos como simbolo el nombre del atributo el cual queremos validar :name seguido de la validación presence
  validates :name, presence: { message: 'El nombre es requerido'}
  validates :description, presence: { message: 'La descripción es requerida'}
  validates :name, length: { maximum:200, minimum: 2}

   has_one_attached :image, :dependent => :destroy # con esto nos aseguramos de destruir la imagen

  has_many :pot_categories # relación uno a muchos con la categoria
  has_many :categories, through: :pot_categories # join entre las tablas

  accepts_nested_attributes_for :categories # podemos acceder a las relaciones con las categorias

  # metodo para las categorias por default, si no existen no pone nada encima de la foto se aplica en el _partial
  def category_default
    return self.categories.first.name if self.categories.any?
    'Sin categoria'
  end
  # validaciones más comunes o usadas
  # uniqueness =  permite solo valores unicos en nuestra tabla
  # length = logitud de caracteres para un valor
  # presence = obligatoriamente un valor debe encontrarse presente ya sea para la creación o actualización
  # format = formato en especifico que se necesita persistir sirve para expresiones regulares
end
