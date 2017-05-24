class Backoffice::CategoriesController::CategoryService

  attr_accessor :category #Como vamos receber uma categoria, fazer algo e depois devolver temos que dar acesso

  def self.create(params_category)
    @category = Category.new(params_category) #o @category é o :category do attr_accessor pois declaramos que :category é um atributo da classe;

    if @category.valid?
      @category.save!
    end

    @category
  end
end
