class TestdataController < ApplicationController
  def servicio_nombre
    @id = 1
    @nombre = Faker::Lorem.sentence
    respond_to do |format|
      format.xml
    end
  end

end
