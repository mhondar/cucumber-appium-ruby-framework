Then("En monitor configuro rut del empleador") do
    @monitorPage = MonitorPage.new
    @monitorPage.click_cambiar_vendedor
    @monitorPage.ingresar_rut_vendedor

end

Then("Guardo y salgo del monitor") do
    @monitorPage.guardar_y_Salir
end
