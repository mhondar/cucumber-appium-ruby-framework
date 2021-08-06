Then(/^Selecciono tarjeta "([^"]*)"$/) do |tipoPago|
    @Pago = PagoPage.new 
    @Pago.seleccionar_tarjeta(tipoPago)
end

Then("Realizo click en Continuar") do
    @Pago.click_continuar 
end

Then("Selecciono cuotas predefinidas de forma aleatoria") do
    @Pago.seleccionar_cantidad_cuotas_aleatorias 
end

Then("Selecciono cuotas definidas por cliente {string}") do |cuotas|
    @Pago.seleccionar_otra_cantidad(cuotas)
end
