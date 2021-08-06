When("Elijo la cantidad de Ticket de Cambio {int}") do |cant|
    @step3 = Step3.new
    @step3.seleccionar_cantidad_ticket_cambio(cant)
  end

Then("Imprimo boleta") do
    @step3 = Step3.new
    @step3.seleccionar_Imprimir_Boleta
end

Then("Realizo click en finalizar") do
    @step3.click_finalizar_compra
end