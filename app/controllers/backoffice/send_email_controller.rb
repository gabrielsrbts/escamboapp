class Backoffice::SendEmailController < ApplicationController

def edit
	@admin = Admin.find(params[:id])

  respond_to do |format|
  	format.js
  end
end

def create
  begin
    AdminMailer.send_message(current_admin, params[:'recipient-name'], params[:'subject'], params[:'message-text']).deliver_now
    @notify_message = "Email enviado com sucesso!", "success"
  rescue Exception => e
    @notify_message = "Erro ao enviar email! Tente novamente mais tarde. Erro: #{e}", "error"
  end

  respond_to do |format|
  	format.js
  end
end


end
