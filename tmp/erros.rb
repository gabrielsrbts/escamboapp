def levantar_erro
  begin
    p ">>>>>>> Antes do erro"
    raise "Erro de alguma coisa!"
    p "Depois do erro"
  rescue Exception => e
    p "Caso haja erro ele se recupera e continua aqui.. #{e}"
  ensure
    p "Garantida a impressao, de qlqr forma.."
  end
end

levantar_erro
