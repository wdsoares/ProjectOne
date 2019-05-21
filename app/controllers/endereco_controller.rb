class EnderecoController < ApplicationController

    $iduser = '0'

    def new
        $iduser = params[:id_user]
    end

    def create
        user = User.find_by("id = ?", $iduser)
        @endereco = Endereco.new(endereco_params)
        if (user.present?)
          @endereco.save
          @end = Endereco.order("created_at").last
          user.update_attribute(:enderecoID, @end.id)
          redirect_to home_path
        else
          flash.now[:notice] = "Erro ao cadastrar endereço!"
          render :new
        end
      end

      private

      def endereco_params
        params.require(:endereco).permit(:rua, :numero, :complemento, :cep, :bairro, :cidade)
      end
end
