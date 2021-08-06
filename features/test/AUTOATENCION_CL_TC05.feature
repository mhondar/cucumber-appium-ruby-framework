Feature: AUTOATENCION_CL_TC05

   Scenario: TC05
      Given Abierta la aplicacion de autoatencion RPOST "AUTOATENCION_TC05"
      # Then En monitor configuro rut del empleador
      # And Guardo y salgo del monitor
      And Ingreso varios productos diferentes 7
      And Realizo click en pagar
      And Ingreso rut de comprador "rut_cliente"
      And Selecciono tarjeta "ripley_card"
      And Selecciono cuotas predefinidas de forma aleatoria
      And Realizo click en Continuar
      And Elijo la cantidad de Ticket de Cambio 5
      And Imprimo boleta
      And Realizo click en finalizar
      Then Verifico página de scan de productos presente