class Contact < ApplicationRecord
  belongs_to :kind

  # def birthdate_br
  #   I18n.l(self.birthdate) unless self.birthdate.blank?
  # end

  def to_br
    {
      name: self.name,
      email: self.email,
      birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
    }
  end

  # def author
  #   'Diego Souza'
  # end

  # def kind_description
  #   self.kind.description
  # end

  # def as_json(options={})
  #   # super serve para invocar o as_json original
  #   super(
  #     root: true,
  #     methods: [:kind_description, :author],
  #     # com include o resultado fica aninhado no json de retorno
  #     # com a adição do método kind_description, posso retornar tudo sem estar alinhado
  #     include: { kind: { only: :description }}
  #   )
  # end
end
