Given(/^Abierta la aplicacion de autoatencion RPOST "([^"]*)"$/) do |cdp|
    $name= cdp
    $log.set_cdp(cdp)
    @ProductScan = ProductScanPage.new    
end

Then("Verifico página de scan de productos presente") do
    @ProductScan.verificar_pagina
end

Then("Realizo click en digitar codigo de producto") do
    @ProductScan.click_ingresar_producto
end

Then("Ingreso numero de producto") do
    $cantidad_productos = 1
    @ProductScan.ingresar_codigo_producto
end

Then("Realizo click en RCLUBES") do
    @ProductScan.click_RCLUBES
end

Then("Ingreso codigo RCLUBES") do
    @ProductScan.ingresarRClubes
end

Then("Realizo click en Ingresar Codigo de Descuento") do
    @ProductScan.click_ingresar_descuento
end

Then("Ingreso Codigo de Descuento") do
    @ProductScan.ingresar_codigo_descuento
end

Then("Ingreso varios productos diferentes {int}") do |cant|
    $cantidad_productos = cant
    @ProductScan.ingresar_productos_diferentes(cant)
  end

  Then("Ingreso varios productos con el mismo SKU {int}") do |cant|
    $cantidad_productos = cant
    @ProductScan.ingresar_productos_iguales(cant)
  end
  

Then("Realizo click en pagar") do
    @ProductScan.click_pagar
end


Then("Ingreso rut de comprador {string}") do |tipo_comprador|
    @ProductScan.ingresar_rut_comprador(tipo_comprador)
end


