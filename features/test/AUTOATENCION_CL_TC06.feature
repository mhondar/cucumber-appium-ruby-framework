Feature: AUTOATENCION_CL_TC06

   Scenario: TC06
      Given Abierta la aplicacion de autoatencion RPOST "AUTOATENCION_TC06"
      # Then En monitor configuro rut del empleador
      # And Guardo y salgo del monitor
      And Realizo click en digitar codigo de producto
      And Ingreso numero de producto
      And Realizo click en pagar
      And Ingreso rut de comprador "rut_funcionario"
      And Selecciono tarjeta "ripley_card"
      And Selecciono cuotas definidas por cliente "10"
      And Realizo click en Continuar
      And Imprimo boleta
      And Realizo click en finalizar
      Then Verifico página de scan de productos presente