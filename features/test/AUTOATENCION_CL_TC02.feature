Feature: AUTOATENCION_CL_TC02
     @wip
   Scenario: TC02
      Given Abierta la aplicacion de autoatencion RPOST "AUTOATENCION_TC02"
      # When En monitor configuro rut del empleador
      # And Guardo y salgo del monitor
      And Ingreso varios productos diferentes 2
      And Realizo click en pagar
      And Ingreso rut de comprador "rut_funcionario"
      And Selecciono tarjeta "ripley_debit_card"
      And Elijo la cantidad de Ticket de Cambio 2
      And Imprimo boleta
      And Realizo click en finalizar
      Then Verifico página de scan de productos presente