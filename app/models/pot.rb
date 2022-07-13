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
#
class Pot < ApplicationRecord
  # Se crean las validaciones para nuestro modelo y se cambian los mensajes para ver en la base de datos
  # para crear la validación iniciamos con el metodo validate pasamos como simbolo el nombre del atributo el cual queremos validar :name seguido de la validación presence
  validates :name, presence: { message: 'El nombre es requerido'}
  validates :description, presence: { message: 'La descripción es requerida'}
  validates :name, length: { maximum:200, minimum: 2}

  # validaciones más comunes o usadas
  # uniqueness =  permite solo valores unicos en nuestra tabla
  # length = logitud de caracteres para un valor
  # presence = obligatoriamente un valor debe encontrarse presente ya sea para la creación o actualización
  # format = formato en especifico que se necesita persistir sirve para expresiones regulares
end
